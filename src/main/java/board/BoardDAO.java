package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() {	//db �����ϱ�
		try {
			String dbURL = "jdbc:mysql://localhost:3306/asumcha";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			rs = pstm.executeQuery();	//rs�� ���� ������ ����� �޾ƿ�
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return "";	//DB����
	}
	

	
	
	//�Խñ� �Ἥ db�� ���� �ѱ��
	public int write(String post_Title, String post_Email, String post_Content, String post_Nickname) {
		
		String SQL = "INSERT INTO POSTS VALUES (?, ?, ?, ?, ?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, getNext());
			pstm.setString(2, post_Email);
			pstm.setString(3, post_Title);
			pstm.setString(4, post_Content);
			pstm.setString(5, getDate());
			pstm.setString(6, getNickname(post_Email));
			
			return pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//db����//
	}
	
	public String getNickname(String post_Email) {
	    String SQL = "SELECT user_Nickname FROM USERS WHERE user_Email = ?";
	    try {
	        PreparedStatement pstm = conn.prepareStatement(SQL);
	        pstm.setString(1, post_Email);
	        ResultSet rs = pstm.executeQuery();
	        
	        if (rs.next()) {
	            return rs.getString("user_Nickname");
	        }
	    } catch (Exception e) {
	        // 예외 처리
	    }
	    return null; // 데이터베이스에서 닉네임을 찾지 못한 경우 null 반환
	}	

	
	
	
	//getNext() 메서드는 가장 최근의 게시글 번호에 1을 더한 값을 반환합니다.
	public int getNext() {
		
		//SQL 쿼리문을 준비합니다. 해당 쿼리는 posts 테이블에서 post_Num을 내림차순으로 정렬한 후 가장 첫 번째 행의 post_Num을 선택합니다.
		String SQL = "select post_Num from posts order by post_Num desc";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			rs = pstm.executeQuery();
			if(rs.next()) {
				//rs.next()를 호출하여 결과 집합에서 다음 행이 있는지 확인합니다. 다음 행이 존재하면 해당 행의 post_Num에 1을 더한 값을 반환합니다. 결과가 없으면 1을 반환합니다.
				return rs.getInt(1)+1;
			}
			//아무것도 없으면 그게 게시물 1번
			return 1;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	
	//getlist(int pageNumber) 메서드는 특정 페이지에 해당하는 게시글 목록을 가져옵니다. 매개변수인 pageNumber(현재 페이지)는 가져올 페이지의 번호를 나타냅니다.
	public ArrayList<Board> getlist(int pageNumber){

		//먼저 SQL 쿼리문을 준비합니다. 해당 쿼리는 posts 테이블에서 post_Num이 주어진 값보다 작은 게시글을 가져옵니다. 결과는 post_Num을 기준으로 내림차순으로 정렬되며, 최대 10개의 결과만 가져옵니다.
		String SQL = "select * from posts where post_Num < ? ORDER BY post_Num DESC LIMIT 10";	
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			
			//? 위치에 가져올 게시글의 시작 번호를 설정합니다. getNext() 메서드는 가장 최근의 게시글 번호에 1을 더한 값을 반환하며, 페이지 번호를 이용하여 가져와야 할 게시글 범위를 계산합니다.
			pstm.setInt(1, getNext()-(pageNumber-1)*10); 	
			rs = pstm.executeQuery();	//쿼리를 실행하고 결과를 rs 변수에 저장합니다.
			
			//while 루프를 사용하여 결과 집합에서 각 행을 읽어와 Board 객체를 생성합니다. Board 객체에는 게시글의 번호, 닉네임, 제목, 작성일이 설정됩니다.
			while(rs.next()) {
				Board board = new Board();
				board.setPost_Num(rs.getInt(1));
				board.setPost_Nickname(rs.getString(6));
				board.setPost_Title(rs.getString(3));
				board.setPost_Date(rs.getString(5));

				//생성한 Board 객체를 list라는 ArrayList에 추가합니다.
				list.add(board);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return list;
	}
	
	
	

	// nextPage(int pageNumber) 메서드는 주어진 페이지 번호보다 이전 페이지에 게시글이 존재하는지 여부를 확인합니다.
	public boolean nextPage(int pageNumber){	//매개변수인 pageNumber는 현재 페이지 번호를 나타냅니다.
		
		String SQL = "SELECT * FROM posts WHERE post_Num < ?";	//SQL 쿼리문을 준비합니다. 해당 쿼리는 posts 테이블에서 post_Num이 주어진 값보다 작은 게시글을 검색합니다.
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, getNext()-(pageNumber -1)*10);	//? 위치에 가져올 게시글의 시작 번호를 설정합니다.
			rs = pstm.executeQuery();	//쿼리를 실행하고 결과를 rs 변수에 저장합니다.
			while (rs.next()) {	//rs.next()를 호출하여 결과 집합에서 다음 행이 있는지 확인합니다. 다음 행이 존재하면 true를 반환합니다. 이는 이전 페이지에 게시글이 존재함을 의미합니다.
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	
	
	
	//getBoard(int post_Num) 메서드는 주어진 게시글 번호에 해당하는 게시글 정보를 가져옵니다. 매개변수인 post_Num은 게시글 번호를 나타냅니다.
	public Board getBoard(int post_Num)
	{
		String SQL = "SELECT * FROM posts WHERE post_Num = ?"; 	//SQL 쿼리문을 준비합니다. 해당 쿼리는 posts 테이블에서 post_Num이 주어진 값과 일치하는 게시글을 검색합니다.
	       try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, post_Num);	//PreparedStatement 객체를 생성하고, pstmt.setInt(1, post_Num)을 사용하여 ? 위치에 게시글 번호를 설정합니다.
				rs = pstmt.executeQuery();	//쿼리를 실행하고 결과를 rs 변수에 저장합니다.
				if (rs.next())	//rs.next()를 호출하여 결과 집합에서 다음 행이 있는지 확인합니다. 다음 행이 존재하면 해당 게시글의 정보를 읽어와 Board 객체에 설정합니다.
				{		                
					Board board = new Board();
		       
		            board.setPost_Num(rs.getInt(1));
		            board.setPost_Title(rs.getString(3));
	                board.setPost_Email(rs.getString(2));
	                board.setPost_Date(rs.getString(5));
	                board.setPost_Content(rs.getString(4));
	                board.setPost_Nickname(rs.getString(6));
	                return board;
		        }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return null; 
    }
}

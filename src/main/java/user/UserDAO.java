package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class UserDAO {
	private Connection conn; //db ���� ��ü 
	private PreparedStatement pstm;
	private ResultSet rs; // db ����� ��� ��ü
	
	public UserDAO() {	//dao�����ڿ��� db connection
		try {
			String dbURL = "jdbc:mysql://localhost:3306/asumcha"; //mysql ���� ����
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName("com.mysql.jdbc.Driver");//mysql������ �����ִ� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public List<Integer> getIds() {
        List<Integer> ids = new ArrayList<>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String SQL = "SELECT id FROM users";

        try {
            pstm = conn.prepareStatement(SQL);
            rs = pstm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                ids.add(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 정리
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return ids;
    }
	
	
	
	
	public int login(String user_Email, String user_Password) {
		String SQL = "SELECT user_Password FROM users WHERE user_Email =?";
		try {
			pstm = conn.prepareStatement(SQL);
			pstm.setString(1, user_Email);	//sql Injection���� ��� 1�� ����ǥ�� user�Է�
			rs = pstm.executeQuery();	//���� ����
			if(rs.next()) {
				if(rs.getString(1).equals(user_Password))// rs.getString(1) : select�� ù��° �÷�
					return 1; //����
				else 
					return 0;
			}
			return -1;	//���̵� ����
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //DB����
	}
	public int join(User user) {
	    String checkSQL = "SELECT COUNT(*) FROM users WHERE user_Email = ?";
	    String insertSQL = "INSERT INTO users (user_Name, user_Email, user_Password) VALUES (?, ?, ?)";

	    try {
	        // ���̵� �ߺ� üũ
	        pstm = conn.prepareStatement(checkSQL);
	        pstm.setString(1, user.getUser_Email());
	        rs = pstm.executeQuery();
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            if (count > 0) {
	                return -1; // �̹� �����ϴ� ���̵�
	            }
	        }

	        // ȸ������ ó��
	        pstm = conn.prepareStatement(insertSQL);
	        pstm.setString(1, user.getUser_Name());
	        pstm.setString(2, user.getUser_Email());
	        pstm.setString(3, user.getUser_Password());
	        return pstm.executeUpdate(); // 0�̻� ���� return �� ��� ����
	    } catch (Exception e) {
	        e.printStackTrace(); // ���� ���
	    }
	    return -2; // DB ����
	}
	
	//비밀번호 변경 
	public int editPassword(String password, String Email) {
		PreparedStatement pstm = null;
		
		String updateSQL = "UPDATE users SET user_Password = ? WHERE user_Email = ?";
		int res = 0;	
		
		try {
			pstm = conn.prepareStatement(updateSQL);
			pstm.setString(1, password);
			pstm.setString(2, Email);
			res = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리
			try {
				if (pstm != null) {
					pstm.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
	
	public String getOldPassword(String user_Email) {
	    String SQL = "SELECT user_Password FROM users WHERE user_Email = ?";
	    String oldPassword = null;
	    try {
	        pstm = conn.prepareStatement(SQL);
	        pstm.setString(1, user_Email);
	        rs = pstm.executeQuery();
	        if (rs.next()) {
	            oldPassword = rs.getString("user_Password");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstm != null) {
	                pstm.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return oldPassword;
	}
	
	public int editInfo(String age, String gender, String skill, String nickname,String user_Email) {
	    String SQL = "UPDATE users SET user_Age=?, user_Gender=?, user_Skill=?, user_Nickname=? WHERE user_Email=?";
	    int res = 0;
	    try {
	        pstm = conn.prepareStatement(SQL);
	        pstm.setString(1, age);
	        pstm.setString(2, gender);
	        pstm.setString(3, skill);
	        pstm.setString(4, nickname);
	        pstm.setString(5, user_Email);
	        res = pstm.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstm != null) {
	                pstm.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return res;
	}

	
}

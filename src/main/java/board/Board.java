package board;

public class Board {
	private int post_Num;
	private String post_Email;
	private String post_Title;
	private String post_Date;
	private String post_Content;
	private String post_Nickname;
	
	
	public int getPost_Num() {
		return post_Num;
	}
	public void setPost_Num(int post_Num) {
		this.post_Num = post_Num;
	}
	public String getPost_Email() {
		return post_Email;
	}
	public void setPost_Email(String post_Email) {
		this.post_Email = post_Email;
	}
	public String getPost_Title() {
		return post_Title;
	}
	public void setPost_Title(String post_Title) {
		this.post_Title = post_Title;
	}
	public String getPost_Date() {
		System.out.println(post_Date);
		return post_Date;
	}
	public void setPost_Date(String post_Date) {
		this.post_Date = post_Date;
	}
	public String getPost_Content() {
		return post_Content;
	}
	public void setPost_Content(String post_Content) {
		this.post_Content = post_Content;
	}
	public String getPost_Nickname() {
		return post_Nickname;
	}
	public void setPost_Nickname(String post_Nickname) {
		this.post_Nickname = post_Nickname;
	}
	
	}

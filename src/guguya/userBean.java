package guguya;
import java.io.Serializable;

//사용자 객체
public class userBean implements java.io.Serializable{
	private String id;	//아이디
	private String pw;	//비밀번호
	private String email;	//이메일
	private String auth;	//권한-관리자0,기업1,개인2

	public userBean() {
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}

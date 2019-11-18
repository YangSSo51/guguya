package guguya;
import java.io.Serializable;

//사용자 객체
public class individualBean implements java.io.Serializable{
	private String name;
	private String pw;
	private int age;
	private int user;
	
	public individualBean() {
		System.out.println(age);
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
}

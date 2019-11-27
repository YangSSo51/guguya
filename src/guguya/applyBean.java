package guguya;
import java.io.Serializable;

// 지원 상태 객체
public class applyBean implements java.io.Serializable{ 

	private int app_no;
	private int proj_no;
	private int in_no;
	private String result;

	
	public applyBean() {
	}
	
	public void setApp_no(int app_no) {
		this.app_no  = app_no;
	}
	public int getApp_no() {
		return app_no;
	}
	public void setProj_no(int proj_no) {
		this.proj_no  = proj_no;
	}
	public int getProj_no() {
		return proj_no;
	}
	public void setIn_no(int in_no) {
		this.in_no  = in_no;
	}
	public int getIn_no() {
		return in_no;
	}
	public void setResult(String result) {
		this.result  = result;
	}
	public String getResult() {
		return result;
	}
}



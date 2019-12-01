package guguya;
import java.io.Serializable;

// 프로젝트 객체
public class boardBean implements java.io.Serializable{ 

	private int context_number;
	private String userid;
	private String title;
	private String write_time;
	private String contents;
	private String file;
	
	public boardBean() {}

	public void setcontext_number(int context_number) {
		this.context_number = context_number;
	}
	public int getcontext_number() {
		return context_number;
	}
	public void setuserid(String userid) {
		this.userid = userid;
	}
	public String getuserid() {
		return userid;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String gettitle() {
		return title;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public String getWrite_time() {
		return write_time;
	}
	public void setcontents(String contents) {
		this.contents = contents;
	}
	public String getcontents() {
		return contents;
	}
	public void setfile(String file) {
		this.file = file;
	}
	public String getfile() {
		return file;
	}
}



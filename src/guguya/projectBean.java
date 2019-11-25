package guguya;
import java.io.Serializable;

// 프로젝트 객체
public class projectBean implements java.io.Serializable{ 

	private int proj_no;
	private int en_no;
	private String proj_name;
	private String proj_desc;
	private String proj_file;
	private String write_time;
	
	public projectBean() {
	}
	
	public void setProj_no(int proj_no) {
		this.proj_no  = proj_no;
	}
	public int getProj_no() {
		return proj_no;
	}
	public void setEn_no(int en_no) {
		this.en_no = en_no;
	}
	public int getEn_no() {
		return en_no;
	}
	public void setProj_name(String proj_name) {
		this.proj_name = proj_name;
	}
	public String getProj_name() {
		return proj_name;
	}
	public void setProj_desc(String proj_desc) {
		this.proj_desc = proj_desc;
	}
	public String getProj_desc() {
		return proj_desc;
	}
	public void setFile(String proj_file) {
		this.proj_file = proj_file;
	}
	public String getFile() {
		return proj_file;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public String getWrite_time() {
		return write_time;
	}
}



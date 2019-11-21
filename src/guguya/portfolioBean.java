package guguya;
import java.io.Serializable;

public class portfolioBean implements java.io.Serializable {

	private int proj_no;
	private int en_no;
	private String proj_name;
	private String proj_desc;
	private String file;
	private String write_time;
	
	public portfolioBean() {
	}
	
	public void setProj_no(int proj_no) {
		this.proj_no  = proj_no;
	}
	public int getProj_no() {
		return proj_no;
	}
}

package guguya;
import java.io.Serializable;

public class portfolioBean implements java.io.Serializable {

	private int port_no;
	private int in_no;
	private String port_desc;
	private String port_file;
	private String write_time;
	
	public portfolioBean() {
	}
	
	public void setPort_no(int port_no) {
		this.port_no  = port_no;
	}
	public int getPort_no() {
		return port_no;
	}
	public void setIn_no(int in_no) {
		this.in_no  = in_no;
	}
	public int getIn_no() {
		return in_no;
	}
	public void setPort_desc(String port_desc) {
		this.port_desc  = port_desc;
	}
	public String getPort_desc() {
		return port_desc;
	}
	public void setFile(String port_file) {
		this.port_file  = port_file;
	}
	public String getFile() {
		return port_file;
	}
	public void setWrite_time(String write_time) {
		this.write_time  = write_time;
	}
	public String getWrite_time() {
		return write_time;
	}
}

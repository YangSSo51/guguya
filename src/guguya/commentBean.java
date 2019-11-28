package guguya;

public class commentBean {
	private int context_number;
	private int comment_number;
	private String userid;
	private String comment;
	private String write_time;
	
	public commentBean() {}

	public void setcontext_number(int context_number) {
		this.context_number = context_number;
	}
	public int getcontext_number() {
		return context_number;
	}
	public void setcomment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public int getcomment_number() {
		return comment_number;
	}
	public void setuserid(String userid) {
		this.userid = userid;
	}
	public String getuserid() {
		return userid;
	}
	public void setcomment(String comment) {
		this.comment = comment;
	}
	public String getcomment() {
		return comment;
	}
	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}
	public String getWrite_time() {
		return write_time;
	}

}
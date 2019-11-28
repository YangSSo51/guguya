package guguya;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class commentMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	// Connection con = dbcon.getConnection();

	public boolean commentUpload(commentBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert comment(context_number, comment_number, userID, comment, write_time) values(?,?,?,?,?)";

			Date date = new Date();

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getcontext_number());
			pstmt.setInt(2, bean.getcomment_number());
			pstmt.setString(3, bean.getuserid());
			pstmt.setString(4, bean.getcomment());
			pstmt.setString(5, bean.getWrite_time());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return flag;
	}

	// comment 리스트 반환
	public ArrayList<commentBean> commentList() throws ClassNotFoundException, SQLException {
		ArrayList<commentBean> list = new ArrayList<commentBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "select * from comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				commentBean bean = new commentBean();
				bean.setcontext_number(rs.getInt("context_number"));
				bean.setcomment_number(rs.getInt("comment_number"));
				bean.setuserid(rs.getString("userID"));
				bean.setcomment(rs.getString("comment"));
				bean.setWrite_time(rs.getString("write_time"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return list;
	}
	
	//delete
	public boolean deleteComment(int context_number, int comment_number) throws ClassNotFoundException, SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			System.out.println("context = " + context_number + "/comment = "+ comment_number + "\n");
			sql = "delete from comment where context_number = ? and comment_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, context_number);
			pstmt.setInt(2, comment_number);
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		
		return flag;
	}
	
	// 마지막 context_number return
	public int getLastCommentNumber(int context_number) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int number = 0;
		try {
			con = dbcon.getConnection();
			sql = "select comment_number from comment where context_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, context_number);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				number = rs.getInt("comment_number");
				System.out.println("등록된 댓글 번호 = " + number + "\n");
			}
		} finally {
			con.close();
		}
		return number;
	}
}
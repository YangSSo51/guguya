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

	public boolean boardUpload(commentBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert comment(context_number, userID, comment, write_time) values(?,?,?,?)";

			Date date = new Date();

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getcontext_number());
			pstmt.setString(2, bean.getuserid());
			pstmt.setString(3, bean.getcomment());
			pstmt.setString(4, bean.getWrite_time());
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
}
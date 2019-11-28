package guguya;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class fileMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	
	public boolean fileUpload(fileBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert file(filename) values(?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getfilename());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return flag;
	}
}

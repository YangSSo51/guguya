package guguya;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import guguya.dbCon;
import guguya.projectBean;



public class projectMigrate {

	static dbCon dbcon = new dbCon();
	static Connection con = dbcon.getConnection();
	
	public boolean projectUpload(projectBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			// con = dbcon.getConnection();
			sql = "insert project(proj_name, proj_desc, en_no, write_time) values(?,?,?,?)";
			
			Date date = new Date();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getProj_name());
			pstmt.setString(2, bean.getProj_desc());
			pstmt.setInt(3, bean.getEn_no());
			pstmt.setString(4, date.toString());
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return flag;
	}
	
	//user_no으로 en_no가져오기 (보류)
	public int getEnno(int user_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int en_no = -1;
		try {
			// con = dbcon.getConnection();
			sql = "select en_no from enterprise where user_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,user_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				en_no = rs.getInt("en_no");
			}
			return en_no;
		}finally {
			
		}
	}	
}

package guguya;

import java.sql.*;
import java.util.ArrayList;
import guguya.dbCon;
import guguya.projectBean;


public class projectMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	
	public boolean projectUpload(projectBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = (Connection)dbcon;
			sql = "insert project(proj_name, proj_desc, write_time)"+ "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getProj_name());
			pstmt.setString(2, bean.getProj_desc());
			pstmt.setString(3, bean.getWrite_time());
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return flag;
	}
	
	//회원 id로 en_no가져오기 (보류)
	public int getEn_No(String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int user_no=1;
		try {
			con = (Connection)dbcon;
			sql = "select * from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_no=rs.getInt("user_no");
			}
			return user_no;
		}finally {
			
		}
	}	
}

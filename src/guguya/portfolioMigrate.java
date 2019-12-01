package guguya;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import guguya.dbCon;
import guguya.portfolioBean;


public class portfolioMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	
	public boolean portfolioUpload(portfolioBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert portfolio(port_desc, in_no, write_time) values(?,?,?)";
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String time = fm.format(date);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPort_desc());
			pstmt.setInt(2, bean.getIn_no());
			pstmt.setString(3, time);
			
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return flag;
	}
	
	//user_no으로 in_no가져오기 
	public int getInno(int user_no) throws SQLException {
		PreparedStatement pstmt = null;			
		ResultSet rs = null;
		String sql=null;
		int in_no = -1;
		try {
			con = dbcon.getConnection();
			sql = "select in_no from individual where user_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,user_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				in_no = rs.getInt("in_no");
			}
			return in_no;
		}finally {
			con.close();
		}
	}
	
	// in_no를 통해 회원의 portfolio 상세 정보 얻기
	public portfolioBean getPortfolio(int id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		portfolioBean bean = new portfolioBean();
		try {
			con = dbcon.getConnection();
			sql = "select * from portfolio where in_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setPort_no(rs.getInt("port_no"));
				bean.setPort_desc(rs.getString("port_desc"));
				bean.setWrite_time(rs.getString("write_time"));
				bean.setIn_no(rs.getInt("in_no"));
				bean.setPort_file(rs.getString("port_file"));
			}
		}finally {
			con.close();
		}
		return bean;	
	}
	
	// 이미 존재하는 portfolio에 접근해서 업데이트해줌 (보류)
	public boolean portfolioUpdate(portfolioBean bean) throws SQLException { 

		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "update portfolio set port_desc=? where in_no=?"; // 나중에 file도 넣어야함!
			pstmt = con.prepareStatement(sql);
			//현재 user_no를 받아와서 넣어줘야함
			pstmt.setString(1, bean.getPort_desc());
			pstmt.setInt(2,bean.getIn_no());
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return flag;
	}

}
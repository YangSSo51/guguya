package guguya;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import guguya.dbCon;
import guguya.applyBean;

public class applyMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	
	// 지원하기 기능 함수
	public boolean applyProject(applyBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert apply(proj_no, in_no, result) values(?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getProj_no());
			pstmt.setInt(2, bean.getIn_no());
			pstmt.setString(3, bean.getResult());
			
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return flag;
	}
	
	// 지원한적이 있는지 확인
	public boolean applyCheck(int proj_no, int in_no) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "select * from apply where proj_no=? AND in_no=? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proj_no);
			pstmt.setInt(2, in_no);
			
			rs = pstmt.executeQuery();
			flag = rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return flag;
	}
	
	// 해당 프로젝트에 대한 지원자 리스트 조회
	public ArrayList<applyBean> ApplyList() throws ClassNotFoundException, SQLException {
		ArrayList<applyBean> list = new ArrayList<applyBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "select * from project";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				projectBean bean = new projectBean();
				bean.setProj_no(rs.getInt("proj_no"));
				bean.setProj_name(rs.getString("proj_name"));
				bean.setEn_no(rs.getInt("en_no"));
				bean.setWrite_time(rs.getString("write_time"));
				list.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return list;
	}
	
	// 지원한 프로젝트 리스트 조회
	public ArrayList<applyBean> myApplyList(int in_no) throws ClassNotFoundException, SQLException {
		ArrayList<applyBean> list = new ArrayList<applyBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "select * from apply where in_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, in_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				applyBean bean = new applyBean();
				bean.setApp_no(rs.getInt("app_no"));
				bean.setProj_no(rs.getInt("proj_no"));
				bean.setIn_no(rs.getInt("in_no"));
				bean.setResult(rs.getString("result"));
				list.add(bean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return list;
	}	
}

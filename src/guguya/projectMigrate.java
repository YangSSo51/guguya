package guguya;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import guguya.dbCon;
import guguya.projectBean;



public class projectMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	// Connection con = dbcon.getConnection();
	
	public boolean projectUpload(projectBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert project(proj_name, proj_desc, en_no, write_time) values(?,?,?,?)";
			
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String time = fm.format(date);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getProj_name());
			pstmt.setString(2, bean.getProj_desc());
			pstmt.setInt(3, bean.getEn_no());
			pstmt.setString(4, time);
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			con.close();
		}
		return flag;
	}
	
	//user_no으로 en_no가져오기 
	public int getEnno(int user_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int en_no = -1;
		try {
			con = dbcon.getConnection();
			sql = "select en_no from enterprise where user_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,user_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				en_no = rs.getInt("en_no");
			}
			return en_no;
		}finally {
			con.close();
		}
	}
	
	// en_no으로 enterprise name 가져오기 
	public String getEnterpiseName(int en_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		String name = null;
		try {
			con = dbcon.getConnection();
			sql = "select name from enterprise where en_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,en_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
			}
		}finally {
			con.close();
		}
		return name;	
	}
		

	//프로젝트 리스트 조회
	public ArrayList<projectBean> projectList() throws ClassNotFoundException, SQLException {
		ArrayList<projectBean> list = new ArrayList<projectBean>();
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
	
	// project 상세 정보
	public projectBean getProject(int proj_no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		projectBean bean = new projectBean();
		try {
			con = dbcon.getConnection();
			sql = "select * from project where proj_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,proj_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setProj_name(rs.getString("proj_name"));
				bean.setProj_desc(rs.getString("proj_desc"));
				bean.setEn_no(rs.getInt("en_no"));
				bean.setWrite_time(rs.getString("write_time"));
			}
		}finally {
			con.close();
		}
		return bean;	
	}	
	
	// 해당 프로젝트에 대한 지원자 리스트 조회
		public ArrayList<projectBean> myProjectList(int en_no) throws ClassNotFoundException, SQLException {
			ArrayList<projectBean> list = new ArrayList<projectBean>();
			Connection con =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = dbcon.getConnection();
				sql = "select * from project where en_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, en_no);
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
		
	// 프로젝트 삭제
	public boolean deleteProject(int id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "delete from project where proj_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,id);
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return flag;
	}
	// 프로젝트 수정
	public boolean updateProject(projectBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String time = fm.format(date);
				
			con = dbcon.getConnection();
			sql = "update project set proj_name=?, proj_desc=?, write_time=? where proj_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getProj_name());
			pstmt.setString(2, bean.getProj_desc());
			pstmt.setString(3, time);
			pstmt.setInt(4, bean.getProj_no());
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return flag;
	}
}

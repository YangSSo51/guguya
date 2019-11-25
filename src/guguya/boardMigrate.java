package guguya;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class boardMigrate {
	Connection con = null;
	dbCon dbcon = new dbCon();
	// Connection con = dbcon.getConnection();

	public boolean boardUpload(boardBean bean) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "insert board(context_number, userID, title, contents, write_time) values(?,?,?,?,?)";

			Date date = new Date();

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getcontext_number());
			pstmt.setString(2, bean.getuserid());
			pstmt.setString(3, bean.gettitle());
			pstmt.setString(4, bean.getcontents());
			pstmt.setString(5, date.toString());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return flag;
	}

	private Object getcontents() {
		// TODO Auto-generated method stub
		return null;
	}

	// context_number 값으로 context 전체 정보 반환
	public boardBean getOneContext(int context_number) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;		
		boardBean bean = new boardBean();
		ResultSet rs = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "select * from board where context_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, context_number);
			rs = pstmt.executeQuery();
			
			Date date = new Date();
			if(rs.next()) {
				bean.setcontext_number(rs.getInt("context_number"));
				bean.setuserid(rs.getString("userID"));
				bean.settitle(rs.getString("title"));
				bean.setWrite_time(rs.getString("write_time"));
				bean.setcontents(rs.getString("contents"));
				
				return bean;
			}
			
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}finally {
			con.close();
		}
		return null;
	}
	
	//delete
	public void deleteContext(int context_number) throws ClassNotFoundException, SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "delete from board where context_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, context_number);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}
	
	// update
	public boolean updateContext(boardBean bean) throws ClassNotFoundException, SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "update board set title=?, contents=? where context_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.gettitle());
			pstmt.setString(2, bean.getcontents());
			pstmt.setInt(3, bean.getcontext_number());
			if(pstmt.executeUpdate() ==1) {
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
	public int getLastContextNumber() throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int number = 0;
		try {
			con = dbcon.getConnection();
			sql = "select context_number from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				number = rs.getInt("context_number");
			}
		} finally {
			con.close();
		}
		return number;
	}

	// context 리스트 조회
	public ArrayList<boardBean> contextList() throws ClassNotFoundException, SQLException {
		ArrayList<boardBean> list = new ArrayList<boardBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = dbcon.getConnection();
			sql = "select * from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardBean bean = new boardBean();
				bean.setcontext_number(rs.getInt("context_number"));
				bean.setuserid(rs.getString("userid"));
				bean.settitle(rs.getString("title"));
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

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
			sql = "insert board(context_number, userID, title, contents, write_time, file) values(?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getcontext_number());
			pstmt.setString(2, bean.getuserid());
			pstmt.setString(3, bean.gettitle());
			pstmt.setString(4, bean.getcontents());
			pstmt.setString(5, bean.getWrite_time());
			pstmt.setString(6, bean.getfile());
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
				bean.setfile(rs.getString("file"));
				
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
	public boolean deleteContext(int context_number) throws ClassNotFoundException, SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "delete from board where context_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, context_number);
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
	
	// update
	public boolean updateContext(boardBean bean) throws ClassNotFoundException, SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "update board set title=?, contents=?, file=? where context_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.gettitle());
			pstmt.setString(2, bean.getcontents());
			pstmt.setString(3, bean.getfile());
			pstmt.setInt(4, bean.getcontext_number());
			System.out.println(bean.gettitle() + "/" + bean.getcontents() + "/" + bean.getfile() + "/" + bean.getcontext_number());
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
			sql = "select * from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				number = rs.getInt("context_number");
				System.out.println("contextnumber = " + number);
			}
		} finally {
			con.close();
		}
		System.out.println("last contextnumber in migrate= " + number);
		return number;
	}

	// context 리스트 조회
	public ArrayList<boardBean> contextList(int selected_option, int page_number, String name) throws ClassNotFoundException, SQLException {
		ArrayList<boardBean> list = new ArrayList<boardBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			System.out.println("page_number = " + page_number + "\n");
			con = dbcon.getConnection();
			//selected option == 0 -> 작성자, == 1 -> 글제목
			if(selected_option == 0)
				sql = "select * from board where userID LIKE ?";
			else if(selected_option == 1)
				sql = "select * from board where title LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count += 1;
				if((count - (page_number * 10)) > 0) {
					boardBean bean = new boardBean();
					bean.setcontext_number(rs.getInt("context_number"));
					bean.setuserid(rs.getString("userid"));
					bean.settitle(rs.getString("title"));
					bean.setWrite_time(rs.getString("write_time"));
					list.add(bean);
					if((count - (page_number * 10) == 10)) {
						return list;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return list;
	}


	//context 리스트 count
	public int listSize(int selected_option, int page_number, String name) throws ClassNotFoundException, SQLException {
		ArrayList<boardBean> list = new ArrayList<boardBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			System.out.println("page_number = " + page_number + "\n");
			con = dbcon.getConnection();
			//selected option == 0 -> 작성자, == 1 -> 글제목
			if(selected_option == 0)
				sql = "select * from board where userID LIKE ?";
			else if(selected_option == 1)
				sql = "select * from board where title LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				boardBean bean = new boardBean();
				bean.setcontext_number(rs.getInt("context_number"));
				bean.setuserid(rs.getString("userid"));
				bean.settitle(rs.getString("title"));
				bean.setWrite_time(rs.getString("write_time"));
				list.add(bean);
				count += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return count;
	}
	
	// file upload
	public boolean fileUpload(int context_number, String file) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbcon.getConnection();
			sql = "update board SET file= ? where context_number = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, file);
			pstmt.setInt(2, context_number);
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
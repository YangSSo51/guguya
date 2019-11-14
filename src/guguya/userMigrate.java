package guguya;
import java.sql.*;
import java.util.ArrayList;

public class userMigrate {

	//DB 연결
	public Connection dbCon() {
		Connection con = null; // db connection
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/test";
			String user="root";
			String password = "0501";
			con = DriverManager.getConnection(url,user,password);
			System.out.println("db접속 성공");
		} catch (Exception e) {
			System.out.println("db접속 실패");
			e.printStackTrace();
		}
		return con;
	 
	}
	 

	//로그인
	public boolean login(String id,String pw) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "select id from user where id=? and pw=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			flag=rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return flag;
	}
	//회원가입
	public boolean signup(userBean bean) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "insert user(id,pw,email,auth)"+ "values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPw());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getAuth());
			if(pstmt.executeUpdate()==1) flag=true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return flag;
	}
	public ArrayList<userBean> accountList() throws ClassNotFoundException, SQLException {
		ArrayList<userBean> list = new ArrayList<userBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		//if(id.equals("root")) {
			try {
				con = dbCon();
				sql = "select * from user";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					userBean bean = new userBean();
					bean.setId(rs.getString("id"));
					bean.setPw(rs.getString("pw"));
					bean.setEmail(rs.getString("email"));
					bean.setAuth(rs.getString("auth"));
					list.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		//}
		return list;
	}
}

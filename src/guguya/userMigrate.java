package guguya;
import java.sql.*;
import java.util.ArrayList;

//사용자 관련 클래스
public class userMigrate {

	//DB 연결
	public Connection dbCon() {
		Connection con = null; // db connection
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/guguya?useUnicode=true&characterEncoding=utf-8";	
			String user="root";		//사용자 이름
			String password = "0501";	//사용자 비밀번호
			con = DriverManager.getConnection(url,user,password);
			System.out.println("db접속 성공");
		} catch (Exception e) {
			System.out.println("db접속 실패");
			e.printStackTrace();
		}
		return con;
	}
	 
	//회원가입해서 userBean형식으로 리턴해줌
	//user객체를 사용하는 것이 더 쉬움
	public boolean signup(userBean bean) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
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
	
	//id,pw입력받아서 로그인
	//flag값으로 성공여부 전달
	public boolean login(String id,String pw) throws ClassNotFoundException, SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			//아이디 비밀버호가 일치하는 아이디를 찾음
			sql = "select id from user where id=? and pw=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			flag=rs.next();	//존재한다면 true리턴
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		return flag;
	}
	//회원 id로 user_no가져오기
	public int getUserNo(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int user_no=1;
		try {
			con = dbCon();
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
	

	//회원 id로 권한 확인
	public int getAuth(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		int auth=1;
		try {
			con = dbCon();
			sql = "select * from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				auth=rs.getInt("auth");
			}
			return auth;
		}finally {
			
		}
	}
	
	//개인 사용자이면 individual table에 기본정보 등록
	public boolean insertIndividual(int user_no)  throws ClassNotFoundException, SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "insert individual(user_no)"+ "values(?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			if(pstmt.executeUpdate()==1) flag=true;
		}finally {
		}
		return flag;
	}
	//기존 회원정보 조회
	public ArrayList<individualBean> individualList(int user_no) throws ClassNotFoundException, SQLException {
		ArrayList<individualBean> list = new ArrayList<individualBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
			try {
				con = dbCon();
				sql = "select * from individual where user_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,user_no);
				rs = pstmt.executeQuery();
				individualBean bean = new individualBean();
				while(rs.next()) {
					bean.setName(rs.getString("name"));
					bean.setAge(rs.getInt("age"));
				}
				sql = "select * from user where user_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,user_no);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bean.setPw(rs.getString("pw"));
					list.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		return list;
	}
	//개인회원의 정보 수정
	//insertIndividual에서 이미 만들어둔 정보에 접근해서 업데이트해줌
	public boolean updateIndividual(individualBean bean) { //individual table
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "update individual set name=?,age=? where user_no=?";
			pstmt = con.prepareStatement(sql);
			//현재 user_no를 받아와서 넣어줘야함
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2,bean.getAge());
			pstmt.setInt(3,bean.getUser());
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		try {
			con=dbCon();
			sql = "update user set pw=? where user_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setInt(2,bean.getUser());

			if(pstmt.executeUpdate()==1) flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
		}
		return flag;
	}
	
/* enterpise에 대한 코드
 */
	//개인 사용자이면 individual table에 기본정보 등록
	public boolean insertEnterprise(int user_no)  throws ClassNotFoundException, SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "insert enterprise(user_no)"+ "values(?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			if(pstmt.executeUpdate()==1) flag=true;
		}finally {
		}
		return flag;
	}
	//기존 회원정보 조회
	public ArrayList<enterpriseBean> enterpriseList(int user_no) throws ClassNotFoundException, SQLException {
		ArrayList<enterpriseBean> list = new ArrayList<enterpriseBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
			try {
				con = dbCon();
				sql = "select * from enterprise where user_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,user_no);
				rs = pstmt.executeQuery();
				enterpriseBean bean = new enterpriseBean();
				while(rs.next()) {
					bean.setName(rs.getString("name"));
					bean.setAddress(rs.getString("address"));
					bean.setBusiness_no(rs.getString("business_no"));
				}
				sql = "select * from user where user_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,user_no);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bean.setPw(rs.getString("pw"));
					list.add(bean);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		return list;
	}
	//개인회원의 정보 수정
	//insertIndividual에서 이미 만들어둔 정보에 접근해서 업데이트해줌
	public boolean updateEnterprise(enterpriseBean bean) { //individual table
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = dbCon();
			sql = "update enterprise set name=?,address=?,business_no=? where user_no=?";
			pstmt = con.prepareStatement(sql);
			//현재 user_no를 받아와서 넣어줘야함
			pstmt.setString(1, bean.getName());
			pstmt.setString(2,bean.getAddress());
			pstmt.setString(3, bean.getBusiness_no());
			pstmt.setInt(4,bean.getUser());
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		try {
			con=dbCon();
			sql = "update user set pw=? where user_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPw());
			pstmt.setInt(2,bean.getUser());

			if(pstmt.executeUpdate()==1) flag=true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			
		}
		return flag;
	}
	
	//userBean의 리스트형태로 보내줌
	public ArrayList<userBean> accountList() throws ClassNotFoundException, SQLException {
		ArrayList<userBean> list = new ArrayList<userBean>();
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
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
		return list;
	}
		
}

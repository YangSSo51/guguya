package guguya;
import java.sql.*;

public class dbCon {

	public static Connection getConnection() {
		Connection con = null; // db connection
		try {	
			String url="jdbc:mysql://localhost:3306/guguya";	
			String user="root";		//사용자 이름
			String password = "1234";	//사용자 비밀번호
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,user,password);
			System.out.println("db접속 성공");
			
			return con;
		} catch (Exception e) {
			System.out.println("db접속 실패");
			e.printStackTrace();
		}
		return null;
	}
}

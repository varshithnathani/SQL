//package preparationFiles;
//
//import java.util.*;
//import java.sql.*;
//public class JDBCFile4 {
//	
//	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
//		
//		try {
//			Student s1 = new Student();
//			s1.getStudentDetails();
//			s1.insertStudent();
//		}catch(SQLException e) {
//			System.out.println(e.getMessage());
//		}
//		
//	}
//
//}
//
//
//class Student{
//	
//	private String name;
//	private String password;
//	private String country;
//	private int marks;
//	
//	public void getStudentDetails(){
//		Scanner SC = new Scanner(System.in);
//		System.out.println("Enter student Name: ");
//		name = SC.nextLine();
//		System.out.println("Enter Student password: ");
//		password = SC.nextLine();
//		System.out.println("Enter your country: ");
//		country = SC.next();
//		System.out.println("Enter your marks: ");
//		marks = SC.nextInt();
//	}
//	
//	
//	public void insertStudent() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
//		// Here we are going to work with the database
//		// we need to open a database connection.
//		
//		DBMSConnection dbmsconnect = new DBMSConnection("jdbc:mysql://localhost:3306/university","root","");
//		Connection con = dbmsconnect.getConnection();
//		
//		String sql = "insert into student values(?,?,?,?);";
//		
//		PreparedStatement stmt = con.prepareStatement(sql);
//		stmt.setString(1, name);
//		stmt.setString(2, password);
//		stmt.setString(3, country);
//		stmt.setInt(4, marks);
//		stmt.execute();
//		
//		System.out.println("Record Inserted");
//		
//		
//		dbmsconnect.closeConnection(con, stmt);
//		
//		
//	}
//}
//
//
//
//class DBMSConnection{
//	String url;
//	String username;
//	String password;
//	
//	
//	// creating parameterized constructor 
//	
//	public DBMSConnection(String url, String username, String password) {
//		this.url = url;
//		this.username = username;
//		this.password = password;
//	}
//	
//	
//	public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
//		Connection con = null;
//		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
//		con = DriverManager.getConnection(url,username, password);
//		System.out.println("Connection Established");
//			
//		return con;
//	}
//	
//	
//	public void closeConnection(Connection con, Statement stmt) throws SQLException {
//		stmt.close();
//		con.close();
//		System.out.println("Connection Closed");
//	}
//
//}

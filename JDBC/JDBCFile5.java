package preparationFiles;

import java.util.*;
import java.sql.*;



public class JDBCFile5 {
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Scanner SC = new Scanner(System.in);
		try {
						
			Student s = new Student();
			int choise = 0;
			
			
			do {
				System.out.println("Enter an option \n1-Registration \n2-Update password \n3-Delete Record  \n4-Search a Record \n5-Exit");
				
				choise = SC.nextInt();;
				
				switch(choise) {
					case 1:
						s.getStudentDetails();
						s.insertStudent();
						break;
					case 2:
						s.updatePassword();
						break;
					case 3:
						s.deleteStudentRecord();
						break;
					case 4:
						s.searchStudent();
						break;
					case 5:
						System.out.println("Exiting the Application");
						break;
					default:
						System.out.println("Please select the correct option");
						break;
					
				}
			}while(choise != 5);
			System.out.println("Thankyou :) ");
		
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}

}


class Student{
	
	private String name;
	private String password;
	private String country;
	private int marks;
	
	public void getStudentDetails() {
		Scanner SC = new Scanner(System.in);
		System.out.println("Enter your Name: ");
		name = SC.nextLine();
		System.out.println("Enter your password: ");
		password = SC.nextLine();
		System.out.println("Enter your country: ");
		country = SC.nextLine();
		System.out.println("Enter your marks: ");
		marks = SC.nextInt();
	}
	
	public void insertStudent() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		
		DBMSConnection dbmsconnect = new DBMSConnection("jdbc:mysql://localhost:3306/university","root","");
		Connection con = dbmsconnect.getConnection();
		
		String sql = "insert into student values(?,?,?,?);";
		
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, password);
		stmt.setString(3, country);
		stmt.setInt(4, marks);
		stmt.execute();
		
		System.out.println("Record Inserted");
		
		dbmsconnect.closeConnection(con, stmt);
		
	}
	
	
	// Update password.
	
	public void updatePassword() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			
			DBMSConnection dbmsconnect = new DBMSConnection("jdbc:mysql://localhost:3306/university","root","");
			Connection con = dbmsconnect.getConnection();
			
			
			Scanner SC = new Scanner(System.in);
			System.out.println("Enter your name: ");
			String name = SC.nextLine();
			System.out.println("Enter new Password: ");
			String password = SC.nextLine();
			
			String sql = "update student set password = ? where name = ?";
			
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1,password);
			stmt.setString(2, name);
			
			int i = stmt.executeUpdate();
			if(i>0) {
				System.out.println(i+" is updated");
			}else {
				System.out.println("No such records are found");
			}
			
			dbmsconnect.closeConnection(con, stmt);
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	// Deleting a record 
	
	public void deleteStudentRecord() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			
			DBMSConnection dbmsconnect = new DBMSConnection("jdbc:mysql://localhost:3306/university","root","");
			Connection con = dbmsconnect.getConnection();
			
			Scanner SC = new Scanner(System.in);
			System.out.println("Enter name to delete the record:");
			String name = SC.nextLine();
			
			String sql = "delete from student where name = ?;";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			int i =stmt.executeUpdate();
			if(i>0) {
				System.out.println("Deleted the record from database");
			}else {
				System.out.println("There is no such record in the database");
			}
			
			dbmsconnect.closeConnection(con, stmt);
					
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	// searching for a student record from the database using name 
	
	public void searchStudent() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			
			DBMSConnection dbmsconnect = new DBMSConnection("jdbc:mysql://localhost:3306/university","root","");
			Connection con = dbmsconnect.getConnection();
			
			Scanner SC = new Scanner(System.in);
			System.out.println("Enter username for retriving the data");
			String name = SC.nextLine();
			
			String sql = "select * from student where name = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			stmt.setString(1, name);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next() == false) {
				System.out.println("There is no such record in database");
			}else {
				rs.previous();
				while(rs.next()) {
					System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
				}
			}
			
			dbmsconnect.closeConnection(con, stmt);
			
			
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	
}

class DBMSConnection{
	
	String url;
	String username;
	String password;
	
	
	public DBMSConnection(String url, String username, String password) {
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {	
		Connection con = null;
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		con = DriverManager.getConnection(url,username,password);
		return con;
	}
	
	public void closeConnection(Connection con, Statement stmt) throws SQLException {
		stmt.close();
		con.close();
		System.out.println("Connection Closed");
		
	}
}

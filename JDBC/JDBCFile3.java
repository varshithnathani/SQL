package preparationFiles;

import java.sql.*;
import java.util.Scanner;
public class JDBCFile3 {
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Scanner SC = new Scanner(System.in);
		
		try {
			Connection con = null;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
			System.out.println("Connection Established sucessfully");
			
			
			// get the details of the student from user and insert the record in the table
			// we will be using an object of PreparedStatement
			
			
			System.out.println("Enter your name: ");
			String name = SC.nextLine();
			System.out.println("Enter your password: ");
			String password = SC.nextLine();
			System.out.println("Enter you country: ");
			String country = SC.nextLine();
			System.out.println("Enter your marks");
			int marks = SC.nextInt();
			
			String sql = "insert into student values(?,?,?,?);";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, password);
			stmt.setString(3, country);
			stmt.setInt(4, marks);
			
			stmt.execute();
			
			System.out.println("Row Updated");
			
			
			stmt.close();
			con.close();
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}

}

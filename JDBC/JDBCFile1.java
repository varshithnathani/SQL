package preparationFiles;

import java.sql.*;
public class JDBCFile1 {

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		
		try {
			Connection con = null;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
			System.out.println("Connection Established Successfully");
			
			Statement stmt = con.createStatement();
			
			stmt.executeUpdate("update student set password = 'Nathani' where name = 'varshith';");
			System.out.println("Record Updated Successfully");
			stmt.close();
			con.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
}

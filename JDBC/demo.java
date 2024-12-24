package preparationFiles;

import java.sql.*;
public class demo {
	public static void main(String[]  args) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		
		// This is a demo for JDBC
		
//		try {
//			Connection con = null;
//			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
//			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
//			System.out.println("Connection is established");
//			con.close();
//		}
//		catch(SQLException e){
//			System.out.println(e.getMessage());
//		}
		
		
		try {
			Connection con = null;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
			System.out.println("Connection Established Successfully");
			
			// Inserting the data.
			
			Statement stm = con.createStatement();
			stm.executeUpdate("insert into student values('varshith','test','India',70);");
			System.out.println("Record Successfully Installed");
			
			
			stm.close();
			con.close();
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
	}
}

package preparationFiles;

import java.sql.*;
public class JDBCFile2 {

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			
			Connection con = null;
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","");
			
			System.out.println("Connection Established Successfully");
			
			
			// Fetching record [Select * from student; ]
			
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);	
			
			ResultSet rs = stmt.executeQuery("select * from student;");
			
			if(rs.next() == false) {
				System.out.println("Table is Empty");
			}
			else {
				rs.previous();
				while(rs.next()) {
					System.out.println(rs.getString(1) +" "+ rs.getString(2)+ " "+ rs.getString(3) +" "+ rs.getString(4));
				}
			}
			
			stmt.close();
			con.close();
		}
		
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}

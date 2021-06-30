package com.gopal.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
private static Connection con;
public static Connection getCon() {
	try {
		if(con==null) {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","Hustler@2000");
		}

	} 
	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return con;
	}
}

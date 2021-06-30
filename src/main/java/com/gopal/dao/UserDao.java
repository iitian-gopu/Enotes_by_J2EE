package com.gopal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gopal.bean.UserDetails;

public class UserDao {
private Connection con;

public UserDao(Connection con) {
	super();
	this.con = con;
}
public boolean addUser(UserDetails us) {
	boolean f=false;
	try {
	String	query="insert into user(Name,Email,Password) values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1, us.getName());
	ps.setString(2, us.getEamil());
	ps.setString(3, us.getPassword());
	int rowcount=ps.executeUpdate();
	if(rowcount==1) {
		f=true;
	}
	else {
		f=false;
	}
	
	} 
	catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}
public boolean loginUser(UserDetails us) {
	boolean f=false;
	try {
		String	query="select * from user where Email=? and  Password=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, us.getEamil());
		ps.setString(2, us.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			f=true;
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return f;
	
}

}

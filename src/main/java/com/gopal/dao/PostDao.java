package com.gopal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gopal.bean.Post;
import com.gopal.bean.UserDetails;

public class PostDao {
private Connection con;

public PostDao(Connection con) {
	super();
	this.con = con;
}
public boolean addNotes(String ti,String cont,int uid) {
	boolean f=false;
	try {
	String	query="insert into post(title,content,uid) values(?,?,?)";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1,ti );
	ps.setString(2,cont );
	ps.setInt(3,uid);
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
public List<Post> getData(int id) {
	List<Post> lst=new ArrayList<Post>();
	Post po=null;
	try {
		String query="select * from post where uid=? order by id DESC";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			po=new Post();
			po.setId(rs.getInt(1));
			po.setTitle(rs.getString(2));
			po.setContent(rs.getString(3));
			po.setPdate(rs.getTimestamp(4));
			lst.add(po);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return lst;
	
}
public Post getDatabyId(int id) {
	Post po=null;
	try {
		String query="select * from post where id=?";
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			po=new Post();
			po.setId(rs.getInt(1));
			po.setTitle(rs.getString(2));
			po.setContent(rs.getString(3));
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return po;
	
}
public boolean editNotes(String ti,String cont,int id) {
	boolean f=false;
	try {
	String	query="update post set title=?,content=? where id=?";
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1,ti );
	ps.setString(2,cont );
	ps.setInt(3,id);
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
}

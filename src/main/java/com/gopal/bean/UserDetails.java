package com.gopal.bean;

public class UserDetails {
private String name;
private String email;
private String password;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEamil() {
	return email;
}
public void setEmail(String emil) {
	this.email = emil;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public UserDetails(String name, String email, String password) {
	super();
	this.name = name;
	this.email = email;
	this.password = password;
}
public UserDetails() {
	super();
	// TODO Auto-generated constructor stub
}

}

package org.fusu.domain;

public class User {
private int userid;
private String username;
private String password;
private String nickname;
private Byte sex;
private String email;
private String phone;
private String IDcard;
private String address;
private int insert_time;
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public Byte getSex() {
	return sex;
}
public void setSex(Byte sex) {
	this.sex = sex;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getIDcard() {
	return IDcard;
}
public void setIDcard(String iDcard) {
	IDcard = iDcard;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getInsert_time() {
	return insert_time;
}
public void setInsert_time(int insert_time) {
	this.insert_time = insert_time;
}
}

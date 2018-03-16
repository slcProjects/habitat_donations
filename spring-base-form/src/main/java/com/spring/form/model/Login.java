package com.spring.form.model;

public class Login {
	
	String username;
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	String password;
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	String usernameError;
	
	public String getUsernameError() {
		return usernameError;
	}
	
	public void setUsernameError(String usernameError) {
		this.usernameError = usernameError;
	}
	
	String passwordError;
	
	public String getPasswordError() {
		return passwordError;
	}
	
	public void setPasswordError(String passwordError) {
		this.passwordError = passwordError;
	}
	
}

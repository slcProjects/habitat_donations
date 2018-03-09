package com.spring.form.model;

public class User 
{

	// form:hidden - hidden value
	Integer id;

	// form:input - textbox
	String loginName;

	// form:input - password
	String password;

	// form:input - password
	String confirmPassword;

	// form:input - textbox
	String firstName;

	// form:input - textbox
	String lastName;

	// form:input - textbox
	String email;

	// form:input - textbox
	String phone;

	// form:input - textbox
	String address;

	// form:input - textbox
	String city;

	// form:select - form:option - dropdown - single select
	String province;

	// form:input - textbox
	String postalCode;

	// form:input - textbox
	String role;

	// form:checkbox - single checkbox
	boolean notify;

	public boolean isNew() {
		return (this.id == null);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String name) {
		this.loginName = name;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String name) {
		this.firstName = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String name) {
		this.lastName = name;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role.substring(0, 1).toUpperCase() + role.substring(1);
	}

	public boolean isNotify() {
		return notify;
	}

	public void setNotify(boolean notify) {
		this.notify = notify;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", password=" + password + ", confirmPassword=" + confirmPassword 
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", phone=" + phone 
				+ ", address=" + address + ", city=" + city + ", province=" + province + ", postalCode=" + postalCode 
				+ ", role=" + role + ", notify=" + notify + "]"
				+ isNew();
	}

}

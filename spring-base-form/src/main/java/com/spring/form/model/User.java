package com.spring.form.model;


import java.util.List;


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

	// form:radiobutton - radio button
	String gender;

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
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
		this.role = role;
	}

	public boolean isNotify() {
		return notify;
	}

	public void setNotify(boolean notify) {
		this.notify = notify;
	}
	//***************************************************
	// variables for the Donation Page
	
	String category;
	Integer estimated_value;
	String condition_description;
	Boolean tax_receipt;
	String pickup_time;
	
	// Pick-up Address 1) same as registered addresss 2) new address
	String donation_newaddress;
	String donation_newprovince;
	String donation_newcity;
	String donation_newpostalCode;
	
	//*******************************************************
	// get and set for Donation Varibales
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public Integer getEstimatedValue()
	{
		return estimated_value;
	}
	
	public void setEstimatedValue(Integer estimated_value)
	{
		this.estimated_value = estimated_value;
	}

	public String getConditionDescription()
	{
		return condition_description;
	}
	
	public void setConditionDescription(String condtion_description)
	{
		this.condition_description = condtion_description;
	}
	
	public boolean getTaxReceipt() {
		return tax_receipt;
	}

	public void setTaxReceipt(boolean tax_receipt) {
		this.tax_receipt = tax_receipt;
	}
	
	public String getPickupTime()
	{
		return pickup_time;
	}
	
	public void setPickupTime(String pickup_time)
	{
		this.pickup_time = pickup_time;
	}
	
	public String getDonationAddress()
	{
		return donation_newaddress;
	}
	
	public void setDonationAddress(String donation_newaddress)
	{
		this.donation_newaddress = donation_newaddress;
	}
	
	public String getDonationProvince()
	{
		return donation_newprovince;
	}
	
	public void setDonationProvince(String donation_province)
	{
		this.donation_newprovince = donation_province;
	}
	
	public String getDonationCity()
	{
		return donation_newcity;
	}
	
	public void setDonationCity(String donation_newcity)
	{
		this.donation_newcity = donation_newcity;
	}
	
	
	public String getDonationPostalCode()
	{
		return donation_newpostalCode;
	}
	
	public void setDonationPostalCode(String donation_newpostalCode)
	{
		this.donation_newpostalCode = donation_newpostalCode;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", password=" + password + ", confirmPassword=" + confirmPassword 
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", email=" + email + ", phone=" + phone 
				+ ", address=" + address + ", city=" + city + ", province=" + province + ", postalCode=" + postalCode 
				+ ", role=" + role + ", notify=" + notify + "]"
				+ isNew();
	}

}

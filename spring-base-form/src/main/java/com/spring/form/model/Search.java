package com.spring.form.model;

public class Search {

	// form:input - textbox
	String firstName;

	// form:input - textbox
	String lastName;

	// form:input - textbox
	String city;

	// form:input - textbox
	String postalCode;

	// form:input - textbox
	String role;

	// form:select - form:option - dropdown - single select
	String startMonth;

	// form:select - form:option - dropdown - single select
	String endMonth;

	// form:input - textbox
	String startYear;

	// form:input - textbox
	String endYear;

	String emptyError;

	String codeError;

	String roleError;

	String timeError;

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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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
		if (role.length() != 0) {
			this.role = role.substring(0, 1).toUpperCase() + role.substring(1);
		}
	}

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	public String getEmptyError() {
		return emptyError;
	}

	public void setEmptyError(String emptyError) {
		this.emptyError = emptyError;
	}

	public String getCodeError() {
		return codeError;
	}

	public void setCodeError(String codeError) {
		this.codeError = codeError;
	}

	public String getRoleError() {
		return roleError;
	}

	public void setRoleError(String roleError) {
		this.roleError = roleError;
	}

	public String getTimeError() {
		return timeError;
	}

	public void setTimeError(String timeError) {
		this.timeError = timeError;
	}

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", city=" + city + ", postalCode="
				+ postalCode + ", role=" + role + ", startMonth=" + startMonth + ", endMonth=" + endMonth
				+ ", startYear=" + startYear + ", endYear=" + endYear + "]";
	}

}

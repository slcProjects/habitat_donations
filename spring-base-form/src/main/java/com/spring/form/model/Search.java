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
	
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", city=" + city + ", postalCode=" + postalCode 
				+ ", role=" + role + "]";
	}
	
}

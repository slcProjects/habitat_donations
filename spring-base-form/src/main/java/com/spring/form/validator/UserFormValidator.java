package com.spring.form.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.spring.form.model.User;
import com.spring.form.service.UserService;

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class UserFormValidator implements Validator {

	@Autowired
	@Qualifier("emailValidator")
	EmailValidator emailValidator;

	@Autowired
	@Qualifier("phoneValidator")
	PhoneValidator phoneValidator;

	@Autowired
	@Qualifier("postalCodeValidator")
	PostalCodeValidator postalCodeValidator;

	@Autowired
	UserService userService;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		User user = (User) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "loginName", "NotEmpty.userForm");
		if (user.isNew()) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.userForm");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.userForm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.userForm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "role", "NotEmpty.userForm");
		
		if (user.isNew() && !user.getLoginName().equals("") && userService.findByLoginName(user.getLoginName()) != null) {
			user.setLoginError("gfield_error");
			errors.rejectValue("loginName", "Taken.userForm.loginName");
		} else if (user.getLoginName().equals("")) {
			user.setLoginError("gfield_error");
		} else {
			user.setLoginError("");
		}
		
		if (user.getFirstName() == "" && user.getLastName() == "") {
			user.setNameError("gfield_error");
			errors.rejectValue("firstName", "NotEmpty.userForm");
		} else if (user.getFirstName() == "" || user.getLastName() == "") {
			user.setNameError("gfield_error");
			errors.rejectValue("firstName", "NotEmpty.userForm.name");
		} else {
			user.setNameError("");
		}
		
		user.setContactError("");
		
		if (user.getEmail() != "" && !emailValidator.valid(user.getEmail())) {
			user.setContactError("gfield_error");
			errors.rejectValue("email", "Pattern.userForm.email");
		} else if (user.getEmail() == "") {
			user.setContactError("gfield_error");
		}

		if (user.getPhone() != "" && !phoneValidator.valid(user.getPhone())) {
			user.setContactError("gfield_error");
			errors.rejectValue("phone", "Pattern.userForm.phone");
		} else if (user.getPhone() == "") {
			user.setContactError("gfield_error");
		}
		
		user.setAddrError("");

		if (user.getAddress() == "" || user.getCity() == "" || user.getProvince().equalsIgnoreCase("none") || user.getPostalCode() == "") {
			user.setAddrError("gfield_error");
			errors.rejectValue("address", "NotEmpty.userForm");
		}

		if (user.getPostalCode() != "" && !postalCodeValidator.valid(user.getPostalCode())) {
			user.setAddrError("gfield_error");
			errors.rejectValue("postalCode", "Pattern.userForm.postalCode");
		}

		if (user.getPassword() != "" && !user.getPassword().equals(user.getConfirmPassword())) {
			user.setPassError("gfield_error");
			errors.rejectValue("password", "Diff.userForm.confirmPassword");
		} else if (user.isNew() && user.getPassword().equals("") || user.getConfirmPassword().equals("")) {
			user.setPassError("gfield_error");
		} else {
			user.setPassError("");
		}

		if (user.getRole().equalsIgnoreCase("none")) {
			user.setRoleError("gfield_error");
			errors.rejectValue("role", "Invalid.userForm.role");
		} else {
			user.setRoleError("");
		}

	}

}
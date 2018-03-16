package com.spring.form.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.spring.form.model.Login;

@Component
public class LoginFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Login.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Login login = (Login) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty.loginForm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.loginForm");
		
		if (login.getUsername().equals("")) {
			login.setUsernameError("gfield_error");
		} else {
			login.setUsernameError("");
		}
		
		if (login.getPassword().equals("")) {
			login.setPasswordError("gfield_error");
		} else {
			login.setPasswordError("");
		}
		
	}

}

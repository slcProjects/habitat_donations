package com.spring.form.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.form.model.Status;

@Component
public class StatusValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Status.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Status status = (Status) target;
		
		if (status.getStatus().equalsIgnoreCase("none")) {
			errors.rejectValue("status", "NotEmpty.statusForm");
		}
		
	}

}

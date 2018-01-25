package com.spring.form.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("postalCodeValidator")
public class PostalCodeValidator {

	private Pattern pattern;
	private Matcher matcher;

	private static final String CODE_PATTERN = "^[a-zA-Z]\\d[a-zA-Z]\\d[a-zA-Z]\\d$";

	public PostalCodeValidator() {
		pattern = Pattern.compile(CODE_PATTERN);
	}

	public boolean valid(final String postalCode) {

		matcher = pattern.matcher(postalCode);
		return matcher.matches();

	}
	
}

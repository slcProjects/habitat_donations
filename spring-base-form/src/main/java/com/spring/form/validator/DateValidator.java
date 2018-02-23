package com.spring.form.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("dateValidator")
public class DateValidator {

	private Pattern pattern;
	private Matcher matcher;
	private static final String CODE_PATTERN = "^\\d\\d\\d\\d[-]\\d\\d[-]\\d\\d[ ]\\d[:]\\d\\d[:]\\d\\d$";

	public DateValidator() {
		pattern = Pattern.compile(CODE_PATTERN);
	}

	public boolean valid(final String scheduledDate) {

		matcher = pattern.matcher(scheduledDate);
		return matcher.matches();

	}
	
}

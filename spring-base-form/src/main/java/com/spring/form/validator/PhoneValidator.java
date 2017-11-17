package com.spring.form.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("phoneValidator")
public class PhoneValidator {

	private Pattern pattern1, pattern2;
	private Matcher matcher;
	private boolean match = false;

	private static final String PHONE_PATTERN_1 = "^\\d{3}-\\d{3}-\\d{4}$";
	private static final String PHONE_PATTERN_2 = "^\\d-\\d{3}-\\d{3}-\\d{4}$";

	public PhoneValidator() {
		pattern1 = Pattern.compile(PHONE_PATTERN_1);
		pattern2 = Pattern.compile(PHONE_PATTERN_2);
	}

	public boolean valid(final String phone) {

		matcher = pattern1.matcher(phone);
		if (matcher.matches()) {
			match = true;
		} else {
			matcher = pattern2.matcher(phone);
			if (matcher.matches()) {
				match = true;
			}
		}
		return match;

	}
}

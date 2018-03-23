package com.spring.form.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.form.model.Search;

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class SearchFormValidator implements Validator {

	@Autowired
	@Qualifier("postalCodeValidator")
	PostalCodeValidator postalCodeValidator;

	@Override
	public boolean supports(Class<?> clazz) {
		return Search.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Search search = (Search) target;

		if (search.getFirstName().equals("") && search.getLastName().equals("") && search.getCity().equals("")
				&& search.getPostalCode().equals("") && search.getRole() == null
				&& search.getStartMonth().equalsIgnoreCase("none") && search.getEndMonth().equalsIgnoreCase("none")
				&& search.getStartYear().equals("") && search.getEndYear().equals("")) {
			search.setEmptyError("gfield_error");
			errors.rejectValue("startYear", "NotEmpty.searchForm");
		} else {
			
			search.setEmptyError("");
			if (search.getPostalCode() != "" && !postalCodeValidator.valid(search.getPostalCode())) {
				search.setCodeError("gfield_error");
				errors.rejectValue("postalCode", "Pattern.searchForm.postalCode");
			}
			if (search.getRole() != null && !search.getRole().equals("Donor") && !search.getRole().equals("Volunteer")
					&& !search.getRole().equals("Staff")) {
				search.setRoleError("gfield_error");
				errors.rejectValue("role", "Invalid.searchForm.role");
			}

			search.setTimeError("");
			boolean error = false;
			try {
				if (!search.getStartYear().equals("")) {
					Integer.parseInt(search.getStartYear());
				}
			} catch (Exception e) {
				search.setTimeError("gfield_error");
				errors.rejectValue("startYear", "Invalid.searchForm.year");
				error = true;
			}
			try {
				if (!search.getEndYear().equals("")) {
					Integer.parseInt(search.getEndYear());
				}
			} catch (Exception e) {
				search.setTimeError("gfield_error");
				errors.rejectValue("endYear", "Invalid.searchForm.year");
				error = true;
			}

			if (!error) {
				if (!search.getStartYear().equals("") && !search.getEndYear().equals("")) {
					if (Integer.parseInt(search.getStartYear()) > Integer.parseInt(search.getEndYear())) {
						search.setTimeError("gfield_error");
						errors.rejectValue("endYear", "Invalid.searchForm.endYear");
					}
				} else if (search.getStartYear().equals(search.getEndYear())) {
					if (!search.getStartMonth().equalsIgnoreCase("none")
							&& !search.getEndMonth().equalsIgnoreCase("none")) {
						if (Integer.parseInt(search.getStartMonth()) > Integer.parseInt(search.getEndMonth())) {
							search.setTimeError("gfield_error");
							errors.rejectValue("endMonth", "Invalid.searchForm.endMonth");
						}
					}
				}
			}
			
		}

	}

}
package com.spring.form.validator;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.spring.form.model.Donation;
import com.spring.form.service.DonationService;

@Component
public class DonationFormValidator implements Validator {

	@Autowired
	@Qualifier("postalCodeValidator")
	PostalCodeValidator postalCodeValidator;

	@Autowired
	@Qualifier("dateValidator")
	DateValidator dateValidator;

	@Autowired
	DonationService donationService;

	@Override
	public boolean supports(Class<?> clazz) {
		return Donation.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Donation donation = (Donation) target;

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty.donationForm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "value", "NotEmpty.donationForm");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "scheduledDate", "NotEmpty.donationForm");
		
		if (donation.getDescription().equals("")) {
			donation.setDescError("gfield_error");
		} else {
			donation.setDescError("");
		}
		
		if (donation.getValue() == null) {
			donation.setValueError("gfield_error");
		} else {
			donation.setValueError("");
		}
		
		if (donation.getScheduledDate() == null) {
			donation.setDateError("gfield_error");
		} else {
			donation.setDateError("");
		}
		
		if (!donation.getPostalCode().equals("") && !postalCodeValidator.valid(donation.getPostalCode())) {
			donation.setAddrError("gfield_error");
			errors.rejectValue("postalCode", "Pattern.donationForm.postalCode");
		} else {
			donation.setAddrError("");
		}

		if (donation.getScheduledDate() != null && !dateValidator.valid(format.format(donation.getScheduledDate()))) {
			errors.rejectValue("scheduledDate", "Pattern.donationForm.scheduledDate");
			donation.setDateError("gfield_error");
		} else {
			donation.setDateError("");
		}

		if (donation.getType().equalsIgnoreCase("none")) {
			donation.setTypeError("gfield_error");
			errors.rejectValue("type", "NotEmpty.donationForm");
		} else if (donation.getType().equalsIgnoreCase("pickup") && (donation.getAddress().equals("")
				|| donation.getCity().equals("") || donation.getProvince().equalsIgnoreCase("none")
				|| donation.getPostalCode().equals(""))) {
			errors.rejectValue("address", "NotEmpty.donationForm.address");
			donation.setAddrError("gfield_error");
			donation.setTypeError("");
		}
		
		if (donation.getReceiver() != null && donation.getReceiver() == 0) {
			donation.setReceiverError("gfield_error");
			errors.rejectValue("receiver", "NotZero.donationForm.receiver");
		} else {
			donation.setReceiverError("");
		}

		if (donation.getStatus().equalsIgnoreCase("none")) {
			donation.setStatusError("gfield_error");
			errors.rejectValue("status", "NotEmpty.donationForm");
		} else {
			donation.setStatusError("");
		}
		
		donation.setFileError("");

		if (!donation.getFile1().getContentType().contains("application/octet-stream")
				&& !donation.getFile1().getContentType().contains("image/png")
				&& !donation.getFile1().getContentType().contains("image/jpeg")) {
			donation.setFileError("gfield_error");
			errors.rejectValue("file1", "Invalid.donationForm.file");
		}

		if (!donation.getFile2().getContentType().contains("application/octet-stream")
				&& !donation.getFile2().getContentType().contains("image/png")
				&& !donation.getFile2().getContentType().contains("image/jpeg")) {
			donation.setFileError("gfield_error");
			errors.rejectValue("file2", "Invalid.donationForm.file");
		}

		if (!donation.getFile3().getContentType().contains("application/octet-stream")
				&& !donation.getFile3().getContentType().contains("image/png")
				&& !donation.getFile3().getContentType().contains("image/jpeg")) {
			donation.setFileError("gfield_error");
			errors.rejectValue("file3", "Invalid.donationForm.file");
		}

		if (!donation.getFile4().getContentType().contains("application/octet-stream")
				&& !donation.getFile4().getContentType().contains("image/png")
				&& !donation.getFile4().getContentType().contains("image/jpeg")) {
			donation.setFileError("gfield_error");
			errors.rejectValue("file4", "Invalid.donationForm.file");
		}

	}

}

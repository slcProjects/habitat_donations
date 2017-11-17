package com.spring.form.model;

import java.util.Date;

public class Donation {
	// form:hidden - hidden value
	Integer id;

	// form:input - textbox
	Integer donor;
	
	// form:input - textbox
	String description;

	// form:input - textbox
	Double value;

	// form:input - textbox
	Date scheduledDate;

	// form:input - textbox
	Date completedDate;

	// form:input - textbox
	Double dropFee;

	// form:input - textbox
	Integer receiver;
	
	// form:input - textbox
	Date tacking;

	public boolean isNew() {
		return (this.id == null);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDonor() {
		return donor;
	}
	
	public void setDonor(Integer donor) {
		this.donor = donor;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public Date getScheduledDate() {
		return scheduledDate;
	}

	public void setScheduledDate(Date scheduledDate) {
		this.scheduledDate = scheduledDate;
	}

	public Date getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(Date completedDate) {
		this.completedDate = completedDate;
	}

	public Double getDropFee() {
		return dropFee;
	}

	public void setDropFee(Double dropFee) {
		this.dropFee = dropFee;
	}

	public Integer getReceiver() {
		return receiver;
	}

	public void setReceiver(Integer receiver) {
		this.receiver = receiver;
	}

	public Date getTacking() {
		return tacking;
	}

	public void setTacking(Date tacking) {
		this.tacking = tacking;
	}

	@Override
	public String toString() {
		return "Donation [id=" + id + ", donor=" + donor + ", description=" + description + ", value="
				+ value + ", scheduledDate=" + scheduledDate + ", completedDate=" + completedDate + ", dropFee=" + dropFee
				+ ", receiver=" + receiver + ", tacking=" + tacking + "]" + isNew();
	}

}

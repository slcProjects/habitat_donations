package com.spring.form.model;

import java.sql.Blob;

public class Attachment {
	
	Integer id;
	
	Integer donation;
	
	Blob image;
	
	public boolean isNew() {
		return (this.id == null);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDonation() {
		return donation;
	}

	public void setDonation(Integer donation) {
		this.donation = donation;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

}

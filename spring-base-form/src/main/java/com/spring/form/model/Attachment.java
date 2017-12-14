package com.spring.form.model;

public class Attachment {
	
	Integer id;
	
	Integer donation;
	
	byte[] image;
	
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

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}

package com.spring.form.model;

public class ScheduledDate {
	
	Integer id;
	
	Integer donation;
	
	java.util.Date date;
	
	String meridian;
	
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

	public java.util.Date getDate() {
		return date;
	}

	public void setDate(java.util.Date date) {
		this.date = date;
	}

	public String getMeridian() {
		return meridian;
	}

	public void setMeridian(String meridian) {
		this.meridian = meridian;
	}

	public boolean isNew() {
		return (this.id == null);
	}
	
	@Override
	public String toString() {
		return "ScheduledDate [id=" + id + ", donation=" + donation + ", date=" + date + ", meridian=" + meridian + "]" + isNew();
	}

}

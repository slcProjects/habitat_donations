package com.spring.form.model;

public class Status {

	String status, statusChange;
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStatusChange() {
		return statusChange;
	}
	
	public void setStatusChange(String statusChange) {
		this.statusChange = statusChange;
	}
	
	@Override
	public String toString() {
		return "Status [status=" + status + "]";
	}
	
}

package com.spring.form.service;

import java.util.List;

import com.spring.form.model.ScheduledDate;

public interface ScheduledDateService {
	
	ScheduledDate findById(Integer id);
	
	List<ScheduledDate> findByDonation(Integer id);
	
	void saveOrUpdate(ScheduledDate date);
	
	void delete(int id);

	void chooseDate(int donId, int dateId);

}

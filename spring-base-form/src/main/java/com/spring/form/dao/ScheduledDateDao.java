package com.spring.form.dao;

import java.util.List;

import com.spring.form.model.ScheduledDate;

public interface ScheduledDateDao {
	
	ScheduledDate findById(Integer id);
	
	List<ScheduledDate> findAll();
	
	List<ScheduledDate> findByDonation(Integer id);
	
	void save(ScheduledDate date);

	void update(ScheduledDate date);

	void delete(int id);

	void chooseDate(int donId, int dateId);
	
}

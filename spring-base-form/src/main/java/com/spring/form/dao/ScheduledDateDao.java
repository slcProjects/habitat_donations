package com.spring.form.dao;

import com.spring.form.model.ScheduledDate;

public interface ScheduledDateDao {
	
	ScheduledDate findById(Integer id);
	
	void save(ScheduledDate date);

	void update(ScheduledDate date);

	void delete(int id);
	
}

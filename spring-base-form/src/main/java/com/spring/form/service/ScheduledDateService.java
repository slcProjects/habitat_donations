package com.spring.form.service;

import com.spring.form.model.ScheduledDate;

public interface ScheduledDateService {
	
	ScheduledDate findById(Integer id);
	
	void saveOrUpdate(ScheduledDate date);
	
	void delete(int id);

}

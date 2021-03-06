package com.spring.form.dao;

import java.util.List;

import com.spring.form.model.Analytic;
import com.spring.form.model.Donation;

public interface DonationDao {

	List<Donation> findById(Integer id);

	List<Donation> findAll();

	void save(Donation donation);

	void update(Donation donation);

	void delete(Integer id);

	List<Donation> findByUserId(Integer id);

	List<Donation> findByScheduledDate(java.util.Date date);

	List<Donation> findByScheduledMonth(Integer month, Integer year);

	List<Donation> findByScheduledWeekOfMonth(Integer firstDay, Integer lastDay, Integer month, Integer year);
	
	List<Analytic> findMeridianCount();
	
	List<Analytic> findPostalCodeCount();
	
	List<Analytic> findTypeCount();

	void updateStatus(Integer id, String status);

	void reserve(Integer id);
	
}

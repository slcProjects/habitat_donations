package com.spring.form.service;

import java.util.List;

import com.spring.form.model.Donation;

public interface DonationService {

	Donation findById(Integer id);
	
	List<Donation> findAll();

	void saveOrUpdate(Donation donation);
	
	void delete(int id);

	List<Donation> findByUserId(Integer id);

	List<Donation> findByScheduledDate(String date);

	List<Donation> findByScheduledMonth(Integer date, Integer year);

	List<Donation> findByScheduledWeekOfMonth(Integer firstDay, Integer lastDay, Integer month, Integer year);

	void updateStatus(int id, String status);
	
}

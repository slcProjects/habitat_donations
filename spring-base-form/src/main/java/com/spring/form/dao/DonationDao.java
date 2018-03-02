package com.spring.form.dao;

import java.util.List;

import com.spring.form.model.Donation;

public interface DonationDao {

	Donation findById(Integer id);

	List<Donation> findAll();

	void save(Donation donation);

	void update(Donation donation);

	void delete(Integer id);

	List<Donation> findByUserId(Integer id);

	List<Donation> findByScheduledDate(String date);

	List<Donation> findByScheduledMonth(Integer month, Integer year);

	List<Donation> findByScheduledWeekOfMonth(Integer firstDay, Integer lastDay, Integer month, Integer year);
	
}

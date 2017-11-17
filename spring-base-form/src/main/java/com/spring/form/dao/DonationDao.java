package com.spring.form.dao;

import java.util.List;

import com.spring.form.model.Donation;

public interface DonationDao {

	Donation findById(Integer id);

	List<Donation> findAll();

	void save(Donation donation);

	void update(Donation donation);

	void delete(Integer id);
	
}

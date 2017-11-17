package com.spring.form.service;

import java.util.List;

import com.spring.form.model.Donation;

public interface DonationService {

	Donation findById(Integer id);
	
	List<Donation> findAll();

	void saveOrUpdate(Donation donation);
	
	void delete(int id);
	
}

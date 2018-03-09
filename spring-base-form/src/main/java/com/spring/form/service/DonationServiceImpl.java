package com.spring.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.form.dao.DonationDao;
import com.spring.form.model.Donation;

@Service("donationService")
public class DonationServiceImpl implements DonationService {
	
	DonationDao donationDao;
	
	@Autowired
	public void setDonationDao(DonationDao donationDao) {
		this.donationDao = donationDao;
	}

	@Override
	public Donation findById(Integer id) {
		return donationDao.findById(id);
	}

	@Override
	public List<Donation> findAll() {
		return donationDao.findAll();
	}

	@Override
	public void saveOrUpdate(Donation donation) {
		if (findById(donation.getId())==null) {
			donationDao.save(donation);
		} else {
			donationDao.update(donation);
		}
	}

	@Override
	public void delete(int id) {
		donationDao.delete(id);
	}
	
	@Override 
	public List<Donation> findByUserId(Integer id) {
		return donationDao.findByUserId(id);
	}
	
	@Override 
	public List<Donation> findByScheduledDate(String date) {
		return donationDao.findByScheduledDate(date);
	}
	
	@Override 
	public List<Donation> findByScheduledMonth(Integer month, Integer year) {
		return donationDao.findByScheduledMonth(month, year);
	}
	
	@Override 
	public List<Donation> findByScheduledWeekOfMonth(Integer firstDay, Integer lastDay, Integer month, Integer year) {
		return donationDao.findByScheduledWeekOfMonth(firstDay, lastDay, month, year);
	}
	
	@Override
	public void updateStatus(int id, String status) {
		donationDao.updateStatus(id, status);
	}

}

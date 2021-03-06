package com.spring.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.form.dao.DonationDao;
import com.spring.form.model.Analytic;
import com.spring.form.model.Donation;

@Service("donationService")
public class DonationServiceImpl implements DonationService {
	
	DonationDao donationDao;
	
	@Autowired
	public void setDonationDao(DonationDao donationDao) {
		this.donationDao = donationDao;
	}

	@Override
	public List<Donation> findById(Integer id) {
		return donationDao.findById(id);
	}

	@Override
	public List<Donation> findAll() {
		return donationDao.findAll();
	}

	@Override
	public void saveOrUpdate(Donation donation) {
		if (findById(donation.getId()).size() == 0) {
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
	public List<Donation> findByScheduledDate(java.util.Date date) {
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
	public List<Analytic> findMeridianCount() {
		return donationDao.findMeridianCount();
	}
	
	@Override 
	public List<Analytic> findPostalCodeCount() {
		return donationDao.findPostalCodeCount();
	}
	
	@Override 
	public List<Analytic> findTypeCount() {
		return donationDao.findTypeCount();
	}
	
	@Override
	public void updateStatus(int id, String status) {
		donationDao.updateStatus(id, status);
	}
	
	@Override public void reserve(int id) {
		donationDao.reserve(id);
	}

}

package com.spring.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.form.dao.ScheduledDateDao;
import com.spring.form.model.ScheduledDate;

@Service("scheduledDateService")
public class ScheduledDateServiceImpl implements ScheduledDateService {
	
	ScheduledDateDao scheduledDateDao;
	
	@Autowired
	public void setDonationDao(ScheduledDateDao scheduledDateDao) {
		this.scheduledDateDao = scheduledDateDao;
	}
	
	@Override
	public List<ScheduledDate> findAll() {
		return scheduledDateDao.findAll();
	}
	
	@Override
	public ScheduledDate findById(Integer id) {
		return scheduledDateDao.findById(id);
	}
	
	@Override
	public List<ScheduledDate> findByDonation(Integer id) {
		return scheduledDateDao.findByDonation(id);
	}
	
	@Override
	public void saveOrUpdate(ScheduledDate date) {
		if (findById(date.getId())==null) {
			scheduledDateDao.save(date);
		} else {
			scheduledDateDao.update(date);
		}
	}

	@Override
	public void delete(int id) {
		scheduledDateDao.delete(id);
	}
	
	@Override
	public void chooseDate(int donId, int dateId) {
		scheduledDateDao.chooseDate(donId, dateId);
	}

}

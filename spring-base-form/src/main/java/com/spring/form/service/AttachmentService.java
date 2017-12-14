package com.spring.form.service;

import java.util.List;

import com.spring.form.model.Attachment;

public interface AttachmentService {
	
	Attachment findById(Integer id);
	
	List<Attachment> findAll();
	
	List<Attachment> findByDonation(Integer id);
	
	void saveOrUpdate(Attachment attachment);
	
	void delete(int id);

}

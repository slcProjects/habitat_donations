package com.spring.form.dao;

import java.util.List;

import com.spring.form.model.Attachment;

public interface AttachmentDao {
	
	Attachment findById(Integer id);

	List<Attachment> findAll();

	void save(Attachment attachment);

	void update(Attachment attachment);

	void delete(Integer id);

}

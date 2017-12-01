package com.spring.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.form.dao.AttachmentDao;
import com.spring.form.model.Attachment;

@Service("attachmentService")
public class AttachmentServiceImpl implements AttachmentService {
	
	AttachmentDao attachmentDao;
	
	@Autowired
	public void setAttachmentDao(AttachmentDao attachmentDao) {
		this.attachmentDao = attachmentDao;
	}

	@Override
	public Attachment findById(Integer id) {
		return attachmentDao.findById(id);
	}

	@Override
	public List<Attachment> findAll() {
		return attachmentDao.findAll();
	}

	@Override
	public void saveOrUpdate(Attachment attachment) {
		if(findById(attachment.getId()) == null) {
			attachmentDao.save(attachment);
		} else {
			attachmentDao.update(attachment);
		}
		
	}

	@Override
	public void delete(int id) {
		attachmentDao.delete(id);
		
	}

}

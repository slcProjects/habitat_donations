package com.spring.form.model;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.web.multipart.MultipartFile;

public class Attachment {
	
	Integer id;
	
	Integer donation;
	
	Blob image;
	
	public boolean isNew() {
		return (this.id == null);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDonation() {
		return donation;
	}

	public void setDonation(Integer donation) {
		this.donation = donation;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}
	
	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
		if (this.file == null) {
			image = null;
		} else {
			try {
				image = new SerialBlob(this.file.getBytes());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private byte[] bytes;

	public void setBytes(byte[] bytes) {
		this.bytes = bytes;
	}

	public byte[] getBytes() {
		return bytes;
	}
	
	@Override
	public String toString() {
		return "Attachment [id=" + id + ", donation=" + donation + ", image=" + image + "]" + isNew();
	}

}

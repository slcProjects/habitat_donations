package com.spring.form.service;

import java.util.List;

import com.spring.form.model.User;

public interface UserService {

	User findById(Integer id);
	
	List<User> findAll();
	
	User findByLoginName(String username);

	void saveOrUpdate(User user);
	
	void delete(int id);

	List<User> search(String first, String last, String city, String code, String role);
	
}
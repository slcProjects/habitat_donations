package com.spring.form.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.form.dao.UserDao;
import com.spring.form.model.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User findById(Integer id) {
		return userDao.findById(id);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}
	
	@Override
	public User findByLoginName(String username) {
		return userDao.findByLoginName(username);
	}
	
	@Override
	public List<User> search(String first, String last, String city, String code, String role, String startMonth, String endMonth, String startYear, String endYear) {
		return userDao.search(first, last, city, code, role, startMonth, endMonth, startYear, endYear);
	}

	@Override
	public void saveOrUpdate(User user) {

		if (findById(user.getId())==null) {
			userDao.save(user);
		} else {
			userDao.update(user);
		}

	}

	@Override
	public void delete(int id) {
		userDao.delete(id);
	}

}
package com.exercise.service;

import java.util.List;

import com.exercise.pojo.po.User;

public interface IUserService {

	//µ«¬º≤È’“”√ªß
	User selectByName(User user);
	User selectById(Integer id);
	List<User> listUsers(Integer id);
	void updateUser(User user);
	void insertUser(User user);
	void deleteById(Integer id);
	List<User> listAdmins(Integer id);
}

package com.exercise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exercise.mapper.UserMapper;
import com.exercise.pojo.po.User;
import com.exercise.service.IUserService;

@Service
@Transactional(readOnly=true)
public class UserServiceImpl implements IUserService{

	@Autowired
	UserMapper uMapper;
	
	@Override
	public User selectByName(User user) {
		user = uMapper.selectByName(user);
		return user;
	}
	
	@Override
	public User selectById(Integer id) {
		User user = uMapper.selectById(id);
		return user;
	}

	@Override
	public List<User> listUsers(Integer id) {
		List<User> listUsers = uMapper.listUsers(id);
		return listUsers;
	}
	
	@Override
	@Transactional(readOnly=false)
	public void updateUser(User user) {
		try {
			System.out.println(user.getGender()+"======");
			uMapper.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	@Transactional(readOnly=false)
	public void insertUser(User user) {
    	try {
			uMapper.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

    @Transactional(readOnly=false)
	@Override
	public void deleteById(Integer id) {
		try {
			uMapper.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<User> listAdmins(Integer id) {
		List<User> listAdmins = uMapper.listAdmins(id);
		return listAdmins;
	}


}

package com.exercise.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.exercise.pojo.po.User;
import com.exercise.service.IUserService;
import com.exercise.service.impl.UserServiceImpl;
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:spring-*.xml")
public class TestUserMapper {

	@Test
	public void test(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(new Date());
		System.out.println(time);
	}
	@Test
	public void test2(){
		String file = "d:/part3_project/temp/Day4作业.txt@d:/part3_project/temp/额外作业.txt@";
		String[] filenames = file.split("[@]");
		System.out.println(filenames.length);
		for (String filename : filenames) {
			System.out.println(filename);
		}
	}
	/*IUserService ser;
	
	@Before
	public void Init(){
		ser = new UserServiceImpl();
	}
	
	@Test
	public void updateUser(){
		User user=new User();
		user.setGender(1);
		user.setPhone("177777");
		ser.updateUser(user);
	}
	@Test
	public void insertUser(){
		User user=new User();
		user.setId(3);
		user.setUsername("jack");
		user.setPassword("qqq");
		user.setPhone("111111");
		user.setIsadmin(1);
		user.setGender(1);
		user.setPhone("177777");
		ser.insertUser(user);
	}*/
}

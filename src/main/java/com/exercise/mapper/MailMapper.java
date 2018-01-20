package com.exercise.mapper;

import java.util.List;

import com.exercise.pojo.po.Mail;

public interface MailMapper {

	void saveMail(Mail mail);
	
	List<Mail> listMails(Integer id);
	
	List<Mail> listDroppedMails(Integer id);
	
	void updateMail(Mail mail);
}

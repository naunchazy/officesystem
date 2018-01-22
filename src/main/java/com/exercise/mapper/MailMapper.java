package com.exercise.mapper;

import java.util.List;

import com.exercise.pojo.po.Mail;

public interface MailMapper {

	void saveMail(Mail mail);
	
	List<Mail> listMails(Mail mail);
	
	List<Mail> listDroppedMails(Integer id);

	Mail showMail(Mail mail);
	
	void updateMail(Mail mail);
	
	void deleteMail(Mail mail);
}

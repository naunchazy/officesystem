package com.exercise.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exercise.mapper.MailMapper;
import com.exercise.pojo.po.Mail;
import com.exercise.service.IMailService;

@Service
@Transactional(readOnly=true)
public class MailServiceImpl implements IMailService{

	@Autowired
	MailMapper mMapper;

	@Override
	@Transactional(readOnly=false)
	public void saveMail(Mail mail) {
		try {
			mMapper.saveMail(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Mail> listMails(Integer id) {
		List<Mail> listMails=null;
		try {
			listMails=mMapper.listMails(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMails;
	}

	@Override
	public List<Mail> listDroppedMails(Integer id) {
		List<Mail> listDroppedMails=null;
		try {
			listDroppedMails=mMapper.listDroppedMails(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDroppedMails;
	}

	@Override
	public void updateMail(Mail mail) {
		try {
			mMapper.updateMail(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}

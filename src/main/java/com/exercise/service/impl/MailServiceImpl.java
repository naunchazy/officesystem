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
	public List<Mail> listMails(Mail mail) {
		List<Mail> listMails=null;
		try {
			listMails=mMapper.listMails(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMails;
	}

	@Override
	public List<Mail> listSendMails(Mail mail) {
		List<Mail> listSendMails=null;
		try {
			listSendMails=mMapper.listSendMails(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listSendMails;
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
	public Mail showMail(Mail mail) {
		Mail m=null;
		try {
			m=mMapper.showMail(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	
	@Override
	@Transactional(readOnly=false)
	public void updateMail(Mail mail) {
		try {
			//System.out.println(mail.getTime()+"===="+mail.getIsdrop()+"======="+mail.getIsread());
			mMapper.updateMail(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	@Transactional(readOnly=false)
	public void deleteMail(Mail mail) {
		try {
			mMapper.deleteMail(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

package com.exercise.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exercise.pojo.po.Mail;
import com.exercise.pojo.po.User;
import com.exercise.service.IMailService;
import com.exercise.service.IUserService;

@Controller
@RequestMapping("/mail")
public class MailAction {
	@Autowired
	IMailService mailService;
	@Autowired
	IUserService uService;

	/*
	 * 转到写邮件页面
	 */
	@RequestMapping("/toWriteMail.do")
	public String toWriteMail(HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<User> listUsers = uService.listUsers(sessionUser.getId());
		session.setAttribute("listUsers", listUsers);
		return "writeMail";
	}
	/*
	 * 提交邮件
	 */
	@RequestMapping("/writeMail.do")
	public String writeMail(Mail mail){
		//System.out.println(mail.getSendid()+","+mail.getReceiveid()+","+mail.getTitle()+","+mail.getContent()+","+mail.getFile());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(new Date());
		mail.setTime(time);
		mailService.saveMail(mail);
		return "redirect:toWriteMail.do";
	}
	/*到收邮件的页面*/
	@RequestMapping("/toReceivedMail.do")
	public String toReceivedMail(HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<Mail> listMails=mailService.listMails(sessionUser.getId());
		/*model.addAttribute("listMails", listMails);*/
		session.setAttribute("listMails", listMails);
		return "receivedMail";
	}
	/*删除邮件到垃圾箱*/
	/*@RequestMapping(value="/dropMail/{sendid}/{time}")
	public String dropMail(@PathVariable("sendid")Integer sendid,@PathVariable("time")String time,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer receiveid=sessionUser.getId();
		System.out.println(sendid+",,,,,"+time);
		mailService.updateMail(receiveid,sendid,time);
		return "redirect:toReceivedMail.do";
	}*/
	/*删除邮件到垃圾箱*/
	@RequestMapping(value="/dropMail")
	public String dropMail(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer receiveid=sessionUser.getId();
		String sendidStr = request.getParameter("sendid");
		Integer sendid=Integer.parseInt(sendidStr);
		String time = request.getParameter("time");
		Mail mail=new Mail();
		mail.setSendid(sendid);
		mail.setReceiveid(receiveid);
		mail.setTime(time);
		mailService.updateMail(mail);
		return "redirect:toReceivedMail.do";
	}
	/*到垃圾邮件页面*/
	@RequestMapping("/todroppedMail.do")
	public String todroppedMail(HttpSession session,Model model){
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<Mail> listDroppedMails=mailService.listDroppedMails(sessionUser.getId());
		model.addAttribute("listMails", listDroppedMails);
		/*session.setAttribute("listMails", listDroppedMails);*/
		return "droppedMail";
	}
}

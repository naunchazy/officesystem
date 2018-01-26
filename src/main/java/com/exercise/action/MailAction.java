package com.exercise.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.exercise.pojo.po.Mail;
import com.exercise.pojo.po.User;
import com.exercise.service.IMailService;
import com.exercise.service.IUserService;
import com.sun.xml.internal.ws.api.config.management.policy.ManagementAssertion.Setting;

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
	 * 提交邮件及上传文件【多文件的上传】
	 */
	@RequestMapping("/writeMail.do")
	public String writeMail(@RequestParam("file") MultipartFile[] file, Integer sendid, Integer receiveid, String title,
			String content) {
		Mail mail = new Mail();
		mail.setSendid(sendid);
		mail.setReceiveid(receiveid);
		mail.setTitle(title);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		mail.setTime(time);
		mail.setContent(content);
		/* 多文件的上传 */
		// 判断文件是否为空
		if (file.length != 0) {
			try {
				// 文件保存路径
				List<MultipartFile> filenames = Arrays.asList(file);
				String filePath1 = "";
				for (MultipartFile filename : filenames) {
					String filePath = "d:/part3_project/temp/" + filename.getOriginalFilename();
					// 上传的文件放到哪个路径下
					filename.transferTo(new File(filePath));
					// 将多个文件名拼接【拼接的文件名不包含路径。只需文件名，下载时将路径加上即可下载相应文件】
					filePath1 = filePath1 + filename.getOriginalFilename() + "@";
				}
				// 存储到数据库中
				mail.setFile(filePath1);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mailService.saveMail(mail);
		return "redirect:toWriteMail.do";
	}
	/*到收邮件的页面*/
	@RequestMapping("/toReceivedMail.do")
	public String toReceivedMail(HttpSession session,Model model){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Mail mail=new Mail();
		mail.setReceiveid(sessionUser.getId());
		mail.setIsdrop(0);
		List<Mail> listMails=mailService.listMails(mail);
		model.addAttribute("listMails", listMails);
		/*session.setAttribute("listMails", listMails);*/
		return "receivedMail";
	}
	/*到发件箱的页面*/
	@RequestMapping("/toSendedMail.do")
	public String toSendedMail(HttpSession session,Model model){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Mail mail=new Mail();
		mail.setSendid(sessionUser.getId());
		//mail.setIsdrop(0);
		List<Mail> listSendMails=mailService.listSendMails(mail);
		model.addAttribute("listSendMails", listSendMails);
		/*session.setAttribute("listMails", listMails);*/
		return "sendedMail";
	}
	/*去往查看邮件具体内容页面，实现邮件信息的展示*/
	@RequestMapping("/toShowMail")
	public String showMail(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer receiveid=sessionUser.getId();
		String sendidStr = request.getParameter("sendid");
		Integer sendid=Integer.parseInt(sendidStr);
		//根据发送人的id，得到他的名字.显示在邮件详情页上
		User user = uService.selectById(sendid);
		request.setAttribute("senderName", user.getUsername());
		String time = request.getParameter("time");
		Mail mailcon=new Mail();
		mailcon.setSendid(sendid);
		mailcon.setReceiveid(receiveid);
		mailcon.setTime(time);
		Mail mail = mailService.showMail(mailcon);
		mailcon.setIsread(1);
		Integer isdrop=mailService.showMail(mail).getIsdrop();//
		mailcon.setIsdrop(isdrop);//
		mailService.updateMail(mailcon);
		//将多文件的路径分割后放在数组中，再放到域对象request中，传到前端页面showMail.jsp。显示出来。可实现多个文件的逐一下载
		String file = mailService.showMail(mailcon).getFile();
		if(file!=null){
			String[] filenames = file.split("[@]");
			request.setAttribute("filenames", filenames);
		}
		request.setAttribute("mail", mail);
		return "showMail";
	}
	/*去往查看邮件具体内容页面，实现邮件信息的展示*/
	@RequestMapping("/toShowMail2")
	public String showMail2(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer sendid=sessionUser.getId();
		String receiveStr = request.getParameter("receiveid");
		Integer receiveid=Integer.parseInt(receiveStr);
		//根据收送人的id，得到他的名字.显示在邮件详情页上
		User user = uService.selectById(receiveid);
		request.setAttribute("receiveName", user.getUsername());
		String time = request.getParameter("time");
		Mail mailcon=new Mail();
		mailcon.setSendid(sendid);
		mailcon.setReceiveid(receiveid);
		mailcon.setTime(time);
		Mail mail = mailService.showMail(mailcon);
		//将多文件的路径分割后放在数组中，再放到域对象request中，传到前端页面showMail.jsp。显示出来。可实现多个文件的逐一下载
		String file = mailService.showMail(mailcon).getFile();
		if(file!=null){
			String[] filenames = file.split("[@]");
			request.setAttribute("filenames", filenames);
		}
		request.setAttribute("mail", mail);
		return "showMail2";
	}
	/*文件下载*/
	@RequestMapping("/toDownload.do")
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		String filename = request.getParameter("file");
		File file = new File("d:/part3_project/temp/"+filename);
	    byte[] body = null;
	    InputStream is = new FileInputStream(file);
	    body = new byte[is.available()];
	    is.read(body);
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Disposition", "attachment;filename="+new String(filename.getBytes("gb2312"),"ISO8859-1"));
	    HttpStatus statusCode = HttpStatus.OK;
	    ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
	    return entity;
	}
	
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
		mail.setIsdrop(1);
		//System.out.println(mail.getSendid()+","+mail.getReceiveid()+","+mail.getTime());
		Integer isread=mailService.showMail(mail).getIsread();//
		mail.setIsread(isread);//
		mailService.updateMail(mail);
		return "redirect:toReceivedMail.do";
	}
	/*永久删除发件箱中自己发送的邮件*/
	@RequestMapping(value="/dropMail2")
	public String dropMail2(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer sendid=sessionUser.getId();
		String receiveidStr = request.getParameter("receiveid");
		Integer receiveid=Integer.parseInt(receiveidStr);
		String time = request.getParameter("time");
		Mail mail=new Mail();
		mail.setSendid(sendid);
		mail.setReceiveid(receiveid);
		mail.setTime(time);
		mailService.deleteMail(mail);
		return "redirect:toSendedMail.do";
	}
	/*到垃圾邮件页面*/
	@RequestMapping("/todroppedMail.do")
	public String todroppedMail(HttpSession session,Model model){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Mail mail = new Mail();
		mail.setReceiveid(sessionUser.getId());
		mail.setIsdrop(1);
		List<Mail> listDroppedMails=mailService.listMails(mail);
		/*model.addAttribute("listMails", listDroppedMails);*/
		session.setAttribute("listMails", listDroppedMails);
		return "droppedMail";
	}
	/*还原邮件*/
	@RequestMapping("/unDropMail")
	public String unDropMail(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer receiveid=sessionUser.getId();
		String sendidStr = request.getParameter("sendid");
		Integer sendid=Integer.parseInt(sendidStr);
		String time = request.getParameter("time");
		Mail mail=new Mail();
		mail.setSendid(sendid);
		mail.setReceiveid(receiveid);
		mail.setTime(time);
		mail.setIsdrop(0);
		Integer isread=mailService.showMail(mail).getIsread();//
		mail.setIsread(isread);//
		mailService.updateMail(mail);
		return "redirect:todroppedMail.do";
	}
	/*永久删除邮件*/
	@RequestMapping("/deleteMail")
	public String deleteMail(HttpServletRequest request,HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer receiveid=sessionUser.getId();
		String sendidStr = request.getParameter("sendid");
		Integer sendid=Integer.parseInt(sendidStr);
		String time = request.getParameter("time");
		Mail mail=new Mail();
		mail.setSendid(sendid);
		mail.setReceiveid(receiveid);
		mail.setTime(time);
		mailService.deleteMail(mail);
		return "redirect:todroppedMail.do";
	}
}

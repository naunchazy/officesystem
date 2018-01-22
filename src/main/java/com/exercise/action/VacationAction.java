package com.exercise.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exercise.pojo.po.User;
import com.exercise.pojo.po.Vacation;
import com.exercise.service.IUserService;
import com.exercise.service.IVacationService;

@Controller
@RequestMapping("/vacation")
public class VacationAction {

	@Autowired
	IVacationService vService;
	@Autowired
	IUserService uService;
	/*展示自己的申请休假单*/
	@RequestMapping("/toListVacations.do")
	public String toListVacation(HttpSession session,Model model){
		User sessionUser = (User) session.getAttribute("sessionUser");
		Integer id = sessionUser.getId();
		String username = sessionUser.getUsername();
		Vacation vacation = new Vacation();
		vacation.setId(id);
		vacation.setUsername(username);
		List<Vacation> myVacations=vService.listVacations(vacation);
		model.addAttribute("myVacations", myVacations);
		return "listVacations";
	}
	
	/*去往申请休假页面*/
	@RequestMapping("/toApplyVacation.do")
	public String toApplyVacation(Model model,HttpSession session){
		//显示所有注册类型为经理的所有用户
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<User> listAdmins=uService.listAdmins(sessionUser.getId());
		model.addAttribute("listAdmins", listAdmins);
		return "applyVacation";
	}
	/*保存申请的休假*/
	@RequestMapping(value="/applyVacation.do")
	public String applyVacation(Vacation vacation){
		vacation.setIspass(0);
		vService.insertVacation(vacation);
		return "redirect:toApplyVacation.do";
	}
	/*管理员账号展示由他审核的休假申请*/
	@RequestMapping("/toCheckVacation.do")
	public String toCheckVacation(HttpSession session,Model model){
		User admin = (User) session.getAttribute("sessionUser");
		Integer approverid = admin.getId();
		Vacation vacation=new Vacation();
		vacation.setApproverid(approverid);
		List<Vacation> listChecks=vService.listChecks(vacation);
		model.addAttribute("listChecks", listChecks);
		return "checkVacation";
	}
	/*审核其中的一个休假申请*/
	@RequestMapping("/toCheckOne")
	public String toCheckOne(HttpServletRequest request,HttpSession session,Model model){
		User admin = (User) session.getAttribute("sessionUser");
		Integer approverid = admin.getId();//审核人id
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);//申请人id
		String begintime = request.getParameter("begintime");
		String overtime = request.getParameter("overtime");
		Vacation vacation1=new Vacation();
		vacation1.setApproverid(approverid);
		vacation1.setId(id);
		vacation1.setBegintime(begintime);
		vacation1.setOvertime(overtime);
		Vacation vacation=vService.showCheck(vacation1);
		model.addAttribute("vacation", vacation);
		return "checkOne";
	}
	/*管理员审核同意休假*/
	@RequestMapping(value="/checkOneYes")
	public String checkOneYes(Vacation vacation,HttpServletRequest request){
		vacation.setIspass(1);
		vService.updateCheck(vacation);
		return "redirect:toCheckVacation.do";
	}
	/*管理员审核不同意休假*/
	@RequestMapping(value="/checkOneNo")
	public String checkOneNo(Vacation vacation,HttpServletRequest request){
		vacation.setIspass(2);
		vService.updateCheck(vacation);
		return "redirect:toCheckVacation.do";
	}
}

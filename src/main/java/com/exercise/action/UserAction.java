package com.exercise.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exercise.pojo.po.User;
import com.exercise.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Autowired
	IUserService userService;
	/*
	 * ת����¼ҳ��
	 */
	@RequestMapping("/tologin.do")
	public String toLogin(){
		return "login";
	}
	/*
	 * ��¼
	 */
	@RequestMapping(value="/login.do",produces="plain/text;charset=UTF-8")
	@ResponseBody//��ҳ�潻��һ��Ҫ����
	public String doLogin(User user,HttpSession session){
		User findUser = userService.selectById(user.getId());
		if(findUser!=null){
			if (findUser.getPassword().equals(user.getPassword())) {
				session.setAttribute("sessionUser", findUser);
				return "1";//��¼�ɹ�
			}else{
				return "0";//�������
			}
		}else{
			return "0";//�û���������
		}
	}
	/*
	 * ��¼�ɹ�ת����ҳ
	 */
	@RequestMapping("/toindex.do")
	public String toIndex(){
		return "index";
	}
	/*
	 * �û��ǳ�,ת����¼ҳ��
	 */
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpSession session){
		session.removeAttribute("sessionUser");
		return "redirect:tologin.do";
	}

	/*
	 * ȥ���༭ҳ��
	 */
	@RequestMapping("/toUpdateUser.do")
	public String toUpdateUser(){
		return "updateUser";
	}
	/*
	 * ������ĵı༭��Ϣ
	 */
	@RequestMapping("/updateUser.do")
	public String updateUser(User user,HttpSession session){
		System.out.println(user.getGender()+",,,,,,");
		userService.updateUser(user);
		System.out.println(user.getGender()+"``````");
		User findUser = userService.selectById(user.getId());
		System.out.println(findUser.getGender()+"/////");
		session.setAttribute("sessionUser", findUser);
		return "redirect:toindex.do";
	}
	/*ȥ�������˻�*/
	@RequestMapping("/toSingleAccount.do")
	public String toSingleAccount(){
		return "singleAccount";
	}
	/*ȥ���޸ĸ����˻�ҳ��*/
	@RequestMapping("/toUpdateSingleAccount.do")
	public String toUpdateAccount(){
		return "updateSingleAccount";
	}
	/*������ĵĸ����˻�*/
	@RequestMapping("/updateSingleAccount.do")
	public String updateAccount(User user,HttpSession session){
		userService.updateUser(user);
		User findUser = userService.selectById(user.getId());
		session.setAttribute("sessionUser", findUser);
		
		return "redirect:toSingleAccount.do";
	}
	/*ȥ�������˻�ҳ��*/
	@RequestMapping("/toManageAccount.do")
	public String toManageAccount(HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<User> listUsers=userService.listUsers(sessionUser.getId());
		session.setAttribute("listUsers", listUsers);
		return "manageAccount";
	}
	/*ȥ������˻�ҳ��*/
	@RequestMapping("/toInsertAccount.do")
	public String toInsertAccount(){
		return "insertAccount";
	}
	/*�����������˻�*/
	@RequestMapping(value="/insertAccount.do",produces="plain/text;charset=UTF-8")//,method=RequestMethod.POST
	@ResponseBody
	public String insertAccount(User user){
		User findUser = userService.selectById(user.getId());
		if(findUser==null){
			userService.insertUser(user);
			return "0";
		}else{
			return "1";
		}
	}
	/*@RequestMapping("/checkId.do")
	@ResponseBody
	public String checkId(HttpServletRequest request){
		String idStr=request.getParameter("id");
		Integer id=Integer.parseInt(idStr);
		System.out.println(id+",,,,,");
		User user = userService.selectById(id);
		System.err.println(user.getId());
		Gson gson = new Gson();
		String json = gson.toJson(user);
		System.out.println(json);
		return json;
	}*/
	/*����Ա�޸��˺���Ϣǰ�������˻�����*/
	@RequestMapping(value="/toModifyAccount/{id}",method=RequestMethod.PUT)
	public String toModifyAccount(@PathVariable("id") Integer id,Model model){
		User account = userService.selectById(id);
		model.addAttribute("account", account);
		return "modifyAccount";
	}
	/*����Ա�޸��˺�*/
	@RequestMapping("/modifyAccount.do")
	public String modifyAccount(User user){
		userService.updateUser(user);
		return "redirect:toManageAccount.do";
	}
	
	/*����Աɾ���˺�*/
	@RequestMapping(value="/deleteAccount/{id}",method=RequestMethod.DELETE)
	public String deleteAccount(@PathVariable("id") Integer id){
		userService.deleteById(id);
		return "redirect:/user/toManageAccount.do";
	}
}

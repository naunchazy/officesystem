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
	 * 转到登录页面
	 */
	@RequestMapping("/tologin.do")
	public String toLogin(){
		return "login";
	}
	/*
	 * 登录
	 */
	@RequestMapping(value="/login.do",produces="plain/text;charset=UTF-8")
	@ResponseBody//与页面交互一定要加上
	public String doLogin(User user,HttpSession session){
		User findUser = userService.selectById(user.getId());
		if(findUser!=null){
			if (findUser.getPassword().equals(user.getPassword())) {
				session.setAttribute("sessionUser", findUser);
				return "1";//登录成功
			}else{
				return "0";//密码错误
			}
		}else{
			return "0";//用户名不存在
		}
	}
	/*
	 * 登录成功转到首页
	 */
	@RequestMapping("/toindex.do")
	public String toIndex(){
		return "index";
	}
	/*
	 * 用户登出,转到登录页面
	 */
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpSession session){
		session.removeAttribute("sessionUser");
		return "redirect:tologin.do";
	}

	/*
	 * 去往编辑页面
	 */
	@RequestMapping("/toUpdateUser.do")
	public String toUpdateUser(){
		return "updateUser";
	}
	/*
	 * 保存更改的编辑信息
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
	/*去往个人账户*/
	@RequestMapping("/toSingleAccount.do")
	public String toSingleAccount(){
		return "singleAccount";
	}
	/*去往修改个人账户页面*/
	@RequestMapping("/toUpdateSingleAccount.do")
	public String toUpdateAccount(){
		return "updateSingleAccount";
	}
	/*保存更改的个人账户*/
	@RequestMapping("/updateSingleAccount.do")
	public String updateAccount(User user,HttpSession session){
		userService.updateUser(user);
		User findUser = userService.selectById(user.getId());
		session.setAttribute("sessionUser", findUser);
		
		return "redirect:toSingleAccount.do";
	}
	/*去往管理账户页面*/
	@RequestMapping("/toManageAccount.do")
	public String toManageAccount(HttpSession session){
		User sessionUser = (User) session.getAttribute("sessionUser");
		List<User> listUsers=userService.listUsers(sessionUser.getId());
		session.setAttribute("listUsers", listUsers);
		return "manageAccount";
	}
	/*去往添加账户页面*/
	@RequestMapping("/toInsertAccount.do")
	public String toInsertAccount(){
		return "insertAccount";
	}
	/*保存新增的账户*/
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
	/*管理员修改账号信息前，回显账户数据*/
	@RequestMapping(value="/toModifyAccount/{id}",method=RequestMethod.PUT)
	public String toModifyAccount(@PathVariable("id") Integer id,Model model){
		User account = userService.selectById(id);
		model.addAttribute("account", account);
		return "modifyAccount";
	}
	/*管理员修改账号*/
	@RequestMapping("/modifyAccount.do")
	public String modifyAccount(User user){
		userService.updateUser(user);
		return "redirect:toManageAccount.do";
	}
	
	/*管理员删除账号*/
	@RequestMapping(value="/deleteAccount/{id}",method=RequestMethod.DELETE)
	public String deleteAccount(@PathVariable("id") Integer id){
		userService.deleteById(id);
		return "redirect:/user/toManageAccount.do";
	}
}

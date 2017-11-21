package cn.zbit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.zbit.entity.User;
import cn.zbit.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/login.html",method=RequestMethod.GET)
	public String login(){
		
		return "login";
	}
	
	@RequestMapping(value="/login.html",method=RequestMethod.POST)
	public String login(@RequestParam String userName, @RequestParam String password,
			HttpSession session,Model model){
		User user = userService.login(userName, password);
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/sale/main.html";
		} else {
			model.addAttribute("errMsg", "<script>alert('登录失败，用户名或密码错误！');</script>");
			return "login";
		}
		
	}
	
	@RequestMapping("/loginout.html")
	public String loginOut(HttpSession session){
		session.invalidate();
		return "login";
	}
	
}

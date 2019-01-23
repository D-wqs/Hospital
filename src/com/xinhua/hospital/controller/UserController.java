package com.xinhua.hospital.controller;
import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * RESTful
 * 采用HTTP协议规定的GET、POST、PUT、DELETE动作处理资源的增删改查操作
	GET用来获取资源，POST用来新建资源（也可以用于更新资源），PUT用来更新资源，DELETE用来删除资源
	注意此时处理静态页面资源：
	采用RESTful架构后，需要将web.xml中控制器拦截的请求设置为/，这样会将css,js等静态资源进行拦截，发送404错误。
	解决方法如下：
	--配置<mvc:resources/> 
	 <mvc:resources mapping="请求URI" location="资源位置" />
	--配置<mvc:default-servlet-handler/>
	 <mvc:default-servlet-handler/>

 */
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
//注解定义controller控制层bean 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.DeptServiceImpl;
import com.xinhua.hospital.service.Impl.UserServiceImpl;
import com.xinhua.hospital.util.Md5Utils;
import com.xinhua.hospital.util.Online;

@Controller
//@RequestMapping("/user")//注解处理请求地址映射【用于类上：表示父路径；用于方法上：表示与哪一个客户端请求对应】
public class UserController {
	private static Logger log = Logger.getLogger(UserController.class);  
	private static HashSet<Integer> online=new HashSet<Integer>();
	@Resource
	private UserServiceImpl service;
	@Resource
	private DeptServiceImpl service_dept;
	//1.前往登录页面
	@RequestMapping(value="/user/login",method = RequestMethod.GET)
	public String toLogin() {
		System.out.println("打印。。。");
		return "login/login";//login文件夹下的login.jsp
	}
	//2.前往注册界面
	@RequestMapping(value="/user/regist",method = RequestMethod.GET)
	public String toRegist() {
		return "login/regist";//login文件夹下的regist.jsp
	}
	//3.注册
	@RequestMapping(value="/user/regist",method = RequestMethod.POST)
	public String regist(User u,ModelMap map,HttpServletRequest req) {
		System.out.println("注册。。。user属性名与表单中的name值相同，可自动封装成bean对象"+u.toString());
		String path=req.getServletContext().getContextPath()+File.separator+"upload"+File.separator;
		log.info("打印地址："+path);
		log.info("log.info:user姓名："+u.getName());
		try {
			if (u.getImgpath()==null){
				if (u.getSex()==0) {
					u.setImgpath(path+"women.png");
				}else {
					u.setImgpath(path+"men.png");
				}
			}
			
			service.addUser(u);
			System.out.println("注册参数："+u.toString());
			//注册成功去登陆界面，后期改为进主页（主页做医生认证，去医生主页）
			req.getSession().setAttribute("user", u);
			return "redirect:/main/list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.addAttribute("msg_regist", "手机号或者邮箱已存在");
			return "login/regist";
		}
		
	}
	//4.登录
//	@RequestMapping("login")
	//以下采用restful架构
	@RequestMapping(value="/user/login",method = RequestMethod.POST)
	public String login(User u,HttpServletRequest req,HttpServletResponse res,ModelMap map) {
		
		try {
			System.out.println("打印当前传递来的值："+u.toString());
			//将获取到的用户密码，通过MD5加密，与数据库中的密码比对
			u.setPassword(Md5Utils.md5(u.getPassword()));
			log.info("md5加密后的密码："+u.toString());
//			if (u==) {
//				map.addAttribute("msg_u","账号或密码缺失");
//				return "/login/login";
//			}
			User user=service.findByName(u.getName());
			log.info("查询到的用户："+user.toString());
			System.out.println();
			if (!user.getName().equals(u.getName())) {
				map.addAttribute("msg_u", "没有该账号");
				return "redirect: /ssmDemo";
			}else if(!user.getPassword().equals(u.getPassword())){
				map.addAttribute("msg_u", "密码错误");
				return "redirect: /ssmDemo";
			}
			HttpSession session=req.getSession();
			session.setAttribute("user", user);

			online.add(user.getId());
			
			for (Integer i:online) {
				log.info("当前在线人员id："+i);
			}
			log.info("当前在线人数"+online.size());
			session.setAttribute("online", online);
//			return "/main/main";
			return "redirect:/main/list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.addAttribute("msg_u","登录异常");
			return "/login/login";
		}
	}
//	5.用户注销
	@RequestMapping(value="/user/exit",method=RequestMethod.GET)
	public String exit(HttpServletRequest req,User u) {
		HttpSession session=req.getSession();
		log.info("退出");
		return "redirect: /ssmDemo";
	}
	//前往认证页面
	@RequestMapping(value="/user/todoctor",method=RequestMethod.GET)
	public String toDoctor(HttpServletRequest req,int id) {
		HttpSession session=req.getSession();
		//
		session.setAttribute("auth_id", id);
		return "/login/todoctor";
	}
	//认证为医生
		@RequestMapping(value="/user/doctor",method=RequestMethod.POST)
		public String Doctor(int id,int role) {
			
			try {
				log.info("传来的值id:"+id+"role:"+role);
				service.toDoctor(id, role);
//				User u=service.findById(d.getDoctor_id());
//				log.info("当前查到的用户："+u.toString());
				log.info("认证完成，重新登录");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			return "redirect: /ssmDemo";
		}
		@RequestMapping(value="/user/toupdate",method=RequestMethod.GET)
		public String update() {
					
			return "login/update";
		}
		@RequestMapping(value="/user/update",method=RequestMethod.POST)
		public String update(User u,HttpServletRequest req) {
		
			return "redirect: /ssmDemo/user/list";
		}
	
}

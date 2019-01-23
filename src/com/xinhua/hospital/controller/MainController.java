package com.xinhua.hospital.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.DeptServiceImpl;
import com.xinhua.hospital.service.Impl.MedicineServiceImpl;
import com.xinhua.hospital.service.Impl.UserServiceImpl;

@Controller
public class MainController {
	private static Logger log=Logger.getLogger(MainController.class);
	@Resource
	private MedicineServiceImpl service_m;
	@Resource
	private UserServiceImpl service_u;
	@Resource
	private DeptServiceImpl service_dept;
	//登陆后前往主页
	@RequestMapping(value="/main/list", method = RequestMethod.GET)
	public String tomian(HttpServletRequest req,ModelMap map) {
		HttpSession session=req.getSession();
		try {
			//如果用户并不存，说明没有登录，重定向至登录页
			User u=(User) session.getAttribute("user");
			log.info("登陆后转发到主页，当前用户："+u.toString());
			
			//获取所有药品数据
			List<Medicine> list_m=service_m.findAll();
			
			for(Medicine m:list_m) {
				log.info("查询到的药品："+m.toString());
			}
			//主页显示当前所有医生（根据在线情况判断医生是否在线）
			List<User> doctors=service_u.getDoctor();
			for(User d:doctors) {
				log.info("查询到的医生方式一："+d.toString());
			}
			//显示骨科部门人员
			Department guke=service_dept.findDoctorsBydeptId(1);
			log.info("当前返回几条数据："+guke.getDoctor().size());
			log.info("打印当前骨科科室"+guke);
			for(User dept_u:guke.getDoctor()) {
				
				log.info("dept.doctor.name:"+dept_u.getName());
			}
			session.setAttribute("doctors", doctors);
			session.setAttribute("list_m", list_m);
			session.setAttribute("guke", guke);
			return "main/main";
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			map.addAttribute("msg_u", "出现了点意外，请重新登录");
			return "redirect:/";
		}
		
	}
	@RequestMapping(value="/totalk",method=RequestMethod.GET)
	public String toTalk() {
		log.info("去往聊天室");
		return "/chat/talk";
	}
}

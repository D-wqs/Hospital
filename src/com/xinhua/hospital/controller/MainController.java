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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.xinhua.hospital.pojo.Application;
import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.PageBean;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.AppServiceImpl;
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
	@Resource
	private AppServiceImpl service_app;
	//普通用户登陆后前往主页
	@RequestMapping(value="/main/list", method = RequestMethod.GET)
	public String tomian(HttpServletRequest req,ModelMap map) {
		HttpSession session=req.getSession();
		try {
			//如果用户并不存，说明没有登录，重定向至登录页
			User u=(User) session.getAttribute("user");
			log.info("登陆后转发到主页，当前用户："+u.toString());
			
			//获取第一页药品数据6条
			List<Medicine> list_m=service_m.findAll();
			for(Medicine m:list_m) {
				log.info("查询到的药品："+m.toString());
			}
			int count=service_m.findCount();//获取总数
			log.info("总数："+count);
			int page=count/6;
			log.info("总页数："+page);
			if (page%6!=0) {
				page++;
			}
			int[] arr=new int[page];
			for (int i=1;i<page;i++) {
				arr[i]=i;
			}
			log.info("总页数："+page);
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
			//获取用户曾经病例
			
			List<Application> list_app=service_app.findAll();
			log.info("打印当前查询到的病例:"+list_app.toString());
			session.setAttribute("doctors", doctors);
			session.setAttribute("list_m", list_m);
			session.setAttribute("guke", guke);
			session.setAttribute("page", arr);
			session.setAttribute("list_app", list_app);
			log.info("当前获取的集合list_app："+list_app.toString());
			return "main/main";
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			map.addAttribute("msg_u", "出现了点意外，请重新登录");
			return "redirect:/";
		}
		
	}
	//医生登陆后前往主页
		@RequestMapping(value="/main/managerlist", method = RequestMethod.GET)
		public String toManagermian(HttpServletRequest req,ModelMap map) {
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
				return "main/managermain";
			} catch (Exception e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
				map.addAttribute("msg_u", "出现了点意外，请重新登录");
				return "redirect:/";
			}
			
		}
	@RequestMapping(value="/totalk",method=RequestMethod.GET)
	public String toTalk() {
		log.info("去往聊天室");
		return "/chat/talk";
	}
	@RequestMapping(value="/page",method=RequestMethod.GET)
	@ResponseBody
	public String Page(int start,int pageSize) {
		PageBean<Medicine> page=new PageBean<Medicine>();
		JSONArray obj=null;
		try {
			log.info("start:"+start);
			log.info("pageSize:"+pageSize);
			List<Medicine> list_m=service_m.findByPage(start, pageSize);
			log.info("获取到："+list_m.toString());
			obj=(JSONArray) JSONArray.toJSON(list_m);
			log.info(obj);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj.toString();
	}
}

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
	//��ͨ�û���½��ǰ����ҳ
	@RequestMapping(value="/main/list", method = RequestMethod.GET)
	public String tomian(HttpServletRequest req,ModelMap map) {
		HttpSession session=req.getSession();
		try {
			//����û������棬˵��û�е�¼���ض�������¼ҳ
			User u=(User) session.getAttribute("user");
			log.info("��½��ת������ҳ����ǰ�û���"+u.toString());
			
			//��ȡ��һҳҩƷ����6��
			List<Medicine> list_m=service_m.findAll();
			for(Medicine m:list_m) {
				log.info("��ѯ����ҩƷ��"+m.toString());
			}
			int count=service_m.findCount();//��ȡ����
			log.info("������"+count);
			int page=count/6;
			log.info("��ҳ����"+page);
			if (page%6!=0) {
				page++;
			}
			int[] arr=new int[page];
			for (int i=1;i<page;i++) {
				arr[i]=i;
			}
			log.info("��ҳ����"+page);
			//��ҳ��ʾ��ǰ����ҽ����������������ж�ҽ���Ƿ����ߣ�
			List<User> doctors=service_u.getDoctor();
			for(User d:doctors) {
				log.info("��ѯ����ҽ����ʽһ��"+d.toString());
			}
			//��ʾ�ǿƲ�����Ա
			Department guke=service_dept.findDoctorsBydeptId(1);
			log.info("��ǰ���ؼ������ݣ�"+guke.getDoctor().size());
			log.info("��ӡ��ǰ�ǿƿ���"+guke);
			for(User dept_u:guke.getDoctor()) {
				
				log.info("dept.doctor.name:"+dept_u.getName());
			}
			//��ȡ�û���������
			
			List<Application> list_app=service_app.findAll();
			log.info("��ӡ��ǰ��ѯ���Ĳ���:"+list_app.toString());
			session.setAttribute("doctors", doctors);
			session.setAttribute("list_m", list_m);
			session.setAttribute("guke", guke);
			session.setAttribute("page", arr);
			session.setAttribute("list_app", list_app);
			log.info("��ǰ��ȡ�ļ���list_app��"+list_app.toString());
			return "main/main";
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			map.addAttribute("msg_u", "�����˵����⣬�����µ�¼");
			return "redirect:/";
		}
		
	}
	//ҽ����½��ǰ����ҳ
		@RequestMapping(value="/main/managerlist", method = RequestMethod.GET)
		public String toManagermian(HttpServletRequest req,ModelMap map) {
			HttpSession session=req.getSession();
			try {
				//����û������棬˵��û�е�¼���ض�������¼ҳ
				User u=(User) session.getAttribute("user");
				log.info("��½��ת������ҳ����ǰ�û���"+u.toString());
				
				//��ȡ����ҩƷ����
				List<Medicine> list_m=service_m.findAll();
				
				for(Medicine m:list_m) {
					log.info("��ѯ����ҩƷ��"+m.toString());
				}
				
				//��ҳ��ʾ��ǰ����ҽ����������������ж�ҽ���Ƿ����ߣ�
				List<User> doctors=service_u.getDoctor();
				for(User d:doctors) {
					log.info("��ѯ����ҽ����ʽһ��"+d.toString());
				}
				//��ʾ�ǿƲ�����Ա
				Department guke=service_dept.findDoctorsBydeptId(1);
				log.info("��ǰ���ؼ������ݣ�"+guke.getDoctor().size());
				log.info("��ӡ��ǰ�ǿƿ���"+guke);
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
				map.addAttribute("msg_u", "�����˵����⣬�����µ�¼");
				return "redirect:/";
			}
			
		}
	@RequestMapping(value="/totalk",method=RequestMethod.GET)
	public String toTalk() {
		log.info("ȥ��������");
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
			log.info("��ȡ����"+list_m.toString());
			obj=(JSONArray) JSONArray.toJSON(list_m);
			log.info(obj);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj.toString();
	}
}

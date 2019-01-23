package com.xinhua.hospital.controller;
import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * RESTful
 * ����HTTPЭ��涨��GET��POST��PUT��DELETE����������Դ����ɾ�Ĳ����
	GET������ȡ��Դ��POST�����½���Դ��Ҳ�������ڸ�����Դ����PUT����������Դ��DELETE����ɾ����Դ
	ע���ʱ����̬ҳ����Դ��
	����RESTful�ܹ�����Ҫ��web.xml�п��������ص���������Ϊ/�������Ὣcss,js�Ⱦ�̬��Դ�������أ�����404����
	����������£�
	--����<mvc:resources/> 
	 <mvc:resources mapping="����URI" location="��Դλ��" />
	--����<mvc:default-servlet-handler/>
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
//ע�ⶨ��controller���Ʋ�bean 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xinhua.hospital.pojo.Department;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.DeptServiceImpl;
import com.xinhua.hospital.service.Impl.UserServiceImpl;
import com.xinhua.hospital.util.Md5Utils;
import com.xinhua.hospital.util.Online;

@Controller
//@RequestMapping("/user")//ע�⴦�������ַӳ�䡾�������ϣ���ʾ��·�������ڷ����ϣ���ʾ����һ���ͻ��������Ӧ��
public class UserController {
	private static Logger log = Logger.getLogger(UserController.class);  
	private static HashSet<Integer> online=new HashSet<Integer>();
	@Resource
	private UserServiceImpl service;
	@Resource
	private DeptServiceImpl service_dept;
	//1.ǰ����¼ҳ��
	@RequestMapping(value="/user/login",method = RequestMethod.GET)
	public String toLogin() {
		System.out.println("��ӡ������");
		return "login/login";//login�ļ����µ�login.jsp
	}
	//2.ǰ��ע�����
	@RequestMapping(value="/user/regist",method = RequestMethod.GET)
	public String toRegist() {
		return "login/regist";//login�ļ����µ�regist.jsp
	}
	//3.ע��
	@RequestMapping(value="/user/regist",method = RequestMethod.POST)
	public String regist(User u,ModelMap map,HttpServletRequest req) {
		System.out.println("ע�ᡣ����user����������е�nameֵ��ͬ�����Զ���װ��bean����"+u.toString());
		String path=req.getServletContext().getContextPath()+File.separator+"upload"+File.separator;
		log.info("��ӡ��ַ��"+path);
		log.info("log.info:user������"+u.getName());
		try {
			if (u.getImgpath()==null){
				if (u.getSex()==0) {
					u.setImgpath(path+"women.png");
				}else {
					u.setImgpath(path+"men.png");
				}
			}
			
			service.addUser(u);
			System.out.println("ע�������"+u.toString());
			//ע��ɹ�ȥ��½���棬���ڸ�Ϊ����ҳ����ҳ��ҽ����֤��ȥҽ����ҳ��
			req.getSession().setAttribute("user", u);
			return "redirect:/main/list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.addAttribute("msg_regist", "�ֻ��Ż��������Ѵ���");
			return "login/regist";
		}
		
	}
	//4.��¼
//	@RequestMapping("login")
	//���²���restful�ܹ�
	@RequestMapping(value="/user/login",method = RequestMethod.POST)
	public String login(User u,HttpServletRequest req,HttpServletResponse res,ModelMap map) {
		
		try {
			System.out.println("��ӡ��ǰ��������ֵ��"+u.toString());
			//����ȡ�����û����룬ͨ��MD5���ܣ������ݿ��е�����ȶ�
			u.setPassword(Md5Utils.md5(u.getPassword()));
			log.info("md5���ܺ�����룺"+u.toString());
//			if (u==) {
//				map.addAttribute("msg_u","�˺Ż�����ȱʧ");
//				return "/login/login";
//			}
			User user=service.findByName(u.getName());
			log.info("��ѯ�����û���"+user.toString());
			System.out.println();
			if (!user.getName().equals(u.getName())) {
				map.addAttribute("msg_u", "û�и��˺�");
				return "redirect: /ssmDemo";
			}else if(!user.getPassword().equals(u.getPassword())){
				map.addAttribute("msg_u", "�������");
				return "redirect: /ssmDemo";
			}
			HttpSession session=req.getSession();
			session.setAttribute("user", user);

			online.add(user.getId());
			
			for (Integer i:online) {
				log.info("��ǰ������Աid��"+i);
			}
			log.info("��ǰ��������"+online.size());
			session.setAttribute("online", online);
//			return "/main/main";
			return "redirect:/main/list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.addAttribute("msg_u","��¼�쳣");
			return "/login/login";
		}
	}
//	5.�û�ע��
	@RequestMapping(value="/user/exit",method=RequestMethod.GET)
	public String exit(HttpServletRequest req,User u) {
		HttpSession session=req.getSession();
		log.info("�˳�");
		return "redirect: /ssmDemo";
	}
	//ǰ����֤ҳ��
	@RequestMapping(value="/user/todoctor",method=RequestMethod.GET)
	public String toDoctor(HttpServletRequest req,int id) {
		HttpSession session=req.getSession();
		//
		session.setAttribute("auth_id", id);
		return "/login/todoctor";
	}
	//��֤Ϊҽ��
		@RequestMapping(value="/user/doctor",method=RequestMethod.POST)
		public String Doctor(int id,int role) {
			
			try {
				log.info("������ֵid:"+id+"role:"+role);
				service.toDoctor(id, role);
//				User u=service.findById(d.getDoctor_id());
//				log.info("��ǰ�鵽���û���"+u.toString());
				log.info("��֤��ɣ����µ�¼");
				
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

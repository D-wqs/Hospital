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

import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.MedicineServiceImpl;
import com.xinhua.hospital.service.Impl.UserServiceImpl;

@Controller
public class MainController {
	private static Logger log=Logger.getLogger(MainController.class);
	@Resource
	private MedicineServiceImpl service_m;
	@Resource
	private UserServiceImpl service_u;
	//��½��ǰ����ҳ
	@RequestMapping(value="/main/list", method = RequestMethod.GET)
	public String tomian(HttpServletRequest req,ModelMap map) {
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
			
			session.setAttribute("doctors", doctors);
			session.setAttribute("list_m", list_m);
			return "main/main";
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			map.addAttribute("msg_u", "�����˵����⣬�����µ�¼");
			return "redirect:/";
		}
		
	}
	@RequestMapping(value="/totalk",method=RequestMethod.GET)
	public String toTalk() {
		log.info("ȥ��������");
		return "/chat/talk";
	}
}
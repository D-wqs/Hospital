package com.xinhua.hospital.controller;

import java.net.http.HttpRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.UserServiceImpl;

@Controller
public class Writemessage {
	private static Logger log= Logger.getLogger(Writemessage.class);
	@Resource
	private UserServiceImpl service_u;
	//ǰ������ҳ��
	@RequestMapping(value="/toWriteMessage",method=RequestMethod.GET)
	public String toMessage(int id,String name,HttpServletRequest req) {
//		log.info("ǰ�����͸�"+u.getName()+"������ҳ��");
//		try {
//			log.info("��ǰ��ȱ�û���Ϣ��"+u.toString());
//			u=service_u.findById(u.getId());
//			log.info("���ҵ��������û���Ϣ��"+u.toString());
//			req.getSession().setAttribute("chatToDoctor", u);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//�û����һ��ҽ���󣬰󶨸�ҽ����id������
		req.getSession().setAttribute("doctor_id", id);
		req.getSession().setAttribute("doctor_name", name);
		log.info("ǰ���������"+id+name);
		return "chat/message";
	}
}

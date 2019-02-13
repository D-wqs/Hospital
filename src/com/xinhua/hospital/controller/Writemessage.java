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
	//前往留言页面
	@RequestMapping(value="/toWriteMessage",method=RequestMethod.GET)
	public String toMessage(int id,String name,HttpServletRequest req) {
//		log.info("前往发送给"+u.getName()+"的聊天页面");
//		try {
//			log.info("当前残缺用户信息："+u.toString());
//			u=service_u.findById(u.getId());
//			log.info("查找到的完整用户信息："+u.toString());
//			req.getSession().setAttribute("chatToDoctor", u);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//用户点击一个医生后，绑定该医生的id和姓名
		req.getSession().setAttribute("doctor_id", id);
		req.getSession().setAttribute("doctor_name", name);
		log.info("前往聊天界面"+id+name);
		return "chat/message";
	}
}

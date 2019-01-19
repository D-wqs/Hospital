package com.xinhua.hospital.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinhua.hospital.service.Impl.DeptServiceImpl;

@Controller
public class DeptController {
	private static Logger log=Logger.getLogger(DeptController.class);
	@Resource
	private DeptServiceImpl service_dept;
	@RequestMapping(value="/dept/getdoctors",method=RequestMethod.POST)
	public String getDept(ModelMap map,HttpServletRequest req)	{
		
		return "";
	}

}

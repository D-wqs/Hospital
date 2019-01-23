package com.xinhua.hospital.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传
 * 1.引入文件上传组件common-fileupload.jar和common-io.jar
 * 2.spring配置文件中添加CommonsMultipartResolver组件的bean定义
 * 3.视图表单中<form>标记必须追加enctype="multipart/form-data"设置，制定表单数据的提交格式，
 * 		method的属性页必须设置为post方式提交
 * 4.编写Controller类，在处理方法中，可以使用@RequestParam注解
 * 		将CommonsMultipartResolver解析出的文件赋值给MultipartFile参数对象，该对象包含了上传的文件信息
 * @author wqs
 *
 */
@Controller
public class UploadController {
	public static Logger log =Logger.getLogger(UploadController.class);
	@RequestMapping(value="/image/toupload",method=RequestMethod.GET)
	public String toUpload() {
		return "/login/upload";
	}
	@RequestMapping(value="/image/upload",method=RequestMethod.POST)
	@ResponseBody
	public String toFile1(@RequestParam("file")MultipartFile file,HttpServletRequest request,ModelMap model){
		log.info("进入上传");
		//获取文件路径
		String uploadPath = request.getServletContext().getRealPath("upload");
		String path =uploadPath + File.separator+file.getOriginalFilename();
		File newFile = new File(path);
		try {
			file.transferTo(newFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		//将文件所在的地址绑定到页面File.separator:-->\
		String fileUrl = request.getServletContext().getContextPath()+File.separator+"upload"+File.separator+file.getOriginalFilename();
		log.info("文件上传地址："+fileUrl);
//		model.addAttribute("fileUrl", fileUrl);
//		//提交数据获取
//		log.info("表单数据："+name);
//		return "/login/upload";
		return fileUrl;
	}
	@RequestMapping(value="/image/hello",method=RequestMethod.POST)
	@ResponseBody
	public String hello(String name,String Url) {
		log.info("ajax请求到达"+name+Url);
		return "hello";
	}
}

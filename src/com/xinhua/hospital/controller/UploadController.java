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
 * �ļ��ϴ�
 * 1.�����ļ��ϴ����common-fileupload.jar��common-io.jar
 * 2.spring�����ļ������CommonsMultipartResolver�����bean����
 * 3.��ͼ����<form>��Ǳ���׷��enctype="multipart/form-data"���ã��ƶ������ݵ��ύ��ʽ��
 * 		method������ҳ��������Ϊpost��ʽ�ύ
 * 4.��дController�࣬�ڴ������У�����ʹ��@RequestParamע��
 * 		��CommonsMultipartResolver���������ļ���ֵ��MultipartFile�������󣬸ö���������ϴ����ļ���Ϣ
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
		log.info("�����ϴ�");
		//��ȡ�ļ�·��
		String uploadPath = request.getServletContext().getRealPath("upload");
		String path =uploadPath + File.separator+file.getOriginalFilename();
		File newFile = new File(path);
		try {
			file.transferTo(newFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		//���ļ����ڵĵ�ַ�󶨵�ҳ��File.separator:-->\
		String fileUrl = request.getServletContext().getContextPath()+File.separator+"upload"+File.separator+file.getOriginalFilename();
		log.info("�ļ��ϴ���ַ��"+fileUrl);
//		model.addAttribute("fileUrl", fileUrl);
//		//�ύ���ݻ�ȡ
//		log.info("�����ݣ�"+name);
//		return "/login/upload";
		return fileUrl;
	}
	@RequestMapping(value="/image/hello",method=RequestMethod.POST)
	@ResponseBody
	public String hello(String name,String Url) {
		log.info("ajax���󵽴�"+name+Url);
		return "hello";
	}
}

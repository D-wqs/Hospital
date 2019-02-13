package com.xinhua.hospital.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.MedicineServiceImpl;

@Controller
public class MedicineController {
	private Logger log = Logger.getLogger(MedicineController.class);
	@Resource
	private MedicineServiceImpl service_m;
	@RequestMapping(value="toMedicine",method=RequestMethod.GET)
	public String toAddMedicine() {
		return "Repository/addMedicine";
	}
	@RequestMapping(value="/medicine/add",method=RequestMethod.POST)
	public String addMedicine(@RequestParam("file")MultipartFile file,Medicine m,HttpServletRequest req ,ModelMap map) {
		try {
			log.info("��ǰ�����Ĳ�����"+file+":"+m.toString());
			//��ȡ�ļ�·��
			String uploadPath = req.getServletContext().getRealPath("upload");
			String path =uploadPath + File.separator+file.getOriginalFilename();
			File newFile = new File(path);
			file.transferTo(newFile);
			//���ļ����ڵĵ�ַ�󶨵�ҳ��File.separator:-->\
			String fileUrl = req.getServletContext().getContextPath()+File.separator+"upload"+File.separator+file.getOriginalFilename();
			log.info("�ļ��ϴ���ַ��"+fileUrl);
			//��ȡͼƬ����������ҩƷ��¼
			m.setImage(fileUrl);
			//����session��ȡuser_id
			User u=(User) req.getSession().getAttribute("user");
			m.setUser_id(u.getId());//��ǰҽ���ϼ� ��ҩƷ
			service_m.addMedicine(m);
			log.info("��ǰ����ҩƷ��"+m.toString());	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/main/managerlist";
	}
}

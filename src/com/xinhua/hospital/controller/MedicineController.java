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
			log.info("当前传来的参数："+file+":"+m.toString());
			//获取文件路径
			String uploadPath = req.getServletContext().getRealPath("upload");
			String path =uploadPath + File.separator+file.getOriginalFilename();
			File newFile = new File(path);
			file.transferTo(newFile);
			//将文件所在的地址绑定到页面File.separator:-->\
			String fileUrl = req.getServletContext().getContextPath()+File.separator+"upload"+File.separator+file.getOriginalFilename();
			log.info("文件上传地址："+fileUrl);
			//获取图片名，并创建药品记录
			m.setImage(fileUrl);
			//根据session获取user_id
			User u=(User) req.getSession().getAttribute("user");
			m.setUser_id(u.getId());//当前医生上架 的药品
			service_m.addMedicine(m);
			log.info("当前新增药品："+m.toString());	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/main/managerlist";
	}
}

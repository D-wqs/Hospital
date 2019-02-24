package com.xinhua.hospital.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xinhua.hospital.pojo.Application;
import com.xinhua.hospital.pojo.Medicine;
import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.AppServiceImpl;
import com.xinhua.hospital.service.Impl.MedicineServiceImpl;
import com.xinhua.hospital.service.Impl.UserServiceImpl;

@Controller
public class MedicineController {
	private Logger log = Logger.getLogger(MedicineController.class);
	@Resource
	private MedicineServiceImpl service_m;
	@Resource
	private AppServiceImpl service_app;
	@Resource
	private UserServiceImpl service_u;
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
	@RequestMapping(value="/getMedicineinfo",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getMedicineinfo(String Info) {
		log.info("��ǰ�����Ĳ�����"+Info);
		List<Medicine> list = null;
		try {
			list = service_m.findMByinformation("%"+Info+"%");//ģ����ѯ�ж��ַ�ʽ
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject obj=new JSONObject();
		obj.put("info", list);
		log.info("json:"+obj.toString());
		return obj;
	}
	@RequestMapping(value="/addMedicineByDoctor",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addMedicineByDoctor(String Info,int D_id,int U_id) {
		log.info("��ǰ�����Ĳ�����"+Info+D_id+U_id);
		String[] arr=Info.split(",");
		log.info("��ǰ�и"+arr.toString());
		Application app=new Application();
		try {
			User doctor=service_u.findById(D_id);
			User user=service_u.findById(U_id);
			String m_name="";
			for (int i=0;i<arr.length;i++) {
				Medicine m=service_m.findById(Integer.parseInt(arr[i]));
				m_name+=m.getName()+"||";
			}
			app.setDoctor_id(doctor.getId());
			app.setUser_id(user.getId());
			app.setUser_name(user.getName());
			app.setDoctor_name(doctor.getName());		
			app.setMedicine_name(m_name);
			service_app.createApp(app);
			log.info("��ǰapp:"+app.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject obj=new JSONObject();
		obj.put("info", app);
		log.info("json:"+obj.toString());
		return obj;
	}
}

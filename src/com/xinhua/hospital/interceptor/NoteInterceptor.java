package com.xinhua.hospital.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.HandlerInterceptor;
/**
 * 拦截器：一般应用于：日志记录、权限检查、性能监控、通用行为（读取cookie。。。）、OpenSessionInView
 * 使用：1.自定义拦截器，实现HandlerInterceptor接口与方法
 * 2.在springmvc.xml中添加拦截器配置
 * 3.编写拦截处理业务逻辑，比如权限处理
 * 4.测试
 * @author wqs
 *
 */
public class NoteInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("拦截器");
		return true;
	}
	

	
}
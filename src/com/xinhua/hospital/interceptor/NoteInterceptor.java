package com.xinhua.hospital.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.HandlerInterceptor;
/**
 * ��������һ��Ӧ���ڣ���־��¼��Ȩ�޼�顢���ܼ�ء�ͨ����Ϊ����ȡcookie����������OpenSessionInView
 * ʹ�ã�1.�Զ�����������ʵ��HandlerInterceptor�ӿ��뷽��
 * 2.��springmvc.xml���������������
 * 3.��д���ش���ҵ���߼�������Ȩ�޴���
 * 4.����
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
		System.out.println("������");
		return true;
	}
	

	
}
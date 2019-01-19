package com.xinhua.hospital.test;
/**
 * 1.spring��Java����javabean����Bean������
 * 2.�ƶ�bean������ϵ��ע�롢�̳С�����������
 * 3.IOC�����Ʒ�ת��ָ�����ж���Ļ�ȡ��ʽ����ת�䣬�������new��ʽ������ת��Ϊ��������ܴ�����ע�롣
 * 		���������һ����ͨ�����÷�ʽ�ƶ�ע����һ������ʵ�֣��Ӷ����Ͷ���֮�����϶�
 * 		ʵ������ע������ַ�ʽ���ӿ�ע�롢setterע�롢������ע��
 * 4.springͨ��DI(����ע��)�ķ�ʽʵ��ICO���Ʒ�ת
 * ʵ����ʹ��setterע�뷽ʽ��ȡ���ݿ����Ӷ���
 * 		ʹ�ù�����ע����ָ�����ô������������ָ�������±�
 */
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xinhua.hospital.dao.UserDao;
import com.xinhua.hospital.pojo.User;

public class SpringTest {
	@Test
public void test(){
		String path="com/xinhua/hospital/config/applicationContext.xml";
	@SuppressWarnings("resource")
	ApplicationContext ac= new ClassPathXmlApplicationContext(path);
	UserDao dao=ac.getBean(UserDao.class);
	try {
		User u=dao.findByid(1);
		System.out.println(u);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
}

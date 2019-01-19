package com.xinhua.hospital.test;
/**
 * 1.spring将Java类与javabean当成Bean来处理
 * 2.制定bean依赖关系：注入、继承、依赖、引用
 * 3.IOC（控制反转）指程序中对象的获取方式发生转变，由最初的new方式创建，转变为第三方框架创建、注入。
 * 		第三方框架一般是通过配置方式制定注入哪一个具体实现，从而降低对象之间的耦合度
 * 		实现依赖注入的三种方式：接口注入、setter注入、构造器注入
 * 4.spring通过DI(依赖注入)的方式实现ICO控制反转
 * 实例：使用setter注入方式获取数据库连接对象
 * 		使用构造器注入是指，调用带参数额构造器，指定参数下标
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

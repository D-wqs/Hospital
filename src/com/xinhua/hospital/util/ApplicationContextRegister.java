//package com.xinhua.hospital.util;
//
//import org.apache.catalina.core.ApplicationContext;
//import org.springframework.context.ApplicationContextAware;
//import org.springframework.context.annotation.Lazy;
//import org.springframework.stereotype.Component;
//
//@Component
//@Lazy(false)
//public class ApplicationContextRegister  implements ApplicationContextAware {
//    private static ApplicationContext APPLICATION_CONTEXT;
// 
//    /**
//     * ����spring������  *  * @param applicationContext spring������  * @throws BeansException  * author:huochengyan https://blog.csdn.net/u010919083
//     */
// 
//    @Override
//    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
//        APPLICATION_CONTEXT = applicationContext;
//    }
// 
//    public static ApplicationContext getApplicationContext() {
//        return APPLICATION_CONTEXT;
//    }
//}
//

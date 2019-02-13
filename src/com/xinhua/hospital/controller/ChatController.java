package com.xinhua.hospital.controller;

import java.io.IOException;  
import java.util.ArrayList;
import java.util.List;
import java.util.Map;  
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.websocket.*;  
import javax.websocket.server.PathParam;  
import javax.websocket.server.ServerEndpoint;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import com.xinhua.hospital.pojo.User;
import com.xinhua.hospital.service.Impl.UserServiceImpl;
import com.alibaba.fastjson.JSONObject;
//websocket��ֵ��ǰ̨����ģ�壺wd://localhost:8080/ssmDemo/ws/1/tom
//ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/ws/${user.id}/${user.name}
//@ServerEndpoint("/ws/{id}/{name}") 
@ServerEndpoint(value="/ws/{id}/{name}",configurator =SpringConfigurator.class)
public class ChatController {
	private static Logger log =Logger.getLogger(ChatController.class);
	private static int onlineCount = 0;  
    private static Map<User, ChatController> clients = new ConcurrentHashMap<User, ChatController>();  
    private Session session;
    private User user;
    private static int id = 0;
//    @Resource�˴��޷�ʹ��ע�⣬ͨ��spring�����ļ�ע��ֵ
    @Resource
    private UserServiceImpl service_u;

	@OnOpen  
    public void onOpen(@PathParam("id")int id,@PathParam("name")String name, Session session) throws IOException {  
    	log.info("��ǰ������ֵ��"+id+name);
    	try {
    		//service_u=(UserServiceImpl) ContextLoader.getCurrentWebApplicationContext().getBean("userServiceImpl");
    		log.info("��ǰservice_u:"+service_u);
			user=service_u.findById(id);
			this.session=session;
			clients.put(user, this);
			addOnlineCount(); 
			log.info(user.getName()+"������,��ǰ����������"+onlineCount);
			log.info("��ӡ��ǰ����"+user.getName()+"��"+session.toString());
			//����֪ͨ
			for(ChatController item:clients.values()) {
				//���͵�ǰ������Ա
//				sendMessageAll("all,"+item.user.getName()+","+item.user.getId());
				log.info("��ǰ������Ա��"+item.user.getName());
			}
//			sendMessageAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//    	user=new UserInfo(id+1,username);
//    	List<Message> list=new ArrayList<Message>();
//    	user.setMegs(list);
//    	
//        this.session = session;  
//          
//        addOnlineCount();  
//        clients.put(user, this);  
//        System.out.println("������");  
    }  
  
    @OnClose  
    public void onClose() throws IOException {  
        
        clients.remove(user);  
        subOnlineCount();
        log.info(user.getName()+"���ӹر�");
    }  
    /**
     * ���������û�����Ϣ
     * @param message
     * @throws IOException
     */
    @OnMessage  
    public void onMessage(String message,Session session) throws IOException {  
    	log.info("��������ֵ��"+message); 
        JSONObject obj = JSONObject.parseObject(message);
        log.info("�û���"+session.getId()+"��������Ϣ��"+obj);
        
        //���͸�ĳ��
        sendMessageTo(obj.get("content").toString(), obj.get("Toname").toString(),obj.get("username").toString()); 
//          
//        if (!jsonTo.get("To").equals("All")){
//        	Message mes=new Message();
//        	mes.setFromName(user.getName());
//        	mes.setMessageText(jsonTo.get("massege").toString());
//        	mes.setToName(jsonTo.get("To").toString());
//        	user.getMegs().add(mes);
//            sendMessageTo(jsonTo.get("massege").toString(), jsonTo.get("To").toString());  
//        }else{  
//            sendMessageAll("��������");  
//        }  
    }  
  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
    //˭����ʲô(�������ݣ������ߣ�������)
    public void sendMessageTo(String content, String Toname,String username) throws IOException {  
    	log.info(username+"->to:"+Toname);
    	for(ChatController item:clients.values()) {
    		//�����ǰ���ߵ��û�����Ҫ���͵�Ŀ���������message
    		log.info("��ǰ��Ա��Ϣ��"+item.user.toString());
    		
    		//�ҵ�Ŀ�꣬������Ϣ
    		if (item.user.getName().equals(Toname)) {
    			log.info(username+"�ҵ��Է�---����"+Toname+"::::"+item.user.getName().equals(Toname));
    			User u=new User();
    			try {
					u=service_u.findByName(username);
					log.info("�����ߵ�id:"+u.getId());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    			item.session.getAsyncRemote().sendText(content+","+Toname+","+username+","+u.getId());
    			log.info("����------------------------------------------��");
    			//�˴���Ҫbreak
    			break;
    		}
//    		else {
//    			//��������Լ��Է�������
//    			if(item.user.getName().equals(user.getName())) {
//    				item.session.getAsyncRemote().sendText("<span class='text-danger small'>��ǰ������</span>"+","+"ϵͳ֪ͨ"+","+username+",0");
//    			}
//    			log.info("����------------------------------------------����������");
//    		}
    		
    	}
//        for (Websocket item : clients.values()) { 
//            if (item.user.getName().equals(To) )  
//                item.session.getAsyncRemote().sendText(message+","+user.getName());  
//        }  
    }  
      
    public void sendMessageAll(String message) throws IOException {  
        for (ChatController item : clients.values()) {  
            item.session.getAsyncRemote().sendText(message);  
        }  
    }  
      
      
  
    public static synchronized int getOnlineCount() {
        return onlineCount;  
    }  
  
    public static synchronized void addOnlineCount() {  
    	ChatController.onlineCount++;  
    }  
  
    public static synchronized void subOnlineCount() {  
    	ChatController.onlineCount--;  
    }  
  
    public static synchronized Map<User, ChatController> getClients() {  
        return clients;  
    }
}


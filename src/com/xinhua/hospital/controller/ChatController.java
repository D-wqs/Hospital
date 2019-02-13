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
//websocket传值：前台链接模板：wd://localhost:8080/ssmDemo/ws/1/tom
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
//    @Resource此处无法使用注解，通过spring配置文件注入值
    @Resource
    private UserServiceImpl service_u;

	@OnOpen  
    public void onOpen(@PathParam("id")int id,@PathParam("name")String name, Session session) throws IOException {  
    	log.info("当前传来的值："+id+name);
    	try {
    		//service_u=(UserServiceImpl) ContextLoader.getCurrentWebApplicationContext().getBean("userServiceImpl");
    		log.info("当前service_u:"+service_u);
			user=service_u.findById(id);
			this.session=session;
			clients.put(user, this);
			addOnlineCount(); 
			log.info(user.getName()+"已连接,当前在线人数："+onlineCount);
			log.info("打印当前连接"+user.getName()+"："+session.toString());
			//在线通知
			for(ChatController item:clients.values()) {
				//发送当前在线人员
//				sendMessageAll("all,"+item.user.getName()+","+item.user.getId());
				log.info("当前在线人员："+item.user.getName());
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
//        System.out.println("已连接");  
    }  
  
    @OnClose  
    public void onClose() throws IOException {  
        
        clients.remove(user);  
        subOnlineCount();
        log.info(user.getName()+"连接关闭");
    }  
    /**
     * 接收来自用户的消息
     * @param message
     * @throws IOException
     */
    @OnMessage  
    public void onMessage(String message,Session session) throws IOException {  
    	log.info("传递来的值："+message); 
        JSONObject obj = JSONObject.parseObject(message);
        log.info("用户："+session.getId()+"发来的消息："+obj);
        
        //发送给某人
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
//            sendMessageAll("给所有人");  
//        }  
    }  
  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
    //谁发的什么(发送内容，接收者，发送者)
    public void sendMessageTo(String content, String Toname,String username) throws IOException {  
    	log.info(username+"->to:"+Toname);
    	for(ChatController item:clients.values()) {
    		//如果当前在线的用户里有要发送的目标对象，则发送message
    		log.info("当前人员信息："+item.user.toString());
    		
    		//找到目标，发送信息
    		if (item.user.getName().equals(Toname)) {
    			log.info(username+"找到对方---》："+Toname+"::::"+item.user.getName().equals(Toname));
    			User u=new User();
    			try {
					u=service_u.findByName(username);
					log.info("发送者的id:"+u.getId());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    			item.session.getAsyncRemote().sendText(content+","+Toname+","+username+","+u.getId());
    			log.info("发送------------------------------------------？");
    			//此处需要break
    			break;
    		}
//    		else {
//    			//否则告诉自己对方不在线
//    			if(item.user.getName().equals(user.getName())) {
//    				item.session.getAsyncRemote().sendText("<span class='text-danger small'>当前不在线</span>"+","+"系统通知"+","+username+",0");
//    			}
//    			log.info("发送------------------------------------------、、、、、");
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


package com.xinhua.hospital.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.xinhua.hospital.pojo.User;
/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * @author wqs
 *
 */
@ServerEndpoint("/websocket")
public class WebSocketController {
	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
	//若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static int onlineCount = 0;  
    private static Map<User, WebSocketController> clients = new ConcurrentHashMap<User, WebSocketController>();  
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;  
    private User user; 
    private static int id = 0;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static Vector<Session> room = new Vector<Session>();
	private static Logger log=Logger.getLogger(WebSocketController.class);
	
	/**
	 * 用户接入,连接建立成功调用的方法
	 * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(Session session){
		log.info("打印当前连接："+session.toString());
		room.addElement(session);
	}
	
	/**
	 * 接收到来自用户的消息
	 * @param message
	 * @param session
	 */
	@OnMessage
	public void onMessage(String message,Session session){
		log.info("打印发来的消息："+message);
		//把用户发来的消息解析为JSON对象
		log.info("----333："+JSONObject.parseObject(message));
		JSONObject obj = JSONObject.parseObject(message);
		log.info("----->："+obj);
		//向JSON对象中添加发送时间
		obj.put("date", df.format(new Date()));
		log.info("room:"+room.toString());
		//遍历聊天室中的所有会话
		for(Session se : room){
			//设置消息是否为自己的
			obj.put("isSelf", se.equals(session));
			//发送消息给远程用户
			log.info("--->"+obj.toString());
			se.getAsyncRemote().sendText(obj.toString());
		}
	}
	
	/**
	 * 用户断开
	 * @param session
	 */
	@OnClose
	public void onClose(Session session){
		room.remove(session);
	}
	
	/**
	 * 用户连接异常
	 * @param t
	 */
	@OnError
	public void onError(Throwable t){
		
	}
	

}

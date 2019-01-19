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
 * @ServerEndpoint ע����һ�����ε�ע�⣬���Ĺ�����Ҫ�ǽ�Ŀǰ���ඨ���һ��websocket��������,
 * ע���ֵ�������ڼ����û����ӵ��ն˷���URL��ַ,�ͻ��˿���ͨ�����URL�����ӵ�WebSocket��������
 * @author wqs
 *
 */
@ServerEndpoint("/websocket")
public class WebSocketController {
	//concurrent�����̰߳�ȫSet���������ÿ���ͻ��˶�Ӧ��MyWebSocket����
	//��Ҫʵ�ַ�����뵥һ�ͻ���ͨ�ŵĻ�������ʹ��Map����ţ�����Key����Ϊ�û���ʶ
	private static int onlineCount = 0;  
    private static Map<User, WebSocketController> clients = new ConcurrentHashMap<User, WebSocketController>();  
    //��ĳ���ͻ��˵����ӻỰ����Ҫͨ���������ͻ��˷�������
    private Session session;  
    private User user; 
    private static int id = 0;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static Vector<Session> room = new Vector<Session>();
	private static Logger log=Logger.getLogger(WebSocketController.class);
	
	/**
	 * �û�����,���ӽ����ɹ����õķ���
	 * @param session ��ѡ�Ĳ�����sessionΪ��ĳ���ͻ��˵����ӻỰ����Ҫͨ���������ͻ��˷�������
	 */
	@OnOpen
	public void onOpen(Session session){
		log.info("��ӡ��ǰ���ӣ�"+session.toString());
		room.addElement(session);
	}
	
	/**
	 * ���յ������û�����Ϣ
	 * @param message
	 * @param session
	 */
	@OnMessage
	public void onMessage(String message,Session session){
		log.info("��ӡ��������Ϣ��"+message);
		//���û���������Ϣ����ΪJSON����
		log.info("----333��"+JSONObject.parseObject(message));
		JSONObject obj = JSONObject.parseObject(message);
		log.info("----->��"+obj);
		//��JSON��������ӷ���ʱ��
		obj.put("date", df.format(new Date()));
		log.info("room:"+room.toString());
		//�����������е����лỰ
		for(Session se : room){
			//������Ϣ�Ƿ�Ϊ�Լ���
			obj.put("isSelf", se.equals(session));
			//������Ϣ��Զ���û�
			log.info("--->"+obj.toString());
			se.getAsyncRemote().sendText(obj.toString());
		}
	}
	
	/**
	 * �û��Ͽ�
	 * @param session
	 */
	@OnClose
	public void onClose(Session session){
		room.remove(session);
	}
	
	/**
	 * �û������쳣
	 * @param t
	 */
	@OnError
	public void onError(Throwable t){
		
	}
	

}

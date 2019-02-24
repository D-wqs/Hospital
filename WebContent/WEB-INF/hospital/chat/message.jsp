<%@page import="com.xinhua.hospital.service.Impl.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Bootstrap 模板</title>
      <meta charset="utf-8"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 	  <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
      <!-- 包括所有已编译的插件 -->
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/app.js"></script>
      <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
      <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
      <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
      <!-- UM相关资源 -->
		<link href="assets/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" charset="utf-8" src="assets/umeditor/umeditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="assets/umeditor/umeditor.min.js"></script>
		<script type="text/javascript" src="assets/umeditor/lang/zh-cn/zh-cn.js"></script>
      <style type="text/css">
      html,body{height:auto}
      </style>
   </head>
   <body>
	  <div class="container">
		<div class="row">
			<!--左边留言板-->
			<div class="col-lg-5">
				<div class="container-fluid">
				   		${user.name }留言发送给——>${doctor_name}
				</div>
				<button id='back'>返回</button>
			   	<div class="">
					<div class="well well-lg" style="height:300px;max-height:300px;overflow-y:auto" id="scroll">
						<div id="msg" style="max-height:400px;"></div><br/>			
						
					</div>
					
					
			   	</div>
			   	<div class="">
			   		<!-- 聊天内容发送区域 -->
					<div id="EditBox" class="">
					<!--style给定宽度可以影响编辑器的最终宽度-->
					<script type="text/plain" id="myEditor" style="width:100%;height:140px;"></script>
					<button id="send" type="button" class="btn btn-primary btn-block">发送</button>
					</div>
			   	</div>
			</div>
			<!--<div class="col-lg-2"></div>-->
			<!--右边在线人员-->
			<div class="col-lg-6">
				<div class="container">
				   	<div class="row">
				   	<hr/>
				   		<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo" id="info">治感冒</button>    
							<div id="demo" class="collapse ">
							   <ul id="getjson"></ul>
							</div>
				   	</div>
				</div>
				<div class="container">
				   	<div class="row">
				   	<input type="text" id="toApp">
				   	<input type="hidden" id="u_id">
				   	<input type="hidden" id="d_id">
				   	<button id="addApp">生成药单</button>
				</div>
			</div>
			</div>
		</div>   		
   	</div>
	
	<span id="tou"></span>
   </body>
   </body>
</html>
<script>
	//jquery入口函数
$(function(){
	if('WebSocket' in window) {
        console.log("此浏览器支持websocket");
        websocket = new WebSocket("ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/ws/${user.id}/${user.name}");
		
		} else if('MozWebSocket' in window) {
		alert("此浏览器只支持MozWebSocket");
		} else {
		alert("此浏览器只支持SockJS");
		}
		websocket.onopen = function(evnt) {
		$("#tou").html("链接服务器成功!")
		console.log("ws连接成功：",JSON.stringify(evnt))
		};
		websocket.onmessage = function(evnt) {
			//获取切分出来的消息和人员
			var info=evnt.data.split(",");
			console.log("消息",info[0]);	
			console.log("接收者：",info[1]);
			console.log("发送者：",info[2]);
			console.log("发送者id：",info[3]);
			$("#u_id").val(info[3]);
			console.log("通过聊天消息绑定病人id：",$("#u_id").val());
			console.log("--------->",$("#scroll").scrollTop(999999))
			$("#scroll").scrollTop(999999);//滚动条移动至最底部
			console.log("--------->====",$("#scroll").scrollTop(999999))
			$("#msg").append("<div class='pull-left'><span style='color:red'>"+"<a href="+"${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id="+info[3]+"&name="+info[2]+">"+info[2]+"</a>"+":</span>"+ info[0]+"</div><div class='clearfix'></div>");
//			if (info[0]!="all"){
//				$("#msg").append("<div class='pull-left'><span style='color:red'>"+"<a href="+"${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id="+info[3]+"&name="+info[2]+">"+info[2]+"</a>"+":</span>"+ info[0]+"</div><div class='clearfix'></div>");
//			}else{
//				$("#ss").append("<span>"+info[2]+"</span>");
//				//$("#ss").append("<a href='${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id="+info[2]+"&name="+info[1]+">"+info[1]+"</a>")
//			}
			
		
		};
		websocket.onerror = function(evnt) {};
		websocket.onclose = function(evnt) {
			alert("连接已断开");
		$("#tou").html("与服务器断开了链接!");
		};
		$('#send').bind('click', function() {
		send();
		});
		
//		function send() {
//		if(websocket != null) {
//		var message = document.getElementById('message').value;
//		websocket.send(message);
//		} else {
//		alert('未与服务器链接.');
//		}
//		};

	//实例化编辑器
    var um = UM.getEditor('myEditor',{
    	initialContent:"请输入聊天信息...",
    	autoHeightEnabled:false,
    	toolbar:[
            'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
            'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
            '| justifyleft justifycenter justifyright justifyjustify |',
            'link unlink | emotion image video  | map'
        ]
    });
    function send(){
    	if (!um.hasContents()) {  // 判断消息输入框是否为空
            // 消息输入框获取焦点
            um.focus();
            // 添加抖动效果
           // $('.edui-container').addClass('am-animation-shake');
            //setTimeout("$('.edui-container').removeClass('am-animation-shake')", 1000);
        } else {
        	//获取输入框的内容
        	var txt = um.getContent();
        	//输入框内容先发送到聊天框
        	$('#msg').append("<div class='pull-right'><span style='color:red'>${user.name}</span>"+txt+"</div><div class='clearfix'></div>");
        	$("#scroll").scrollTop(999999);//滚动条移动至最底部
        	//构建一个标准格式的JSON对象
        	var obj = JSON.stringify({
	    		username:"${user.name}",
	    		Toname:"${doctor_name}",
	    		content:txt
	    	});
            // 发送消息
            websocket.send(obj);
            // 清空消息输入框
            um.setContent('');
            // 消息输入框获取焦点
            um.focus();
        }
    
    };
	
});
$('#back').click(function(){
	history.go(-1);
});
//根据药品效果，查询有对应的药品信息
$("#info").click(function(){
	var info=$("#info").text();
	console.log("info的值：",info);
	 $.post("${pageContext.request.contextPath}/getMedicineinfo",
			 {
		 		Info:info
			 },
			 function(data,status){
	        console.log(data);
	        console.log(data.info);
	        $("#getjson").empty();//jQuery remove() 方法删除被选元素及其子元素。
	        for(var i=0;i<data.info.length;i++){
	        	console.log("json数组",data.info[i]);
	        	 var s_li="<li id='M'>"+data.info[i].id+","+data.info[i].name+"</li>";
	        	 
	        	$("#getjson").append(s_li);
	        }
	    });
});
$("#addApp").click(function(){
	var val=$("#toApp").val();
	var D_id=${user.id};
	var U_id=$("#u_id").val();
	console.log("输入的药品编码：",val);
	console.log("当前医生病人：",D_id,"+",U_id)
	//post发送到后台
	//医生开药，所以userid是医生
	$.post("${pageContext.request.contextPath}/addMedicineByDoctor",
			 {
		 		"Info":val,
		 		"D_id":D_id,
		 		"U_id":U_id
			 },
			 function(data,status){
	        console.log(data);
	        
	    });
})
$("#M").click(function(){
	console.log("m_info");
	alert("当前选中：",$("#M").val());
	var m_info=$("#M").val().split(",");
	console.log("m_info:",m_info);
})
</script>
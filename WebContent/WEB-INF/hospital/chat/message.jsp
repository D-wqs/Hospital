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
      
      </style>
   </head>
   <body>
	  <div class="container">
		<div class="row">
			<!--左边留言板-->
			<div class="col-lg-5">
				<div class="container-fluid">
				   		留言板发送——>${doctor_name}
				</div>
			   	<div class="">
			   		
					<div class="well well-lg" style="min-height:300px">
						<div id="msg"></div><br/>			
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
			<div class="col-lg-5">
				<div class="container-fluid">
				   		在线人员
				</div>
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									骨科
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${doctors}" var="u">
						       		<c:if test="${u.role==1}">
						       		<span>${u.name}</span><a href="${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id=${u.id}&name=${u.name}">留言</a>
						       		</c:if>
						       </c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
									耳鼻喉科
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
								cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
								vice lomo.
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
									眼科
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
								cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
								vice lomo.
							</div>
						</div>
					</div>
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
        console.log("${user.name}要连接，发送给${chatToDoctor.name}");
        websocket = new WebSocket("ws://${pageContext.request.getServerName()}:${pageContext.request.getServerPort()}${pageContext.request.contextPath}/ws/${user.id}/${user.name}");
		
		} else if('MozWebSocket' in window) {
		alert("此浏览器只支持MozWebSocket");
		} else {
		alert("此浏览器只支持SockJS");
		}
		websocket.onopen = function(evnt) {
		$("#tou").html("链接服务器成功!")
		};
		websocket.onmessage = function(evnt) {
			//获取切分出来的消息和人员
			var info=event.data.split(",");
			console.log("消息",info[0]);	
			console.log("传给谁：",info[1]);
			$("#msg").append("<div class='pull-left'><span style='color:red'>${doctor_name}:</span>"+ info[0]+"</div><div class='clearfix'></div>");
		
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
</script>
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
      <style type="text/css">
      
      </style>
   </head>
   <body>
	<div class="container" >
		<div class="row">
		<hr>
			<div class="col-lg-4"></div>
			<div class="col-lg-4 well" style="margin:auto">
				<h1>用户注册</h1>
				<form action="${pageContext.request.contextPath}/user/regist" method="POST" role="form">
				 <div class="form-group">
				   
				    <input type="text" name="name" placeholder="请输入名称" class="form-control"><br/>
				  </div>
				<div class="form-group">
				    
				    <input type="text" name="age" placeholder="请输入年龄" class="form-control"><br/>
				  </div>
				<div class="form-group">
				   
				    <input type="text" name="password" placeholder="请输入密码" class="form-control"><br/>
				  </div>
				<div class="form-group">
				    
				    <input type="text" name="email" placeholder="请输入邮箱" class="form-control"><br/>
				  </div>
				<div class="form-group">
				    
				    <input type="text" name="phone" placeholder="请输入手机号" class="form-control"><br/>
				  </div>
				<div class="form-group">
				    
				    <input type="text" name="location" placeholder="请输入住址" class="form-control"><br/>
				  </div>
				<input name="sex" type="radio" checked="checked" value="1" class="radio-inline"/>男 
				<input name="sex" type="radio" value="0" class="radio-inline"/>女
				<hr>
				<div class="row" >
					<div class="col-lg-3"></div>
					<div class="col-lg-3">
					<input type="submit" value="注册" style="margin:auto">
					</div>
					
					<div class="col-lg-2">
					<input type="reset" value="重置" style="margin:auto">
					</div>
					<div class="col-lg-4"></div>
				</div>
				</form>
				<span style="color:red">${msg_regist}</span>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	
   </body>
</html>
<script>
	//jquery入口函数
$(function(){
	$("#hello").click(function(){
	    $.post("http://localhost:8080/ssmDemo/image/upload",
	    {	
	    	file:"hello",
	        name:"菜鸟教程",
	        Url:"http://www.runoob.com"
	    },
	        function(data,status){
	    	console.log(data,"请求",status);
	        alert("数据: \n" + data + "\n状态: " + status);
	    });
	});
	$("#upload").click(function(){			
		var formData = new FormData($("#form_upload")[0]);
		console.log("form:",JSON.stringify(formData));
		//发送请求
		$.ajax({
             url:'${pageContext.request.contextPath}/image/upload',
             type:'POST',
             data:formData,
             //必须false才会自动加上正确的Content-Type
             contentType: false,
             //必须false才会避开jQuery对 formdata 的默认处理
             //XMLHttpRequest会对 formdata 进行正确的处理
             processData: false,
             success:function(data){
            	 console.log("返回的数据：",JSON.stringify(data));
                alert(data);
                $("#imgpath").attr("src",data);
                $("#imgpath").attr("display","none");
                console.log($(#imgpath));
             },
             error:function(data){
            	 console.log("错误",data);
                 alert(data);
                // alert("后台发生异常");
             },
             cache:false,
             async:true
        });
	});
});
</script>
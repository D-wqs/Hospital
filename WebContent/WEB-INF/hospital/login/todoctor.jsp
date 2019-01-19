<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      	div.{
      		border:1px solid red;
      	}
      </style>
   </head>
   <body>
      <div class="jumbotron" style="margin-bottom: 0px;">
	    <div class="container">
	        <h1>Hello这是超大屏幕Bootstrap页面</h1>
			<form action="doctor" method="POST">
			<input type="text" name="name"><br/>
			<input type="text" name="id" value="${id}"><br/>
			<div class="form-group">
		    <label for="name" style="width:300px">选择科室</label>
		    <select class="form-control" >
		      <option>骨科</option>
		      <option>呼吸内科</option>
		      <option>耳鼻喉科</option>
		      <option>口腔科</option>
		      <option>眼科</option>
		    </select>
	
		  </div>
			<span>${msg_u}</span>
			<input type="submit" value="登录">
			</form>
	    </div>
	  </div>
	
   </body>
</html>
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
      	
      </style>
   </head>
   <body>
      <div class="jumbotron" style="margin-bottom: 0px;background-color:rgba(0,0,0,0); ">
	    <div class="container">
	    	<div class="row">
	    		<div class="col-lg-4">
	    		</div>
	    		<div class="col-lg-4">
	    		<form role="form" id="form_upload" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/medicine/add">
				  <div class="form-group">
				    <label for="name">药品名</label>
				    <input type="text" class="form-control" name="name" placeholder="请输入名称">
				  </div>
				  <div class="form-group">
				    <label for="name">价格</label>
				    <input type="text" class="form-control" name="price" placeholder="请输入价格">
				  </div>
				  <div class="form-group">
				    <label for="name">数量</label>
				    <input type="text" class="form-control" name="count" placeholder="请输入数量">
				  </div>
				  <div class="form-group">
				    <label for="name">描述</label>
				    <input type="text" class="form-control" name="information" placeholder="请输入描述">
				  </div>
				  <div class="form-group">
				    <label for="inputfile">图片</label>
				    <input type="file" id="inputfile" name="file">
				  </div>
				  <button type="submit" class="btn btn-default">提交</button>
				 
				</form>
	    		</div>
	    		<div class="col-lg-4"></div>
	    	</div>
	    </div>
	  </div>
   </body>
</html>
<script>
$(function(){
	
})
</script>
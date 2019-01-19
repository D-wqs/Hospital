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
   </head>
   <body>
      <div class="jumbotron" style="margin-bottom: 0px;">
	    <div class="container">
	        <form action="${pageContext.request.contextPath}/image/upload" enctype="multipart/form-data" method="post" id="form_upload">
			<input type="file" name="file" />
			<input type="text" name="name" />
			<button onclick="upload()">上传</button>
			<input type="submit" value="提交">
			</form>
			<img alt="上传的图片" src="${fileUrl}">
	    </div>
	  </div>
   </body>
</html>
<script>
	//jquery入口函数
$(function(){
	// 获取节点，点击事件
	function upload(){
		var formData = new FormData($("#form_upload")[0]);
		console.log("form:",JSON.stringify(formData));
		//发送请求
		$.ajax({
             url:'${pageContext.request.contextPath}/image/upload',
             type:'post',
             data:formData,
             //必须false才会自动加上正确的Content-Type
             contentType: false,
             //必须false才会避开jQuery对 formdata 的默认处理
             //XMLHttpRequest会对 formdata 进行正确的处理
             processData: false,
             success:function(data){
            	 console.log("返回的数据：",JSON.stringify(data));
                alert(data);
             },
             error:function(data){
                 alert(data);
                 alert("后台发生异常");
             },
             cache:false,
             async:true
        });
	};
});
</script>
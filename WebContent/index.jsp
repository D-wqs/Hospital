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
      	.identity_left{
      		position: absolute;
      		backgroung-color:white;
      		border-radius: 40%;
      		width:100px;
      		height: 100px;
      		left: 30%;
      		top: 50%;
      		
      	}
      	.identity_right{
      		position: absolute;
      		backgroung-color:white;
      		border-radius: 40%;
      		width:100px;
      		height: 100px;
      		left: 60%;
      		top: 50%;
      		
      	}
      	.run{
      		font-family: "新宋体";
      		font-size: 25px;
      		text-align: center;
      		line-height: 100px;
      	}
      	.mydialog{
      	opacity:1;
      	position: relative;
      	top:50px;
      	}
      </style>
       
   </head>
   <script type="text/javascript">
   function checkname(){
	   $("#DorU").text(" ");
	   var name=$("#firstname").val();//jQuery 中val()方法用于设置值时
	   console.log("--->",name)
	   $.get("${pageContext.request.contextPath}/user/isDoctor?name="+name,function(data,status){
		    if (data=="yes"){
		    	//当前是医生账户
		    	$("#DorU").text("当前检测为"+name+"医生,已接入医生登录接口");
		    	console.log("....",$("#DorU").val());
		    }else{
		    	//当前非医生账户
		    	$("#DorU").text("当前检测为"+name+"用户，已接入用户登录接口");
		    }
		  });
	}
   </script>
   <body>
      <div class="jumbotron" style="margin-bottom: 0px;background-color:rgba(0,0,0,0); ">
      <a href="${pageContext.request.contextPath}/user/regist">注册</a>
	    <div class="container">
	       <!--  <a href="${pageContext.request.contextPath}/user/login"> -->
		        <div class="identity_left">
		        	<div class="run" data-toggle="modal" data-target="#myModal">
		        		医生版
		        	</div>
		        </div>
		        
	      <!--   </a> -->
		        <div class="identity_right">
		        	<div class="run" data-toggle="modal" data-target="#myModal">
		        		用户版
		        	</div>
		        </div>
	    </div>
	  </div>
	  <!-- 模态框（Modal） -->
				<div class="modal fade mydialog" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="width:600px;margin:90px auto">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									用户登录
								</h4>
							</div>
							<div class="modal-body">
								<form action="${pageContext.request.contextPath}/user/login" method="POST" class="form-horizontal" role="form">
								  <div class="form-group">
								    <label for="firstname" class="col-sm-2 control-label">名字</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="firstname" name="name" placeholder="请输入名字" onblur="checkname()" />
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="lastname" class="col-sm-2 control-label">密码</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="lastname" name="password" placeholder="请输入密码">
								    </div>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <div class="checkbox">
								        <label>
								          <input type="checkbox" name="remember" value="1">记住密码
								          <span id="DorU"></span>
								        </label>
								      </div>
								    </div>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <button type="submit" class="btn btn-default">登录</button>
								    </div>
								  </div>
								</form>
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
   </body>
</html>

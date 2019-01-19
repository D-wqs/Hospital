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
      .mydialog{
      	opacity:1;
      	position: absolute;
      	top:50px;
      	}
      </style>
   </head>
   <body>
      <div class="">
      	<!-- 导航栏 -->
      	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
		    <div class="navbar-header">
		        <a class="navbar-brand" href="${pageContext.request.contextPath}/main/list">新华医院</a>
		    </div>
		    <div>
		        <ul class="nav navbar-nav">
		            <li class="active"><a href="#">首页</a></li>
		            <li><a href="#">医院简介</a></li>
		            <li><a href="#new">新闻动态</a></li>
		            <li><a href="#">院务公开</a></li>
		            <li><a href="#">行政科室</a></li>
		            <li><a href="${pageContext.request.contextPath}/totalk">讨论区</a></li>
		            <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                    Java <b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">jmeter</a></li>
		                    <li><a href="#">EJB</a></li>
		                    <li><a href="#">Jasper Report</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">分离的链接</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">另一个分离的链接</a></li>
		                </ul>
		            </li>
		        </ul>
		    </div>
		    <ul class="nav navbar-nav navbar-right"> 
	            <li><a href="#"><span class="glyphicon glyphicon-user"></span>设置</a></li> 
	            <li><a href="${pageContext.request.contextPath}/user/exit"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li> 
	        </ul> 
		    </div>
		</nav>
		<!-- 轮播 -->
		<div id="myCarousel" class="carousel slide">
		    <!-- 轮播（Carousel）指标 -->
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>   
		    <!-- 轮播（Carousel）项目 -->
		    <div class="carousel-inner">
		        <div class="item active">
		            <img src="${pageContext.request.contextPath}/img/1.jpg" alt="First slide">
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath}/img/2.png" alt="Second slide">
		        </div>
		        <div class="item">
		            <img src="${pageContext.request.contextPath}/img/3.jpg" alt="Third slide">
		        </div>
		    </div>
		    <!-- 轮播（Carousel）导航 -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		    </a>
		</div>
	    <div class="container">
	    	<h2>Hello Health ${user.name}</h2>
	    	<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">认证为医生</button>
	        <p>
	        Bootstrap 导航栏可以动态定位。默认情况下，它是块级元素，它是基于在 HTML 中放置的位置定位的。通过一些帮助器类，
	        您可以把它放置在页面的顶部或者底部，或者您可以让它成为随着页面一起滚动的静态导航栏。
如果您想要让导航栏固定在页面的顶部，请向 .navbar class 添加 class .navbar-fixed-top。
	        </p>
	       <c:forEach items="${list_m}" var="m">
	       		<span>药品：${m.name}</span>
	       		<span>价格：${m.price}</span>
	       		
	       </c:forEach>
	    </div>
	    
	    <!-- 资讯中心 -->
	    <div class="container-fluid" style="text-align:center;background-color:#f8f8f8;padding:10px">
	    <span>INFOMATION CENTER</span>
	    <h3>资讯中心</h3>
	    <span>____</span>
	    </div>
	    <div class="container" style="margin-top:10px">
	    	<div class="col-lg-4" >
    			<div class="panel panel-success" >
				    <div class="panel-heading">
				        <h3 class="panel-title">面板标题</h3>
				    </div>
				    <div class="panel-body">
				       <img style="width:300px;margin:auto" src="${pageContext.request.contextPath}/img/14f9b3b78d7a4343895043bf448acb3b!400x400.jpeg"/>
				       
				       <div>新年快乐,zheli dsadadsfdhffaskjbgafg rg fl an gjnsadasakmkadkadkdamkm</div>
				    </div>
				</div>
	    	</div>
	        <div class="col-lg-4">
			<div class="panel panel-warning">
			    <div class="panel-heading">
			        <h3 class="panel-title">面板标题</h3>
			    </div>
			    <div class="panel-body">
			        这是一个基本的面板
			    </div>
			</div>
			</div>
	        <div class="col-lg-4">
	        	<div class="panel panel-info">
				    <div class="panel-heading">
				        <h3 class="panel-title">面板标题</h3>
				    </div>
				    <div class="panel-body">
				        这是一个基本的面板
				    </div>
				</div>		
	        </div>
	    </div>
	    
	    
	    
	  </div>
	  
		<!-- 模态框（Modal） -->
		<div class="modal fade mydialog" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">认证为医生</h4>
		            </div>
		            <div class="modal-body">
		            <form role="form" action="${pageContext.request.contextPath}/dept/getdoctors" method="POST">
		              <div class="form-group">
					    <label for="name">${user.name}</label>
					    <input type="hidden" class="form-control" value="${user.id}" name="doctor_id">
					  </div>
					  <div class="form-group">
					    <label for="name">选择科室</label>
					    <select class="form-control" name="name">
					      <option value="骨科">骨科</option>
					      <option value="呼吸内科">呼吸内科</option>
					      <option value="耳鼻喉科">耳鼻喉科</option>
					      <option value="眼科">眼科</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default">登录</button>
					    </div>
					  </div>
					</form>
		            
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		              
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
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
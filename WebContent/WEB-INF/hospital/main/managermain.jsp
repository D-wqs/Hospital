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
      	};
      	/* Custom Styles */
	    ul.nav-tabs{
	        width: 140px;
	        margin-top: 20px;
	        border-radius: 4px;
	        border: 1px solid #ddd;
	        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
	    }
	    ul.nav-tabs li{
	        margin: 0;
	        border-top: 1px solid #ddd;
	    }
	    ul.nav-tabs li:first-child{
	        border-top: none;
	    }
	    ul.nav-tabs li a{
	        margin: 0;
	        padding: 8px 16px;
	        border-radius: 0;
	    }
	    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
	        color: #fff;
	        background: #0088cc;
	        border: 1px solid #0088cc;
	    }
	    ul.nav-tabs li:first-child a{
	        border-radius: 4px 4px 0 0;
	    }
	    ul.nav-tabs li:last-child a{
	        border-radius: 0 0 4px 4px;
	    }
	    ul.nav-tabs.affix{
	        top: 30px; /* Set the top position of pinned element */
	    }
	    #myTab li{
	    width:200px;
	    text-align:center;
	    }
      </style>
   </head>
   <body>

      	<!-- 导航栏 -->
      	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		    <div class="container-fluid">
		    <div class="navbar-header">
		        <a class="navbar-brand" href="${pageContext.request.contextPath}/main/list">新华医院</a>
		    </div>
		    <div>
		        <ul class="nav navbar-nav">
		            <li class="active"><a href="#">首页</a></li>
		            <li><a href="#info">医院简介</a></li>
		            <li><a href="#new">新闻动态</a></li>
		            <li><a href="#department">院务公开</a></li>
		            <li><a href="#department">行政科室</a></li>
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
	            <li><a href="${pageContext.request.contextPath}/user/toupdate"><span class="glyphicon glyphicon-user"></span>设置</a></li> 
	            <li><a href="${pageContext.request.contextPath}/user/exit"><span class="glyphicon glyphicon-log-in"></span>注销</a></li> 
	        </ul> 
		    </div>
		</nav>
		 <c:forEach items="${doctors}" var="d">
	       		<span>医生名：${d.name}</span>
	       		<span>医生角色：${d.role}</span>
	       		
	       </c:forEach>
	       <hr>
	        <c:forEach items="${list_dept}" var="dept">
	       		<span>科室名：骨科</span>
	       		
	       		<span>医生姓名：${dept.name}</span>
	       </c:forEach>
	
	    <!-- 行政科室 -->
	    <div class="container-fluid" style="text-align:center;background-color:#f8f8f8;padding:10px" id="department">
	    <span>DEPARTMENT CENTER</span>
	    <h3>行政科室</h3>
	    <span>____</span>
	    </div>
		<!--列出科室人员-->
		<ul id="myTab" class="nav nav-tabs">
		    <li ><a href="#one" data-toggle="tab">骨科</a></li>
		    <li><a href="#two" data-toggle="tab">呼吸内科</a></li>
		    <li><a href="#three" data-toggle="tab">耳鼻喉科</a></li>
		    <li><a href="#four" data-toggle="tab">眼科</a></li>
		    
		</ul>
		<div id="myTabContent" class="tab-content">
		    <div class="tab-pane fade in active" id="one">
		    	<div class="row">
		    	<div class="col-lg-1"></div>
		        	<c:forEach items="${doctors}" var="u">
			       		<c:if test="${u.role==1}">
						<div class="col-lg-2">
					      <h4><strong class='text-success'>☞${u.name}</strong>医生</h4>
					      <img style="width:100px;height:100px;" alt="头像" src="${u.imgpath}">
					      <p>科室:骨科</p>
					      <p>职称：主任医师</p>
					      <p style="text-overflow:ellipsis;white-space: nowrap;overflow:hidden;">
					      手术擅长：各种人工关节置换（髋关节、膝关节、肩关节和肘关节等）和骨肿瘤手术治疗。
					      目前手手术主要进行人工关节置换、肿瘤保肢和股骨头坏死的治疗。效果满意。
					      熟练掌握各类人工关节置换包括髋关节置换、膝关节置换、肩关节置换、肘关节置换、踝关节置换、各种肿瘤型关节置换，
					      现每年1000多例。积累了丰富的经验。先天性髋关节脱位、感染后脱位等复杂关节置换经验丰富。
					      </p>
					      <span class="text-info">在线咨询：</span>
					      <a href="${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id=${u.id}&name=${u.name}">${u.name}</a>
						</div>
						</c:if>
						
			       </c:forEach>
		       </div>
		    </div>
		    <div class="tab-pane fade in " id="two">
		        <div class="row">
		    	<div class="col-lg-1"></div>
		        	<c:forEach items="${doctors}" var="u">
			       		<c:if test="${u.role==2}">
						<div class="col-lg-2">
					      <h4><strong class='text-success'>☞${u.name}</strong>医生</h4>
					      <img style="width:100px;height:100px;" alt="头像" src="${u.imgpath}">
					      <p>科室:呼吸内科</p>
					      <p>职称：主任医师</p>
					      <p style="text-overflow:ellipsis;white-space: nowrap;overflow:hidden;">
					      手术擅长：各种人工关节置换（髋关节、膝关节、肩关节和肘关节等）和骨肿瘤手术治疗。
					      目前手手术主要进行人工关节置换、肿瘤保肢和股骨头坏死的治疗。效果满意。
					      熟练掌握各类人工关节置换包括髋关节置换、膝关节置换、肩关节置换、肘关节置换、踝关节置换、各种肿瘤型关节置换，
					      现每年1000多例。积累了丰富的经验。先天性髋关节脱位、感染后脱位等复杂关节置换经验丰富。
					      </p>
					      <span class="text-info">在线咨询：</span>
					      <a href="${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id=${u.id}&name=${u.name}">${u.name}</a>
						</div>
						</c:if>
						
			       </c:forEach>
		       </div>
		    </div>
		   <div class="tab-pane fade in " id="three">
		        <div class="row">
		    	<div class="col-lg-1"></div>
		        	<c:forEach items="${doctors}" var="u">
			       		<c:if test="${u.role==3}">
						<div class="col-lg-2">
					      <h4><strong class='text-success'>☞${u.name}</strong>医生</h4>
					      <img style="width:100px;height:100px;" alt="头像" src="${u.imgpath}">
					      <p>科室:耳鼻喉科</p>
					      <p>职称：主任医师</p>
					      <p style="text-overflow:ellipsis;white-space: nowrap;overflow:hidden;">
					      手术擅长：各种人工关节置换（髋关节、膝关节、肩关节和肘关节等）和骨肿瘤手术治疗。
					      目前手手术主要进行人工关节置换、肿瘤保肢和股骨头坏死的治疗。效果满意。
					      熟练掌握各类人工关节置换包括髋关节置换、膝关节置换、肩关节置换、肘关节置换、踝关节置换、各种肿瘤型关节置换，
					      现每年1000多例。积累了丰富的经验。先天性髋关节脱位、感染后脱位等复杂关节置换经验丰富。
					      </p>
					      <span class="text-info">在线咨询：</span>
					      <a href="${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id=${u.id}&name=${u.name}">${u.name}</a>
						</div>
						</c:if>
						
			       </c:forEach>
		       </div>
		    </div>
		    <div class="tab-pane fade in " id="four">
		        <div class="row">
		    	<div class="col-lg-1"></div>
		        	<c:forEach items="${doctors}" var="u">
			       		<c:if test="${u.role==4}">
						<div class="col-lg-2">
					      <h4><strong class='text-success'>☞${u.name}</strong>医生</h4>
					      <img style="width:100px;height:100px;" alt="头像" src="${u.imgpath}">
					      <p>科室:眼科</p>
					      <p>职称：主任医师</p>
					      <p style="text-overflow:ellipsis;white-space: nowrap;overflow:hidden;">
					      手术擅长：各种人工关节置换（髋关节、膝关节、肩关节和肘关节等）和骨肿瘤手术治疗。
					      目前手手术主要进行人工关节置换、肿瘤保肢和股骨头坏死的治疗。效果满意。
					      熟练掌握各类人工关节置换包括髋关节置换、膝关节置换、肩关节置换、肘关节置换、踝关节置换、各种肿瘤型关节置换，
					      现每年1000多例。积累了丰富的经验。先天性髋关节脱位、感染后脱位等复杂关节置换经验丰富。
					      </p>
					      <span class="text-info">在线咨询：</span>
					      <a href="${pageConntext.request.contextPath}/ssmDemo/toWriteMessage?id=${u.id}&name=${u.name}">${u.name}</a>
						</div>
						</c:if>
						
			       </c:forEach>
		       </div>
		    </div>
		</div>
	    <hr>
		<!-- 医药器械 -->
	    <div class="container-fluid" style="text-align:center;background-color:#f8f8f8;padding:10px" id="info">
	    <span>DEPARTMENT CENTER</span>
	    <h3>医药器械</h3>
	    <span>____</span>
	    </div>
	    <div class='container'>
	    	<div class="row">
	    		<hr>
		    	<c:forEach items="${list_m}" var="m">
		       		<div class="col-lg-2">
		       			<img alt="" src="${m.image}" style="width:100px;height:100px;">
		       		   <p>药品：${m.name}</p>
		       		   <p>价格：${m.price}</p>
		       		</div>
		       		  
		       		
		        </c:forEach>	
		        <a href='${pageConntext.request.contextPath}/ssmDemo/toMedicine'>添加</a>
	    	</div>
	    </div>
	   <!-- 表格 -->
	   <div class="container">
	   		<div class="row">
	   		 <div class="table-responsive">
				<table class="table">
				<caption>药品管理</caption>
				<thead>
					<tr>
						<th>药品</th>
						<th>价格</th>
						<th>库存</th>
						<th>信息</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list_m}" var="m">
		       		<tr>
		       			<td width="200px">
		       			<img alt="" src="${m.image}" style="width:100px;height:100px;">
		       			<span >${m.name}</span>
						</td>
		       			<td>${m.price}</td>
		       			<td>${m.count }</td>
		       			<td>${m.information }</td>
		       			<td>增加</td>
		       		</tr>
		        </c:forEach>
				
				</tbody>
				</table>
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
		            <form role="form" action="${pageContext.request.contextPath}/user/doctor" method="POST">
		              <div class="form-group">
					    <label for="name">${user.name}</label>
					    <input type="hidden" class="form-control" value="${user.id}" name="id">
					  </div>
					  <div class="form-group">
					    <label for="name">选择科室</label>
					    <select class="form-control" name="role">
					      <option value="1">骨科</option>
					      <option value="2">呼吸内科</option>
					      <option value="3">耳鼻喉科</option>
					      <option value="4">眼科</option>
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
		<div class="container">
		<hr>
		<div class='text-center text-muted small'>Copyright © 2017新华医院版权所有All Rights Reserved. 皖ICP备05009222号-3   Designed by Wanhu</div>
		</div>
	
   </body>
</html>
<script>
	//jquery入口函数
$(function(){
	$('#myCarousel').carousel({interval: 400});
	
	
});
</script>
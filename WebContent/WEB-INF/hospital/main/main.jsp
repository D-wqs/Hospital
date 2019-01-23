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
	            <li><a href="${pageContext.request.contextPath}/user/update"><span class="glyphicon glyphicon-user"></span>设置</a></li> 
	            <li><a href="${pageContext.request.contextPath}/user/exit"><span class="glyphicon glyphicon-log-in"></span>注销</a></li> 
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
		<!-- 医院简介 -->
	    <div class="container-fluid" style="text-align:center;background-color:#f8f8f8;padding:10px" id="info">
	    <span>DEPARTMENT CENTER</span>
	    <h3>医院简介</h3>
	    <span>____</span>
	    </div>
	    <div class="container" >
	    	<h1>Hello Health ${user.name}</h1>
	    	<c:if test="${user.role==0}">
	    	<button class="btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal">认证为医生</button>
	    	</c:if>
	        <p>
	        Bootstrap 导航栏可以动态定位。默认情况下，它是块级元素，它是基于在 HTML 中放置的位置定位的。通过一些帮助器类，
	        您可以把它放置在页面的顶部或者底部，或者您可以让它成为随着页面一起滚动的静态导航栏。
如果您想要让导航栏固定在页面的顶部，请向 .navbar class 添加 class .navbar-fixed-top。
	        </p>
	       <c:forEach items="${list_m}" var="m">
	       		<span>药品：${m.name}</span>
	       		<span>价格：${m.price}</span>
	       </c:forEach>
	     <hr>
	        <c:forEach items="${doctors}" var="d">
	       		<span>医生名：${d.name}</span>
	       		<span>医生角色：${d.role}</span>
	       		
	       </c:forEach>
	       <hr>
	        <c:forEach items="${list_dept}" var="dept">
	       		<span>科室名：骨科</span>
	       		
	       		<span>医生姓名：${dept.name}</span>
	       </c:forEach>
	    </div>
	    
	    <!-- 资讯中心 -->
	    <div class="container-fluid" style="text-align:center;background-color:#f8f8f8;padding:10px" id="new">
	    <span>INFOMATION CENTER</span>
	    <h3>资讯中心</h3>
	    <span>____</span>
	    </div>
	    <div class="container" style="margin-top:10px">
	    	<div class="col-lg-3" >
    			<div class="panel panel-success" >
				    <div class="panel-heading" style="text-align:center;line-height:100px;color:white;width:100%;height:100px;background-size:100% 100%;background-repeat:repeat;background-image:url('${pageContext.request.contextPath}/img/new4.jpg')">
				        <div class="panel-title">职工文化</div>
				    </div>
				    <div class="panel-body">				       
				       <div>
							<ul class="list-unstyled text-justify" style="text-overflow:ellipsis;white-space: nowrap;overflow:hidden;">
							  <li>【看世界】万里赴约</li>
							  <span class="small text-muted text-justify">超出的段落会被省略号代替，依据宽度截取</span>
							  <li>【看世界】万里赴约</li>
							  <span class="small text-muted text-justify">这里是样式,段落中超出屏幕部分文字会自动换行，这里用描述新闻</span>
							  <li>【看世界】万里赴约</li>
							  <span class="small text-muted text-justify">这里是样式,段落中超出屏幕部分文字会自动换行，这里用描述新闻</span>
							  <li>【看世界】万里赴约</li>
							  <span class="small text-muted text-justify">这里是样式,段落中超出屏幕部分文字会自动换行，这里用描述新闻</span>
							</ul>
					   </div>
				    </div>
				</div>
	    	</div>
	        <div class="col-lg-3" >
			<div class="panel panel-warning">
			    <div class="panel-heading" style="text-align:center;line-height:100px;color:white;width:100%;height:100px;background-size:100% 100%;background-repeat:repeat;background-image:url('${pageContext.request.contextPath}/img/new2.jpg')">
			        <div class="panel-title" >面板标题</div>
			    </div>
			    <div class="panel-body">
			        这是一个基本的面板
			    </div>
			</div>
			</div>
	        <div class="col-lg-3">
	        	<div class="panel panel-info">
				    <div class="panel-heading" style="text-align:center;line-height:100px;color:white;width:100%;height:100px;background-size:100% 100%;background-repeat:repeat;background-image:url('${pageContext.request.contextPath}/img/new3.jpg')">
				        <div class="panel-title" >面板标题</div>
				    </div>
				    <div class="panel-body">
				        这是一个基本的面板
				    </div>
				</div>		
	        </div>
	        <div class="col-lg-3">
	        	<div class="panel panel-info">
				    <div class="panel-heading" style="text-align:center;line-height:100px;color:white;width:100%;height:100px;background-size:100% 100%;background-repeat:repeat;background-image:url('${pageContext.request.contextPath}/img/new1.jpg')">
				        <div class="panel-title">面板标题</div>
				    </div>
				    <div class="panel-body">
				        这是一个基本的面板
				    </div>
				</div>		
	        </div>
	    </div>
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
	    <!-- 科室简介 -->
	    <div class="container">
		   <div class="jumbotron" style="height：100px">
		        <h1>Bootstrap Affix</h1>
		   </div>
		    <div class="row">
		        <div class="col-xs-3" id="myScrollspy">
		            <ul class="nav nav-tabs nav-stacked" id="myNav">
		                <li class="active"><a href="#section-1">第一部分</a></li>
		                <li><a href="#section-2">第二部分</a></li>
		                <li><a href="#section-3">第三部分</a></li>
		                <li><a href="#section-4">第四部分</a></li>
		                <li><a href="#section-5">第五部分</a></li>
		            </ul>
		        </div>
		        <div class="col-xs-9">
		            <h2 id="section-1">第一部分</h2>
		            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Vestibulum id metus ac nisl bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet sagittis. In tincidunt orci sit amet elementum vestibulum. Vivamus fermentum in arcu in aliquam. Quisque aliquam porta odio in fringilla. Vivamus nisl leo, blandit at bibendum eu, tristique eget risus. Integer aliquet quam ut elit suscipit, id interdum neque porttitor. Integer faucibus ligula.</p>
		            <p>Vestibulum quis quam ut magna consequat faucibus. Pellentesque eget nisi a mi suscipit tincidunt. Ut tempus dictum risus. Pellentesque viverra sagittis quam at mattis. Suspendisse potenti. Aliquam sit amet gravida nibh, facilisis gravida odio. Phasellus auctor velit at lacus blandit, commodo iaculis justo viverra. Etiam vitae est arcu. Mauris vel congue dolor. Aliquam eget mi mi. Fusce quam tortor, commodo ac dui quis, bibendum viverra erat. Maecenas mattis lectus enim, quis tincidunt dui molestie euismod. Curabitur et diam tristique, accumsan nunc eu, hendrerit tellus.</p>
		            <hr>
		            <h2 id="section-2">第二部分</h2>
		            <p>Nullam hendrerit justo non leo aliquet imperdiet. Etiam in sagittis lectus. Suspendisse ultrices placerat accumsan. Mauris quis dapibus orci. In dapibus velit blandit pharetra tincidunt. Quisque non sapien nec lacus condimentum facilisis ut iaculis enim. Sed viverra interdum bibendum. Donec ac sollicitudin dolor. Sed fringilla vitae lacus at rutrum. Phasellus congue vestibulum ligula sed consequat.</p>
		            <p>Vestibulum consectetur scelerisque lacus, ac fermentum lorem convallis sed. Nam odio tortor, dictum quis malesuada at, pellentesque vitae orci. Vivamus elementum, felis eu auctor lobortis, diam velit egestas lacus, quis fermentum metus ante quis urna. Sed at facilisis libero. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum bibendum blandit dolor. Nunc orci dolor, molestie nec nibh in, hendrerit tincidunt ante. Vivamus sem augue, hendrerit non sapien in, mollis ornare augue.</p>
		            <hr>
		            <h2 id="section-3">第三部分</h2>
		            <p>Integer pulvinar leo id risus pellentesque vestibulum. Sed diam libero, sodales eget sapien vel, porttitor bibendum enim. Donec sed nibh vitae lorem porttitor blandit in nec ante. Pellentesque vitae metus ipsum. Phasellus sed nunc ac sem malesuada condimentum. Etiam in aliquam lectus. Nam vel sapien diam. Donec pharetra id arcu eget blandit. Proin imperdiet mattis augue in porttitor. Quisque tempus enim id lobortis feugiat. Suspendisse tincidunt risus quis dolor fringilla blandit. Ut sed sapien at purus lacinia porttitor. Nullam iaculis, felis a pretium ornare, dolor nisl semper tortor, vel sagittis lacus est consequat eros. Sed id pretium nisl. Curabitur dolor nisl, laoreet vitae aliquam id, tincidunt sit amet mauris.</p>
		            <p>Phasellus vitae suscipit justo. Mauris pharetra feugiat ante id lacinia. Etiam faucibus mauris id tempor egestas. Duis luctus turpis at accumsan tincidunt. Phasellus risus risus, volutpat vel tellus ac, tincidunt fringilla massa. Etiam hendrerit dolor eget ante rutrum adipiscing. Cras interdum ipsum mattis, tempus mauris vel, semper ipsum. Duis sed dolor ut enim lobortis pellentesque ultricies ac ligula. Pellentesque convallis elit nisi, id vulputate ipsum ullamcorper ut. Cras ac pulvinar purus, ac viverra est. Suspendisse potenti. Integer pellentesque neque et elementum tempus. Curabitur bibendum in ligula ut rhoncus.</p>
		            <p>Quisque pharetra velit id velit iaculis pretium. Nullam a justo sed ligula porta semper eu quis enim. Pellentesque pellentesque, metus at facilisis hendrerit, lectus velit facilisis leo, quis volutpat turpis arcu quis enim. Nulla viverra lorem elementum interdum ultricies. Suspendisse accumsan quam nec ante mollis tempus. Morbi vel accumsan diam, eget convallis tellus. Suspendisse potenti.</p>
		            <hr>
		            <h2 id="section-4">第四部分</h2>
		            <p>Suspendisse a orci facilisis, dignissim tortor vitae, ultrices mi. Vestibulum a iaculis lacus. Phasellus vitae convallis ligula, nec volutpat tellus. Vivamus scelerisque mollis nisl, nec vehicula elit egestas a. Sed luctus metus id mi gravida, faucibus convallis neque pretium. Maecenas quis sapien ut leo fringilla tempor vitae sit amet leo. Donec imperdiet tempus placerat. Pellentesque pulvinar ultrices nunc sed ultrices. Morbi vel mi pretium, fermentum lacus et, viverra tellus. Phasellus sodales libero nec dui convallis, sit amet fermentum sapien auctor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed eu elementum nibh, quis varius libero.</p>
		            <p>Vestibulum quis quam ut magna consequat faucibus. Pellentesque eget nisi a mi suscipit tincidunt. Ut tempus dictum risus. Pellentesque viverra sagittis quam at mattis. Suspendisse potenti. Aliquam sit amet gravida nibh, facilisis gravida odio. Phasellus auctor velit at lacus blandit, commodo iaculis justo viverra. Etiam vitae est arcu. Mauris vel congue dolor. Aliquam eget mi mi. Fusce quam tortor, commodo ac dui quis, bibendum viverra erat. Maecenas mattis lectus enim, quis tincidunt dui molestie euismod. Curabitur et diam tristique, accumsan nunc eu, hendrerit tellus.</p>
		            <p>Phasellus fermentum, neque sit amet sodales tempor, enim ante interdum eros, eget luctus ipsum eros ut ligula. Nunc ornare erat quis faucibus molestie. Proin malesuada consequat commodo. Mauris iaculis, eros ut dapibus luctus, massa enim elementum purus, sit amet tristique purus purus nec felis. Morbi vestibulum sapien eget porta pulvinar. Nam at quam diam. Proin rhoncus, felis elementum accumsan dictum, felis nisi vestibulum tellus, et ultrices risus felis in orci. Quisque vestibulum sem nisl, vel congue leo dictum nec. Cras eget est at velit sagittis ullamcorper vel et lectus. In hac habitasse platea dictumst. Etiam interdum iaculis velit, vel sollicitudin lorem feugiat sit amet. Etiam luctus, quam sed sodales aliquam, lorem libero hendrerit urna, faucibus rhoncus massa nibh at felis. Curabitur ac tempus nulla, ut semper erat. Vivamus porta ullamcorper sem, ornare egestas mauris facilisis id.</p>
		            <p>Ut ut risus nisl. Fusce porttitor eros at magna luctus, non congue nulla eleifend. Aenean porttitor feugiat dolor sit amet facilisis. Pellentesque venenatis magna et risus commodo, a commodo turpis gravida. Nam mollis massa dapibus urna aliquet, quis iaculis elit sodales. Sed eget ornare orci, eu malesuada justo. Nunc lacus augue, dictum quis dui id, lacinia congue quam. Nulla sem sem, aliquam nec dolor ac, tempus convallis nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla suscipit convallis iaculis. Quisque eget commodo ligula. Praesent leo dui, facilisis quis eleifend in, aliquet vitae nunc. Suspendisse fermentum odio ac massa ultricies pellentesque. Fusce eu suscipit massa.</p>
		            <hr>
		            <h2 id="section-5">第五部分</h2>
		            <p>Nam eget purus nec est consectetur vehicula. Nullam ultrices nisl risus, in viverra libero egestas sit amet. Etiam porttitor dolor non eros pulvinar malesuada. Vestibulum sit amet est mollis nulla tempus aliquet. Praesent luctus hendrerit arcu non laoreet. Morbi consequat placerat magna, ac ornare odio sagittis sed. Donec vitae ullamcorper purus. Vivamus non metus ac justo porta volutpat.</p>
		            <p>Vivamus mattis accumsan erat, vel convallis risus pretium nec. Integer nunc nulla, viverra ut sem non, scelerisque vehicula arcu. Fusce bibendum convallis augue sit amet lobortis. Cras porta urna turpis, sodales lobortis purus adipiscing id. Maecenas ullamcorper, turpis suscipit pellentesque fringilla, massa lacus pulvinar mi, nec dignissim velit arcu eget purus. Nam at dapibus tellus, eget euismod nisl. Ut eget venenatis sapien. Vivamus vulputate varius mauris, vel varius nisl facilisis ac. Nulla aliquet justo a nibh ornare, eu congue neque rutrum.</p>
		            <p>Suspendisse a orci facilisis, dignissim tortor vitae, ultrices mi. Vestibulum a iaculis lacus. Phasellus vitae convallis ligula, nec volutpat tellus. Vivamus scelerisque mollis nisl, nec vehicula elit egestas a. Sed luctus metus id mi gravida, faucibus convallis neque pretium. Maecenas quis sapien ut leo fringilla tempor vitae sit amet leo. Donec imperdiet tempus placerat. Pellentesque pulvinar ultrices nunc sed ultrices. Morbi vel mi pretium, fermentum lacus et, viverra tellus. Phasellus sodales libero nec dui convallis, sit amet fermentum sapien auctor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed eu elementum nibh, quis varius libero.</p>
		            <p>Morbi sed fermentum ipsum. Morbi a orci vulputate tortor ornare blandit a quis orci. Donec aliquam sodales gravida. In ut ullamcorper nisi, ac pretium velit. Vestibulum vitae lectus volutpat, consequat lorem sit amet, pulvinar tellus. In tincidunt vel leo eget pulvinar. Curabitur a eros non lacus malesuada aliquam. Praesent et tempus odio. Integer a quam nunc. In hac habitasse platea dictumst. Aliquam porta nibh nulla, et mattis turpis placerat eget. Pellentesque dui diam, pellentesque vel gravida id, accumsan eu magna. Sed a semper arcu, ut dignissim leo.</p>
		            <p>Sed vitae lobortis diam, id molestie magna. Aliquam consequat ipsum quis est dictum ultrices. Aenean nibh velit, fringilla in diam id, blandit hendrerit lacus. Donec vehicula rutrum tellus eget fermentum. Pellentesque ac erat et arcu ornare tincidunt. Aliquam erat volutpat. Vivamus lobortis urna quis gravida semper. In condimentum, est a faucibus luctus, mi dolor cursus mi, id vehicula arcu risus a nibh. Pellentesque blandit sapien lacus, vel vehicula nunc feugiat sit amet.</p>
		        </div>
		    </div>
		</div>
	  	<!-- 底部栏  已定义列表-->
	  	<div class="container_fluid" style="background-color:#f8f8f8;position:absolute;margin-bottom:0px;width:100%">
		  	<div class="container">
		  	<span>友情链接：</span>
		  	<dl>
			<dt>国家卫生健康委员会 | 国家食品药品监督委员会 | 中国疾病预防中心 | 安徽省卫生和计划生育委员会</dt>
			<dd>安徽医科大学第二附属医院| 安徽医科大学第一附属医院|临床输血与检验| 中国临床保健杂志|</dd>
			<dt>中华医学会 | 中国医院协会 | 安徽省医学会</dt>
			<dd>皖南医学院弋矶山医院| 安徽中医学院附属针灸医院| 安徽中医学院第一附属医院</dd>
			</dl>
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
   </body>
</html>
<script>
	//jquery入口函数
$(function(){
	//$("#myNav").affix({
   //     offset: { 
  //          top: 125 
  //    }
 //   });
	
});
</script>
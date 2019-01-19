<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>注册界面</h1>
<form action="regist" method="POST" enctype="multipart/form-data">
<input type="text" name="name" placeholder="请输入名称"><br/>
<input type="text" name="age" placeholder="请输入年龄"><br/>
<input type="text" name="password" placeholder="请输入密码"><br/>
<input type="text" name="email" placeholder="请输入邮箱"><br/>
<input type="text" name="phone" placeholder="请输入手机号"><br/>
<input type="text" name="location" placeholder="请输入住址"><br/>
<input name="sex" type="radio" checked="checked" value="1"/>男 
<input name="sex" type="radio" value="0" />女
<input type="file" name="file">
<input type="submit" value="注册">
<input type="reset" value="重置">
</form>
<span style="color:red">${msg_regist}</span>
</body>
</html>
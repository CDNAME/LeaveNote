<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>我的请假条</title>
<!-- Custom Theme files -->
<link href="css/loginstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
</head>
<script>
	<c:choose>
		<c:when test="${param.type==1}">
			alert("注册成功请登陆");
		</c:when>
		<c:when test="${param.type==2}">
			alert("注销成功欢迎下次光临");
		</c:when>
		<c:when test="${param.type==3}">
			alert("密码修改成功请重新登陆");
		</c:when>
		<c:when test="${param.type==4}">
			alert("账号或密码错误");
		</c:when>
	</c:choose>
</script>
<body>
<div class="login">
	<h2>我的请假条</h2>
	<div class="login-top">
		<h1>欢迎登录</h1>
		<form action="login" method="post">
			<input type="text" name="userNumber"  required  placeholder="手机号码/学号">
			<input type="password" name="password" required placeholder="密码" >
		    <div class="forgot">
		    	<a href="forgetpwd.jsp">忘记密码</a>
				<input type="submit"  value="登录" >
		    </div>
	    </form>
	</div>
	<div class="login-bottom">
		<h3>新用户 &nbsp;<a href="register.jsp">注册</a>&nbsp 这里</h3>
	</div>
</div>	
<div class="copyright">
	<p>Copyright &copy; 2015.Company name All rights reserved.<a href="http://www.mycodes.net/" target="_blank">我的请假条</a></p>
</div>
</body>
</html>
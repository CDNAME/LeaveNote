<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="_sessioncheckstudent.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户信息</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/zhangfan.css" />
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
			function getout(obj)
			{
			    if(confirm("是否真的要退出？"))
			    {
			       window.location.href="logout"
			    }
			    else return false;
			}
			function getchange(obj)
			{
			       window.location.href="change.jsp"
			}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<!--下面button中的代码用于水平排列与折叠排列的显示-->
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					 <span class="icon-bar"></span> 
					 <span class="icon-bar"></span> 
					 <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" onclick="location.href='student.jsp';return false;"><div class="btnback"></div>返  回</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">				
				<ul class="nav navbar-nav navbar-right">
					<li><a onclick="getchange(this)" style="cursor:pointer">修改信息</a></li>
					<li><a onclick="getout(this)" style="cursor:pointer">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="insertdiv">
	  <div class="heading">我的信息</div>
			<form>
			    <table class="table table-bordered table-striped" >
			       <tr>
			         <td><b>姓名</b></td>
			         <td>${student.name }</td>
			       </tr>
			       <tr>
			          <td><b>学号</b></td>
			          <td>${student.studentNumber }</td>
			       </tr>
			       <tr>
			          <td><b>专业</b></td>
			          <td>${student.department }</td>
			       </tr>
			       <tr>
			          <td><b>班级</b></td>
			          <td>${student.classes }</td>
			       </tr>
			       <tr>
			          <td><b>电话</b></td>
			          <td>${student.studentPhone }</td>
			       </tr>
			        <tr>
			         <td><b>性别</b></td>
			         <td>${student.sex }</td>
			       </tr>
			       <tr>
			          <td><b>宿舍号</b></td>
			          <td>${student.dormNumber }</td>
			       </tr>
			       <tr>
			          <td><b>家长电话</b></td>
			          <td>${student.parentPhone }</td>
			       </tr>
			       <tr>
			          <td><b>注册时间</b></td>
			          <td>${student.registertime }</td>
			       </tr>
			  </table>
		</form>
	</div>
	<br>
</body>
</html>
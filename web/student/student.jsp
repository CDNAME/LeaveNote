<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckstudent.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>欢迎来到请假登记系统！</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		<style>
			body 
			{
				margin-top: 50px;
			}
			.item,
			.showimg
			 {
				width: 100%;
				height: auto;
			}
			.introduce,
			.detail 
			{
				margin-top:100px;
				margin-left: auto;
				margin-right: auto;
				width: 90%;
				height: auto;
			}
			h4
			 {
				font: "微软雅黑";
				font-weight: bold;
				text-align: center;
			}
			.detail 
			{
				font-size: 15px;
				color: white;
				font-family: "微软雅黑";
			}
			.part 
			{
				float: left;
				margin-left: 5.5%;
				width: 26%;
				background-color: #101010;
				border-radius: 10px;
				padding: 10px;
			}
			.Dpart 
			{
				background-color:#222222;
				border-radius: 10px;
				padding: 10px;
				font-size: 15px;
				color: white;
				font-family: "微软雅黑";
				margin-bottom: 20px;
			}
		</style>
		<script>
			function getout(obj)//退出连接触发的事件
			{
			    if(confirm("是否真的要退出？"))
			    {
			       window.location.href="logout";
			    }
			    else return false;
			}
			function leavenote()
			{
			    window.location.href="leavenote.jsp";
			}	
			function information()
			{
			    window.location.href="information.jsp";
			}
		</script>
	</head>
	<body>
	    <!-- 导航栏开始 -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<!--下面button中的代码用于水平排列与折叠排列的显示-->
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
					<ul class="nav navbar-nav navbar-right">
						<li><a onclick="getout(this)" style="cursor:pointer">退出登录</a>
						</li>
					</ul>
				</div>
			</div>
		</nav><!-- 导航栏结束 -->
		<div class="introduce">
			<h4>欢迎登陆学生请假系统</h4>
			<hr style="border:0;background-color:gray;height:1px;" />
			 <div >
				<form style="margin-left:10px;margin-right:10px;">
				    <div align="center">
				          <input type="button" value="我要请假" class="btn btn-default" style="width:200px;background:#1E90FF" onclick="leavenote()"/><br><br>
	                      <a href="notelist?studentid=${student.id}"><input type="button" value="我的请假记录" class="btn btn-default" style="width:200px;background:#1E90FF" /></a><br><br>
	                      <input type="button" value="我的信息" class="btn btn-default" style="width:200px;background:#1E90FF" onclick="information()"/><br><br>
	                 </div>
				</form>
			</div>    
		</div>
	</body>
</html>

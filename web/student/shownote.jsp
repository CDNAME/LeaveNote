<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="_sessioncheckstudent.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>请假记录查询</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/zhangfan.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/Calendar3.js"></script>
<script>
    function chaxun()//按名字查询
    {
       var Cname=$("#Cname").val();
       if(Wdate=="")
       { 
         alert("请假时间不能为空！");
         return false;
       }
       else
       {
         window.location.href='showchaxun.jsp?Cname='+Cname;
       }     
    }
	function getout(obj)
	{
	  if(confirm("是否真的要退出？"))
	  {
		window.location.href="index.jsp";
	  }
	  else return false;
	}
</script>
</head>
<body>
   <!-- 导航栏开始 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<!--下面button中的代码用于水平排列与折叠排列的显示-->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span	class="icon-bar"></span>
				 <span class="icon-bar"></span> 
				 <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#" onclick="location.href='javascript:history.back()';return false;"><div class="btnback"></div>返  回</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">		
			<ul class="nav navbar-nav navbar-right">
				<li><a onclick="getout(this)">退出登录</a></li>
			</ul>
		</div>
	</div>
 </nav><!-- 导航栏结束 -->
	<!--疫情查询-->
	<div class="divselect">
			<div  class="divinline" style="width:79%;">
			<input type="text" id="Cname" class="form-control"  placeholder="请输入请假日期..." onClick="new Calendar().show(this);" readonly="readonly"/>
			</div>
	    	<div  class="divinline">
			<input type="button" value="查询" onclick="chaxun()" class="btn btn-default" style="background:#1E90FF"/>
	       </div>
	</div><br>
	<!--显示疫情记录-->
	<div class="insertdiv">
		<div id="divlist">
		
	        <a href="updatejilu.jsp?btime=&etime=" class="mya"><div class="showlist"><div class="left">
	                 请假时间:;姓名:;学号:
	        </div><div class="right"></div></div></a>			

       <a href="#" class="mya"><div class="showlist"><div class="left"><font color='red'>记录为空！</font></div><div class="right"></div></div></a>	

	    </div>				
		<!-- 显示页码部分div -->
		<div style="width: 100%; margin-top: -10px;text-align: center;">
		  <nav>
			<ul class="pagination" id="list">	
			  <!-- 上一页 -->		  
			  <li class="list"><a href='showchaxun.jsp?in_str_page=&Cname=' aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				        <li class="list"><a href="#"><font color='red'></font></a></li><!--当前页就不需要超链接，字体变红  -->
	         <li class="list"><a href='showchaxun.jsp?in_str_page=&Cname='></a></li> <!-- 页数 -->

			<!-- 下一页 -->
			<li class="list"><a href='showchaxun.jsp?in_str_page=&Cname=' aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		  </ul>
	    </nav>
      </div>
    </div>
  <div style="width: 100%; margin-top: -10px;text-align: center;">
    第页，每页显示行，总行
  </div>
</body>
</html>




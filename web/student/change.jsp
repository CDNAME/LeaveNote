<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="_sessioncheckstudent.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改信息</title>
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
<script type="text/javascript">
	//退出连接触发的方法			
		function getout(obj)
			{
			    if(confirm("是否真的要退出？"))
			    {
			       window.location.href="logout";
			    }
			    else return false;
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
				<a class="navbar-brand" href="#" onclick="location.href='javascript:history.back()';return false;"><div class="btnback"></div>返  回</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a onclick="getout(this)" style="cursor:pointer">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="insertdiv">
	  <div class="heading">修改信息</div>
		<form action="modify" method="post">
			<input type="hidden" name="studentnumber" value="${student.studentNumber}" >
            <div class="form-group">
                <label>姓名</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input name="name" class="form-control" placeholder="请输入真实姓名" maxlength="5" type="text" value="${student.name}">
                </div>
            </div>

            <div class="form-group has-feedback">
                <label>系</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th-large"></span></span>
                    <input name="department" class="form-control" placeholder="如软件工程" maxlength="9" type="text" value="${student.department }">
                </div>
            </div>

            <div class="form-group has-feedback">
                <label>班</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    <input name="class" class="form-control" placeholder="如2015软件工程" maxlength="15" type="text" value="${student.classes}">
                </div>
            </div>

            <div class="form-group has-feedback">
                <label>宿舍号</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                    <input name="dormnumber" class="form-control" placeholder="如14613" maxlength="6" type="text" value="${student.dormNumber}">
                </div>
            </div>

            <div class="form-group has-feedback">
                <label>家长的联系方式</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                    <input name="parentphone" class="form-control" maxlength="11" type="text" value="${student.parentPhone}">
                </div>
            </div>
            
            <div class="form-group has-feedback">
                <label>性别</label>
                <div class="input-group">
                    <label class="radio-inline">
				        <input type="radio" name="sex"  value="男" ${student.sex=='男'?'checked':''}>男
				    </label>
				    <label class="radio-inline">
				        <input type="radio" name="sex"   value="女" ${student.sex=='女'?'checked':''}>女
				    </label>
                </div>
            </div>

            <div class="form-group">
                <input class="form-control btn btn-primary" id="submit" value="提&nbsp;&nbsp;交&nbsp;&nbsp;修&nbsp;&nbsp;改" type="submit">
            </div>

            <div class="form-group">
                <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
            </div>
        </form>
	</div>
	<br>
</body>
</html>
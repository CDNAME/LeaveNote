<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@ include file="_sessioncheckstudent.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>请假页面</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-select.min.css" />
<link rel="stylesheet" href="../css/zhangfan.css" />
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="../js/laydate/laydate.js"></script>

<script>
	lay('#version').html('-v'+ laydate.v);
	var nowTime = new Date().valueOf();
	//执行一个laydate实例
	laydate.render({
	  elem: '#btime' ,
	  format: 'yyyy年MM月dd日',
	  value:"${begintime}",
	  min:nowTime
	});
	laydate.render({
	  elem: '#etime' ,
	  format: 'yyyy年MM月dd日',
	  value:"${endtime}",
	  min:nowTime
	});

	$(document).ready(
			function() {
				$("#btnOK").click(
						function() //提交按钮点击触发事件
						{
						    if(confirm("确定提交申请？"))
						    {
						    	var noteid = $("#noteid").val();
								var btime = ($("#btime").val()).substring(0, 10);
								var bclass = $("#bclass").val();
								var etime = ($("#etime").val()).substring(0, 10);
								var eclass = $("#eclass").val();
								var reason= $("#reason").val();  
								if (new Date(btime.replace(/[^\d]/g,'-'))-new Date(etime.replace(/[^\d]/g,'-'))>0)//由于IE不兼容2015-09-09格式的日期，需把日期转为2015/09/09，才可以判断
								{
									alert("请假开始时间不能大于请假结束时间！");
									return false;
								}
								if(new Date(btime.replace(/[^\d]/g,'-'))-new Date(etime.replace(/[^\d]/g,'-')) == 0)
								{
									if(eclass <= bclass){
										alert("结束节数必须大于开始节数");
										return false;
									}
								}
							    if (reason== "") 
								{
									alert("请假原因不能为空！");
									return false;
								} 
								else 
								{
									$.post("updatenote", {	
									noteid:noteid,
									btime:btime.replace(/[^\d]/g,'-'),
									bclass:bclass,
									etime:etime.replace(/[^\d]/g,'-'),
									eclass:eclass,
									reason:reason					   
									}, function() {
										alert("假条修改成功！");
										window.location.reload();
								});
							}
						}
						else return false;
						});
			});			
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
   <!-- 导航栏开始 -->
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
				<a class="navbar-brand" href="notelist.jsp"><div class="btnback"></div>返回</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a onclick="getout(this)" style="cursor:pointer">退出登录</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--添加病人疫情-->
	<div class="insertdiv">
	<div class="heading">请填写假条信息</div>
		<form>
			<input type="hidden" id="noteid" value="${noteid}">
			<div class="form-group col-md-12">
				<label for="btime">请假开始时间：</label>
			</div>
			<div class="form-group col-md-8">
				<input type="text" id="btime" name="btime" style="cursor:pointer" placeholder="请输入日期" class="form-control"  readonly="readonly"/>
			</div>
			<div class="form-group col-md-4">
				<select id="bclass" name="bclass" class="form-group selectpicker" >
					    <option value="1" ${bclass == 1 ? 'selected' : '' }>第1节</option>
					    <option value="2" ${bclass == 2 ? 'selected' : '' }>第2节</option>
					    <option value="3" ${bclass == 3 ? 'selected' : '' }>第3节</option>
					    <option value="4" ${bclass == 4 ? 'selected' : '' }>第4节</option>
					    <option value="5" ${bclass == 5 ? 'selected' : '' }>第5节</option>
					    <option value="6" ${bclass == 6 ? 'selected' : '' }>第6节</option>
					    <option value="7" ${bclass == 7 ? 'selected' : '' }>第7节</option>
					    <option value="8" ${bclass == 8 ? 'selected' : '' }>第8节</option>
					    <option value="9" ${bclass == 9 ? 'selected' : '' }>第9节</option>
					    <option value="10" ${bclass == 10 ? 'selected' : '' }>第10节</option>
					    <option value="11" ${bclass == 11 ? 'selected' : '' }>第11节</option>                                
					</select>
			</div>
			<div class="form-group col-md-12">
				<label for="etime">请假结束时间：</label>
			</div>
			<div class="form-group col-md-8">
				<input type="text" id="etime" name="etime" style="cursor:pointer" placeholder="请输入日期" class="form-control" readonly="readonly"/>
			</div>
			<div class="form-group col-md-4">
				<select class="form-group selectpicker" id="eclass" name="eclass" >
					    <option value="1">第1节</option>
					    <option value="2">第2节</option>
					    <option value="3">第3节</option>
					    <option value="4">第4节</option>
					    <option value="5">第5节</option>
					    <option value="6">第6节</option>
					    <option value="7">第7节</option>
					    <option value="8">第8节</option>
					    <option value="9">第9节</option>
					    <option value="10">第10节</option>
					    <option value="11">第11节</option>                               
					</select>
			</div>
			<div class="form-group col-md-12">
			    <label for="reason">请假原因：</label>
			    <textarea class="form-control" rows="3" id="reason" name="reason">${leavereason }</textarea>
			</div>
			<div style="text-align: center;margin-top: 10px;">
				<input type="button" value="提交" id="btnOK" class="btn btn-default" style="background:#1E90FF" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="重置"  class="btn btn-default" style="background:#1E90FF" />
			</div>
		</form>
	</div>
</body>
</html>
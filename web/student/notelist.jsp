<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="_sessioncheckstudent.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>请假记录查询</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/zhangfan.css" />
<link rel="stylesheet" href="../css/bootstrap-select.min.css" />
<script type="text/javascript" src="../js/laydate/laydate.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-select.min.js"></script>
<script>
	lay('#version').html('-v'+ laydate.v);
	//执行一个laydate实例
	laydate.render({
	  elem: '#Cname' ,
	  format: 'yyyy年MM月dd日',
	  value:"${flagTime}",
	});
    function search()
    {
       var time=$("#Cname").val().substring(0, 10);
       var studentid = "${student.id }";
       var pass = $("#pass").val();
         $.post("notelist", {	
			studentid:studentid,
			time:time.replace(/[^\d]/g,'-')	,
			pass:pass,				   
			}, function(data) {
					window.location.reload();
			});
            
    }
	 function getout(obj)
	{
	    if(confirm("是否真的要退出？"))
	    {
	       window.location.href="logout";
	    }
	    else return false;
	}	
	function confirmDel()
	{	
	    if(confirm("确定删除吗？"))
	    {
	         var studentid = $("#del_studentid").val();
      		 var noteid = $("#del_noteid").val();
       		 var pass = $("#del_pass").val();
       		 var time = $("#del_time").val();
       		 var pageSize = $("#del_pageSize").val();
       		 var pageNum = $("#del_pageNum").val();
	         $.post("delete", {	
				studentid:studentid,
				noteid:noteid,
				time:time.replace(/[^\d]/g,'-')	,
				pass:pass,		
				pageSize:pageSize,
				pageNum:pageNum,		   
				}, function(){
					window.location.reload();
				});
	    	
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
			<a class="navbar-brand" href="student.jsp"><div class="btnback"></div>返回</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">		
			<ul class="nav navbar-nav navbar-right">
				<li><a style="cursor:pointer" onclick="getout(this)">退出登录</a></li>
			</ul>
		</div>
	</div>
	 </nav>
	<div class="divselect">
			<div  class="divinline" style="width:50%;">
			<input type="text" id="Cname" class="form-control"  placeholder="请输入查询日期" style="cursor:pointer;"  readonly="readonly"/>
			</div>
			<div  class="divinline">
				<select id="pass" name="pass" class="form-control selectpicker" >
				    <option>审批状态</option>
				    <option value="同意" ${pass == '同意' ? 'selected' : '' } >同意</option>
				    <option value="不同意" ${pass == '不同意' ? 'selected' : '' }>不同意</option>
				    <option value="待审批" ${pass == '待审批' ? 'selected' : '' }>未审批</option>                               
				</select>
		      </div>
	    	<div  class="divinline">
			<input type="button" value="查询" onclick="search()" class="btn btn-default" style="background:#1E90FF"/>
	       </div>
	</div>
	
	<br>
	<div class="insertdiv">
		<div id="divlist">
			<c:forEach items="${pageUtil.list}" var = "each" varStatus="vars" >
					<c:choose>
    					<c:when test="${each.pass=='同意'}" ><a href="#"  class="mya"></c:when>
    					<c:otherwise><a href="shownote?noteid=${each.id}" class="mya"></c:otherwise>
    				</c:choose>
	    			<div class="showlist"><div class="left">
	                 ${each.starttime }第${each.startclass }节<b>&nbsp;&nbsp;&nbsp;到&nbsp;&nbsp;&nbsp;</b>${each.endtime }第${each.endclass}节&nbsp;&nbsp;&nbsp;共${each.classesNumber}<br/>请假理由：&nbsp;&nbsp;&nbsp;${each.leaveReason}&nbsp;&nbsp;&nbsp;&nbsp;
	                       审批状态
	                 <c:choose>
    					<c:when test="${each.pass=='同意'}" ><font style="color:green"><b>同意</b></font></c:when>
    					<c:when test="${each.pass=='不同意'}" ><font style="color:red"><b>不同意</b></font></c:when>
    					<c:otherwise><font style="color:orange"><b>待审批</b></font>&nbsp;&nbsp;&nbsp;<a  onclick="confirmDel()"  style="cursor:pointer;">删除</a></c:otherwise>
    				</c:choose> 
	        		</div><div class="right"></div></div></a>	
	        		<input type="hidden" id="del_pass" value="${pass}">
	        		<input type="hidden" id="del_time" value="${time }">
	        		<input type="hidden" id="del_pageNum" value="${ pageUtil.pageNum}">
	        		<input type="hidden" id="del_pageSize" value="${ pageUtil.pageSize}">
	        		<input type="hidden" id="del_noteid" value="${each.id }">
	        		<input type="hidden" id="del_studentid" value="${student.id }">
    		</c:forEach>		
		<c:choose>
			<c:when test="${pageUtil.list[0] == null}" ><a href="#" class="mya"><div class="showlist"><div class="left"><font color='red'>记录为空！</font></div><div class="right"></div></div></a>	</c:when>
		</c:choose>
       

	    </div>				
		<!-- 显示页码部分div -->
		<div style="width: 100%; margin-top: -10px;text-align: center;">
		  <nav>
			<ul class="pagination" id="list">	
			  <!-- 上一页 -->
				<c:choose>
   					<c:when test="${pageUtil.hasPrevious}">
   						<input type="hidden" value="${pageUtil.firstPageNum }">
   						<input type="hidden" value="${pageUtil.firstPageNum }">
   						<li class="list"><a href="notelist?studentid=${student.id }&pageNum=${pageUtil.firstPageNum }&pageSize=${pageUtil.pageSize}&time=${time}&pass=${pass}" >首页</a></li>
   						<li class="list"><a href="notelist?studentid=${student.id }&pageNum=${pageUtil.previousPage}&pageSize=${pageUtil.pageSize}&time=${time}&pass=${pass}" >上一页</a></li>
   					</c:when>
   				</c:choose>	  
		   		<c:forEach begin="${pageUtil.everyPageStart}" end="${pageUtil.everyPageEnd}" var="temp" >
   					<c:choose>
   						<c:when test="${temp==pageUtil.pageNum}">
   							<li class="list"><a style="cursor:pointer;"><font color="red">${temp }</font></a></li>
   						</c:when>
   						<c:otherwise>
   							<li class="list"><a href="notelist?studentid=${student.id }&pageNum=${temp}&pageSize=${pageUtil.pageSize}&time=${time}&pass=${pass}">${temp }</a></li>
   						</c:otherwise>
   					</c:choose>
   				</c:forEach>
   				<c:choose>
   					<c:when test="${pageUtil.hasNext}">
   						<li class="list"><a href="notelist?studentid=${student.id }&pageNum=${pageUtil.endPageNum}&pageSize=${pageUtil.pageSize}&time=${time}&pass=${pass}" >尾页</a></li>
   						<li class="list"><a href="notelist?studentid=${student.id }&pageNum=${pageUtil.nextPage}&pageSize=${pageUtil.pageSize}&time=${time}&pass=${pass}" >下一页</a></li>
   					</c:when>
   				</c:choose> 
		  </ul>
	    </nav>
      </div>
    </div>
  <div style="width: 100%; margin-top: -10px;text-align: center;">
    共<font color="red" >${pageUtil.rowCount}</font>条记录， 页码<font color="red">${pageUtil.pageNum}</font>/<font color="red">${pageUtil.pageCount}</font>
  </div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckteacher.jsp"%>
<%@ page import="com.note.bean.Teacher" %>
<%
    Teacher teachers = (Teacher)session.getAttribute("teacher");
    String teachername = teachers.getName();
%>
<html>
<head>
    <title>top</title>
    <base target="body"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <style>
        A:link /* 正常时的样式 */
        {
            COLOR: white;
            TEXT-DECORATION: none
        }

        A:visited /*点击过后的样式  */
        {
            color: white;
            text-decoration: none;
        }

        A:hover /*鼠标覆盖的样式  */
        {
            COLOR: #ff6600;
            TEXT-DECORATION: none
        }

        A:active /*鼠标点击一瞬间的样式  */
        {
            color: #ff6600;
            text-decoration: none;
        }
    </style>
</head>
<body><br>
<h1 style="text-align: center;"><font color="white">大学生请假登记系统</font></h1>
<table style="width:100%;">
    <tr>
        <td style="font-size: 10pt;text-align:right" valign="bottom">
            <font size=4 color="white">欢迎:</font><font size=4 color="red"><%=teachername%></font>&nbsp;|
            <a href="../logout.jsp" target="_parent"><font size=4>退出</font></a>
        </td>
    </tr>
</table>
</body>
</html>
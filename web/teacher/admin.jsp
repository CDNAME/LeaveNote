<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckteacher.jsp"%>
<html>
<head>
    <title>大学生请假登记系统</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        * {
            font-size: 10pt;
        }

        body {
            text-align: center;
        }

        .table {
            width: 100%;
            height: 100%;
            border: 1px solid gray; /*固定边框,1像素*/
            border-collapse: collapse; /*单线的列表边框*/
        }

        .table td {
            border: 1px solid gray; /*固定边框,1像素*/
        }

        iframe {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<table class="table" align="center"><!-- main.jsp页面用一个表格表示，用来显示那三张要连接的页面 -->
    <tr style="background: #1E90FF; height: 150px; "><!-- 第一行，只分为一列 ，放top.jsp页面-->
        <td colspan="2" align="center">
            <iframe frameborder="0" src="top.jsp" name="top"></iframe><!-- 连接top.jsp页面 -->
        </td>
    </tr>
    <tr><!-- 第二行，分为两列，第一列放left.jsp。第二列放body.jsp页面 -->
        <td width="200" align="center" valign="top">
            <iframe frameborder="0" width="100" src="left.jsp" name="left"></iframe>
        </td>
        <td>
            <iframe frameborder="0" src="body.jsp" name="body"></iframe>
        </td>
    </tr>
</table>
</body>
</html>
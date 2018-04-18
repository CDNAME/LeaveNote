<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
    session.invalidate();//清空session里面的所有值
%>
<html>
<title></title>
<head>
    <script language="javascript">
        window.location.href = "index.jsp";//跳到登录界面
    </script>
</head>
<body>
</body>
</html>
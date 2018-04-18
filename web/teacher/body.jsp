<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckteacher.jsp"%>

<html>
<head>
    <base href="">
    <title>body</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <script language="javascript" type="text/javascript">
        //获得当前时间的JS代码 2015年7月3日 10:40:55 格式
        var initializationTime = (new Date()).getTime();

        function showLeftTime() {
            var now = new Date();
            var year = now.getFullYear();//获取当前年，2015
            var month = now.getMonth() + 1;//月用0-11表示，所以加一个1
            var day = now.getDate();//获取当前日
            var hours = now.getHours();//获取当前小时
            var minutes = now.getMinutes();//获取当前分
            if (minutes < 10)//因为秒各位数时，前面没0
            {
                minutes = "0" + minutes;
            }
            var seconds = now.getSeconds();//获取当前秒
            if (seconds < 10)//因为秒各位数时，前面没0
            {
                seconds = "0" + seconds;
            }
            document.all.show.innerHTML = "" + year + "年" + month + "月" + day + "日 " + hours + ":" + minutes + ":" + seconds + "";
            //一秒刷新一次显示时间
            var timeID = setTimeout(showLeftTime, 1000);
        }
    </script>
</head>
<body onload="showLeftTime()">
<br>
&nbsp;<font color="red" size="3">当前时间:<label id="show"></label></font><!-- 显示当前时间，星期几 -->
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckteacher.jsp"%>
<%@ page import="com.note.bean.Student" %>
<%@ page import="com.note.dao.TeacherDAO" %>

<%
    final int PAGE_SIZE = 3;    //每页显示多少条记录

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");

    String strPageNo = request.getParameter("pageno");
    int pageNo = 1;
    if (strPageNo != null) {
        try {
            pageNo = Integer.parseInt(strPageNo);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
    if (pageNo < 1) {
        pageNo = 1;
    }
%>
<%
    List<Student> students = new ArrayList<Student>();
    //get all students
    int pageCount = TeacherDAO.getStudents(students, pageNo, PAGE_SIZE);

    if (pageNo > pageCount) pageNo = pageCount;
%>
<html>
<head>
    <title>学生列表</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <link href="../css/my_css.css" rel="stylesheet" type="text/css">
    <link href="../css/button_style.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" type="text/JavaScript">
        <%--删除当前学生--%>
        function deluser(id) {
            //创建ajax对象
            var xmlhttp = null;
            if (window.XMLHttpRequest) {// all modern browsers
                xmlhttp = new XMLHttpRequest();
            } else if (window.ActiveXObject) {// for IE5, IE6
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            //注册回调函数
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState == 4) {// 4 = "loaded"
                    if (xmlhttp.status == 200) {// 200 = "OK"
                        alert(xmlhttp.responseText);
                        window.location.reload();
                    } else {
                        alert("Problem retrieving data:" + xmlhttp.status);
                    }
                }
            }
            //开启通道
            xmlhttp.open("GET", "deluser?id="+id, true);
            xmlhttp.send(null);
        }
    </script>
</head>
<body class='my_text_11'>
<br>
<form name="Form_input" method="post" action="studentlist.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="5" bgcolor="#44ade9"></td>
        </tr>
    </table>
    <!--正文表格头横线结束-->
    <!--显示用户信息表格开始-->
    <table id="my_Tab" name="my_Tab" width="100%" border="0" cellspacing="1" cellpadding="5"
           style="word-break:break-all" bgcolor="#e0e8ec">
        <tr><!-- 表格第一行，显示每列名称 -->
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>序号</strong></div>
                </div>
            </td>
            <td width="9%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>姓名</strong></div>
                </div>
            </td>

            <td width="9%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>学号</strong></div>
                </div>
            </td>

            <td width="15%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>系别</strong></div>
                </div>
            </td>
            <td width="15%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>专业</strong></div>
                </div>
            </td>
            <td width="15%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>宿舍号</strong></div>
                </div>
            </td>
            <td width="10%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>我的电话</strong></div>
                </div>
            </td>
            <td width="10%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>家长电话</strong></div>
                </div>
            </td>
            <td width="10%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>性别</strong></div>
                </div>
            </td>
            <td class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>操作</strong></div>
                </div>
            </td>
        </tr>
        <!-- 表格第一行，用于显示列名结束 -->
        <!--根据查询数据库的结果集，循环遍历结果集，一行一行的显示在表格中  -->
        <%
            String my_td_style = "BgWhite"; //用于控制表格每行的css
            int j = 0; //用于控制表格奇偶数行
            for (Iterator<Student> it = students.iterator(); it.hasNext(); ) {
                Student s = it.next();
                j++;
                if (1 == j % 2) my_td_style = "BgWhite";//每行交替显示不同的样式
                else my_td_style = "BgLightGray2";
        %>
        <!-- 表格第二行开始，显示查到的用户信息，放在相应列里面 -->
        <tr>
            <td class="<%=my_td_style %>"><!-- 序号列 -->
                <div align="center" class="my_text_11">
                    <div><%= s.getId()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 姓名 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getName()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 学号 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getStudentNumber()%>
                    </div>
                </div>
            </td>

            <td class="<%=my_td_style %>"><!-- 系别 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getDepartment()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 班级 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getClasses()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 宿舍号 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getDormNumber()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 电话 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getStudentPhone()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 父母电话 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getParentPhone()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 性别 -->
                <div align="center" class="my_text_11">
                    <div><%=s.getSex()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 操作列，都是根据用户在数据库中的ID来对相应的用户进行操作 -->
                <div align="center" class="my_text_11">
                    <div>
                        <a onclick = "if (confirm('确定要删除吗？')) return true;
                        else return false;"  href="javascript:deluser(<%=s.getId()%>)" class="button_small button-green"><span
                                class="write_text my_text_11">删除</span></a>
                    </div>
                </div>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <!--用于显示用户列表信息的表格结束  -->
    <br>
    <!--页码显示表格开始-->
    <center>
        <tr>
            <td align="center">
                <!--下面填写当前位置显示-->
                第<%=pageNo %>页&nbsp;/&nbsp;共<%=pageCount%>页
                <!--当前位置显示结束-->
            </td>
            <td align="center">
                <!--下面填写转到页码显示-->
                &nbsp;&nbsp;&nbsp;
                <a href="studentlist.jsp?pageno=1">首页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="studentlist.jsp?pageno=<%=pageNo - 1 %>">上一页</a><!--上一页，当前页码减1  -->
                &nbsp;&nbsp;&nbsp;
                <a id="nextpage" href="studentlist.jsp?pageno=<%=pageNo + 1 %>">下一页</a><!--下一页，当前页码加1  -->
                &nbsp;&nbsp;&nbsp;
                <a href="studentlist.jsp?pageno=<%=pageCount%>">末页</a>
            </td>
        </tr>
    </center>
    <!--显示页码的表格结束，一行两列  -->
</form><!--整个form表格结束  -->
<br>
</body>
</html>
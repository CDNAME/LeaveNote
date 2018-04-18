<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_sessioncheckteacher.jsp"%>
<%@ page import="com.note.bean.Notes" %>
<%@ page import="com.note.dao.NotesDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

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
    List<Notes> notes = new ArrayList<Notes>();
    //get all the products
    int pageCount = NotesDAO.getNotes(notes, pageNo, PAGE_SIZE, false);

    if (pageNo > pageCount)
        pageNo = pageCount;
%>

<html>
<head>
    <title>未审批假条</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <link href="../css/my_css.css" rel="stylesheet" type="text/css">
    <link href="../css/button_style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../js/Calendar3.js"></script>
</head>
<body>
<form name="Form_input" method="post" action="unchecklist.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="5" bgcolor="#44ade9"></td>
        </tr>
        <tr align="center">
            <td height="5" bgcolor="#44ade9">
                <font size="4" color="white"><b>学生请假记录表</b></font>
            </td>
        </tr>
    </table>
    <!--正文表格头结束-->
    <!--显示请假信息表格开始-->
    <table id="my_Tab" name="my_Tab" width="100%" border="0" cellspacing="1" cellpadding="5"
           style="word-break:break-all" bgcolor="#e0e8ec">
        <tr align="center">
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>编号</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>学号</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>姓名</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>系别</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>专业</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>宿舍号</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>电话</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>父母电话</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>请假原因</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>请假开始时间</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>请假结束时间</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>请假节数</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>请假申请时间</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>审批状态</strong></div>
                </div>
            </td>
            <td width="5%" background="../img/tb_bk.jpg" class="featuretitle">
                <div align="center" class="my_text_11">
                    <div class="zdbhh"><strong>打印</strong></div>
                </div>
            </td>
        </tr>
        <%
            String my_td_style = "BgWhite"; //用于控制表格每行的css
            int j = 0; //用于控制表格奇偶数行
            for (Iterator<Notes> it = notes.iterator(); it.hasNext(); ) {
                Notes n = it.next();
                j++;
                if (1 == j % 2) my_td_style = "BgWhite";//每行交替显示不同的样式
                else my_td_style = "BgLightGray2";
        %>
        <tr align="center">
            <td class="<%=my_td_style %>"><!-- 序号列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getId() %>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 学号列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getStudentNumber() %>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 姓名列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getName()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 系别列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getDepartment()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请假数列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getClasses()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 宿舍号列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getDormNumber()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 电话列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getStudentPhone()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 家长电话列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStudent().getParentPhone()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请假原因列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getLeaveReason()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请假起始时间列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getStarttime() + "第" + n.getStartclass() + "节"%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请假结束列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getEndtime() + "第" + n.getEndclass() + "节"%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请加节数列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getClassesNumber() + "节"%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 请假日期列 -->
                <div align="center" class="my_text_11">
                    <div><%=n.getNdate()%>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 审批列 -->
                <div align="center" class="my_text_11">
                    <div id="<%="radio_group"+j%>">
                        <script type="text/javascript">
                            // notesdate, studentphone, studentname 
                            var str = {"notesdate":"<%=n.getNdate()%>","studentphone":"<%=n.getStudent().getStudentPhone()%>","studentname":"<%=n.getStudent().getName()%>"};
                            sessionStorage.setItem("NotesJson"+<%=j%>, JSON.stringify(str));//将获取到的json字符串，保存到键为allJson中。
                        </script>
                        <label><input id="<%="radio_a" + j%>" type="radio" name="<%="passradio"+j%>" value="同意"
                                      onclick="checkpass(this.value,<%=n.getId()%>,<%=j%>)"/>同意</label><br>
                        <label><input id="<%="radio_b" + j%>" type="radio" name="<%="passradio"+j%>" value="不同意"
                                      onclick="checkpass(this.value,<%=n.getId()%>,<%=j%>)"/>不同意</label>
                    </div>
                </div>
            </td>
            <td class="<%=my_td_style %>"><!-- 打印列 -->
                <div align="center" class="my_text_11">
                    <div>
                        <a href="#" class="button_small button-green"><span
                                class="write_text my_text_11">打印</span></a>
                    </div>
                </div>
            </td>
        </tr>

        <%
            }
        %>
    </table>
    <br>
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
                <a href="unchecklist.jsp?pageno=1">首页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="unchecklist.jsp?pageno=<%=pageNo - 1 %>">上一页</a><!--上一页，当前页码减1  -->
                &nbsp;&nbsp;&nbsp;
                <a id="nextpage" href="unchecklist.jsp?pageno=<%=pageNo + 1 %>">下一页</a><!--下一页，当前页码加1  -->
                &nbsp;&nbsp;&nbsp;
                <a href="unchecklist.jsp?pageno=<%=pageCount%>">末页</a>
            </td>
        </tr>
    </center>
    <!--显示页码的表格结束，一行两列  -->
</form><!--整个form表格结束  -->
</body>
<script type="text/javascript">
    function checkpass(passstatus, notesid, radioid) {
        var notesalldate = JSON.parse(sessionStorage.getItem("NotesJson"+radioid));//将字符串抓换成对象
        //创建ajax对象
        var xmlhttp = null;
        if (window.XMLHttpRequest) {// all modern browsers
            xmlhttp = new XMLHttpRequest();
        } else if (window.ActiveXObject) {// for IE5, IE6
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (passstatus == "同意") {
            var passtext = window.confirm("您选择了同意该学生的请假申请,是否确定？");
            if (passtext) {
                //注册回调函数
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4) {// 4 = "loaded"
                        if (xmlhttp.status == 200) {// 200 = "OK"
                            //更新radio的选中状态
                            $("#radio_a" + radioid).attr("checked", "checked");
                            $("#radio_b" + radioid).removeAttr("checked");
                        } else {
                            alert("Problem retrieving data:" + xmlhttp.status);
                        }
                    }
                }
                //开启通道
                // var hh = sessionStorage.getItem("NotesJson");//获取键为allJson的字符串
                xmlhttp.open("GET", "Sms?passstatus=" + passstatus + "&notesid=" + notesid + "&notesdate=" + notesalldate.notesdate + "&studentphone=" + notesalldate.studentphone + "&studentname=" + notesalldate.studentname + "&oper=passOk", true);
                xmlhttp.send(null);
            } else {
                //更新radio的选中状态
                $("#radio_a" + radioid).removeAttr("checked");
            }
        } else if (passstatus == "不同意") {
            var unpassreason = window.prompt("您拒绝了该同学的请假申请,请给出理由:", "输入拒绝理由(不能为空)");
            if (unpassreason == "" || unpassreason == "输入拒绝理由(不能为空)") {     //判断拒绝理由是否为空
                window.alert("拒绝理由不能为空！");
                $("#radio_b" + radioid).removeAttr("checked");
            } else if (unpassreason) {  //拒绝理由不为空的操作
                //注册回调函数
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4) {// 4 = "loaded"
                        if (xmlhttp.status == 200) {// 200 = "OK"
                            //更新radio的选中状态
                            $("#radio_a" + radioid).removeAttr("checked");
                            $("#radio_b" + radioid).attr("checked", "checked");
                        } else {
                            $("#radio_b" + radioid).removeAttr("checked");
                            alert("Problem retrieving data:" + xmlhttp.status);
                        }
                    }
                }
                //开启通道
                xmlhttp.open("GET", "Sms?passstatus=" + passstatus + "&notesid=" + notesid + "&notesdate=" + notesalldate.notesdate + "&studentphone=" + notesalldate.studentphone + "&studentname=" + notesalldate.studentname + "&rejectreason=" + unpassreason + "&oper=passNo", true);
                xmlhttp.send(null);
            } else {        //点击取消按钮的操作
                //更新radio的选中状态
                $("#radio_b" + radioid).removeAttr("checked");
            }
        }
    }
</script>
</html>
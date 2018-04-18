<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="_sessioncheckteacher.jsp"%>
<%@ page import="com.note.bean.Notes" %>
<%@ page import="com.note.service.NotesManager" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
%>

<jsp:useBean id="searchBean" class="com.note.bean.NoteSearchBean">
    <jsp:setProperty name="searchBean" property="*" />
</jsp:useBean>

<%
    final int PAGE_SIZE = 3; //每页显示多少条记录
    final int PAGES_PER_TIME = 10;//每次显示多少个页码链接
    
    int pageNo = 1;
    String strPageNo = request.getParameter("pageNo");
    if (strPageNo != null && !strPageNo.trim().equals("")) {
        try {
            pageNo = Integer.parseInt(strPageNo);
        } catch (NumberFormatException e) {
            pageNo = 1;
        }
    }
    if (pageNo <= 0)
        pageNo = 1;
%>
<%
    List<Notes> notes = new ArrayList<Notes>();
    int totalRecords = NotesManager.find(notes, pageNo, PAGE_SIZE, searchBean);
    int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

    if (pageNo > totalPages)
        pageNo = totalPages;
%>
<html>
<head>
    <title></title>
    <link href="../css/css.css" rel="stylesheet" type="text/css">
    <link href="../css/my_css.css" rel="stylesheet" type="text/css">
    <link href="../css/button_style.css" rel="stylesheet" type="text/css">
</head>
<body>

<form name="search" method="post" action="searchnotes.jsp">
    <input type="hidden" name="pageNo"/>
    <input type="hidden" name="timeType" value="<%=searchBean.getTimeType()%>"/>
    <input type="hidden" name="startTime" value="<%=searchBean.getStartTime()%>"/>
    <input type="hidden" name="endTime" value="<%=searchBean.getEndTime()%>"/>
    <input type="hidden" name="classes" value="<%=searchBean.getClasses()%>"/>
</form>

<div style="margin-top:10px;margin-left:10px;">
    <a href="#" onclick="location.href='javascript:history.back()';return false;" hidefocus class="button button-brown"><span
            class="write_text my_text_11">返  回</span></a>
</div>
<br>
<div style="width:100%">&nbsp;
    <OBJECT id=WebBrowser classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 width=0>
    </OBJECT><!-- 导出excel和打印必须用到的 -->
    <input type="button" value="导出Excel" onclick="toExcel(t1)"/> &nbsp;
    <input type="button" value="打印" onclick="document.all.WebBrowser.ExecWB(6,6)"><!-- 打印按钮触发事件，不需要JS方法，只需这一句 -->
</div>
<form name="Form_input" method="post" action="">
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
                    <div>
                        <%
                            if (n.getPass().toString().equals("同意")) {
                        %>

                        <label><input type="radio" name=<%="passradio"+j%> value="同意" checked/>同意</label><br>
                        <label><input type="radio" name=<%="passradio"+j%> value="不同意"/>不同意</label>

                        <%
                        } else if(n.getPass().toString().equals("不同意")){
                        %>

                        <label><input type="radio" name=<%="passradio"+j%> value="同意"/>同意</label><br>
                        <label><input type="radio" name=<%="passradio"+j%> value="不同意" checked/>不同意</label>

                        <%
                        } else {
                        %>
                        <div id="<%="radio_group"+j%>">
                            <script type="text/javascript">
                                // notesdate, studentphone, studentname 
                                var str = {"notesdate":"<%=n.getNdate()%>","studentphone":"<%=n.getStudent().getStudentPhone()%>","studentname":"<%=n.getStudent().getName()%>"};
                                sessionStorage.setItem("NotesJson"+<%=j%>, JSON.stringify(str));//将获取到的json字符串，保存到键为allJson中。
                            </script>
                            <label><input id="<%="radio_a" + j%>" type="radio" name="<%="passradio"+j%>" value="同意" onclick="checkpass(this.value,<%=n.getId()%>,<%=j%>)"/>同意</label><br>
                            <label><input id="<%="radio_b" + j%>" type="radio" name="<%="passradio"+j%>" value="不同意" onclick="checkpass(this.value,<%=n.getId()%>,<%=j%>)"/>不同意</label>
                        </div>
                        <%
                            }
                        %>
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
</form>
<table align="center">
    <tr bgcolor="#f3f6fa">
        <td>
            &nbsp;共<%=totalRecords%>条请假记录&nbsp;
        </td>
        <td>
            &nbsp;<%=pageNo %>/<%=totalPages %>&nbsp;
        </td>

        <%
            int start = ((pageNo - 1) / PAGES_PER_TIME) * PAGES_PER_TIME + 1;
            for(int i=start; i<start+PAGES_PER_TIME; i++) {
                if(i > totalPages) break;
                if(pageNo == i) {
        %>
        <td bgcolor="#ffffff">&nbsp;<u><b><%=i %></b></u>&nbsp;</td>
        <%
        } else {
        %>
        <td>&nbsp;
            <a href="javascript:goPage(<%=i%>)"><%=i%></a>&nbsp;
        </td>
        <%
                }
            }
        %>
    </tr>
</table>
<!--显示页码的表格结束，一行两列  -->
<br>
</body>
<script type="text/javascript">
    //一下是点击导出excel按钮触发的方法
    var idTmr = "";

    //获取打印内容。
    function copy(t1)//t1为要导出数据表格的id
    {
        var oControlRange = document.body.createControlRange();
        oControlRange.add(t1, 0);
        oControlRange.select();
        document.execCommand("Copy");
    }

    function toExcel(t1) {   //t1为要导出数据表格的id
        //将区域复制到剪切板。
        copy(t1);
        try {
            //新建一个Excel程序。
            var xls = new ActiveXObject("Excel.Application");
        }
        catch (e) {
            alert("Excel没有安装或浏览器设置不正确.请启用所有Active控件和插件");
            return false;
        }
        xls.visible = true;
        //增加一个工作表。
        var xlBook = xls.Workbooks.Add;
        //增加一个工作薄
        var xlsheet = xlBook.Worksheets(1);
        //将工作薄一设定为活动状态。
        xlBook.Worksheets(1).Activate;
        //获取要输出的行数
        var hang = t1.rows.length;//取数据源行数
        //获取第一行的列数，就是所有列数。
        var lie = t1.rows(0).cells.length;//取数据源列数
        //遍历所有行。
        for (i = 0; i < hang; i++) {//在Excel中写行
            //遍历所有列
            for (j = 0; j < lie; j++) {
                //设置表格的格式。
                xlsheet.Cells(i + 1, j + 1).NumberFormatLocal = "@ ";
                xlsheet.Cells(i + 1, j + 1).Font.Size = 8;
            }
        }
        for (i = 0; i < hang; i++) {//在Excel中写行
            xlsheet.Rows(i + 1).RowHeight = 25;
        }
        xlsheet.Columns("A:A").ColumnWidth = 25;
        xlsheet.Columns("B:B").ColumnWidth = 10;
        xlsheet.Columns("C:C").ColumnWidth = 10;
        xlsheet.Columns("D:D").ColumnWidth = 10;
        xlsheet.Columns("E:E").ColumnWidth = 10;
        xlsheet.Columns("F:K").ColumnWidth = 12;
        //将内容复制到Excel。
        xlsheet.Paste;
        xls = null;
        idTmr = window.setInterval("Cleanup();", 1);
    }

    function Cleanup() {
        window.clearInterval(idTmr);
        CollectGarbage();
    }
    
    function goPage(pageNo) {
        document.search.pageNo.value=pageNo;
        document.search.submit();
    }

    function checkpass(passstatus,notesid,radioid) {
        var notesalldate = JSON.parse(sessionStorage.getItem("NotesJson"+radioid));//将字符串抓换成对象
        //创建ajax对象
        var xmlhttp = null;
        //创建ajax对象
        var xmlhttp = null;
        if (window.XMLHttpRequest) {// all modern browsers
            xmlhttp = new XMLHttpRequest();
        } else if (window.ActiveXObject) {// for IE5, IE6
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if(passstatus == "同意") {
            var passtext = window.confirm("您选择了同意该学生的请假申请,是否确定？");
            if (passtext) {
                //注册回调函数
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4) {// 4 = "loaded"
                        if (xmlhttp.status == 200) {// 200 = "OK"
                            //更新radio的选中状态
                            $("#radio_a"+radioid).attr("checked","checked");
                            $("#radio_b"+radioid).removeAttr("checked");
                            document.getElementById("radio_a"+radioid).checked = true;
                            document.getElementById("radio_b"+radioid).checked = false;
                        } else {
                            alert("Problem retrieving data:" + xmlhttp.status);
                        }
                    }
                }
                //开启通道
                xmlhttp.open("GET", "Sms?passstatus=" + passstatus + "&notesid=" + notesid + "&notesdate=" + notesalldate.notesdate + "&studentphone=" + notesalldate.studentphone + "&studentname=" + notesalldate.studentname + "&oper=passOk", true);
                xmlhttp.send(null);
            } else {
                //更新radio的选中状态
                document.getElementById("radio_a"+radioid).checked = false;
            }
        } else if(passstatus == "不同意") {
            var unpassreason = window.prompt("您拒绝了该同学的请假申请,请给出理由:","输入拒绝理由(不能为空)");
            if( unpassreason == "" || unpassreason == "输入拒绝理由(不能为空)") {     //判断拒绝理由是否为空
                window.alert("拒绝理由不能为空！");
                document.getElementById("radio_b"+radioid).checked = false;
            } else if (unpassreason) {  //拒绝理由不为空的操作
                //注册回调函数
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4) {// 4 = "loaded"
                        if (xmlhttp.status == 200) {// 200 = "OK"
                            //更新radio的选中状态
                            document.getElementById("radio_a"+radioid).checked = false;
                            document.getElementById("radio_b"+radioid).checked = true;
                        } else {
                            document.getElementById("radio_a"+radioid).checked = false;
                            alert("Problem retrieving data:" + xmlhttp.status);
                        }
                    }
                }
                //开启通道
                xmlhttp.open("GET", "Sms?passstatus=" + passstatus + "&notesid=" + notesid + "&notesdate=" + notesalldate.notesdate + "&studentphone=" + notesalldate.studentphone + "&studentname=" + notesalldate.studentname+ "&rejectreason=" + unpassreason + "&oper=passNo", true);
                xmlhttp.send(null);
            } else {        //点击取消按钮的操作
                //更新radio的选中状态
                document.getElementById("radio_b"+radioid).checked = false;
            }
        }
    }
    
</script>
</html>
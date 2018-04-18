<%
    String teacher = String.valueOf(session.getAttribute("teacher"));
    String student = String.valueOf(session.getAttribute("student"));
    if(teacher.equals("null")) {
        response.sendRedirect("../index.jsp");
        return;
    }
    if(!student.equals("null")) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
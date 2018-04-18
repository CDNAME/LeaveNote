<%
    String student = String.valueOf(session.getAttribute("student"));
    if(student.equals("null")) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
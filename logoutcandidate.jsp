<%-- 
    Document   : logoutcandidate
    Created on : Jun 10, 2019, 10:45:41 AM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        response.sendRedirect("index.html");
        %>
    </body>
</html>
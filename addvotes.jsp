<%-- 
    Document   : addvotes
    Created on : Jun 9, 2019, 10:00:54 PM
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
        String name=request.getParameter("name");
        out.print(name);
        %>
    </body>
</html>

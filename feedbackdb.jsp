<%-- 
    Document   : feedbackdb
    Created on : Jun 8, 2019, 6:28:34 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <%
    
String name=request.getParameter("name");
String feedback=request.getParameter("feedback");
String connectionURL = "jdbc:mysql://localhost:3306/voting";
Connection connection = null;
PreparedStatement pstatement = null;
int updateQuery = 0;
if(name!="" && feedback!="" )
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "INSERT INTO feedback(name,feedback) VALUES(?,?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1,name);
pstatement.setString(2,feedback);
updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
out.print("Your successfully register now you can login");
Thread.sleep(500);
response.sendRedirect("userhome.html");
}
}
catch(Exception e)
{
 out.print(e);   
}
}
else
{
    out.print("Enter all fields");
}
%>
    </body>
</html>


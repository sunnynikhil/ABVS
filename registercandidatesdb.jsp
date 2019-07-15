<%-- 
    Document   : registercandidatesdb
    Created on : Jun 8, 2019, 12:12:27 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>regsiter</title>
    </head>
    <body>
        
        <%
    
String first_name=request.getParameter("fname");
String last_name=request.getParameter("lname");
String partyname=request.getParameter("pname");
String district=request.getParameter("district");
String symbol=request.getParameter("Symbol");
String username=request.getParameter("username");
String password=request.getParameter("password");
String connectionURL = "jdbc:mysql://localhost:3306/voting";
Connection connection = null;
PreparedStatement pstatement = null;
int updateQuery = 0;
if(first_name!="" && last_name!="" && partyname!="" && district!="" && symbol!="" && username!="" && password!="")
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "INSERT INTO registers(firstname,lastname,partyname,district,symbol,position,username,password) VALUES(?,?,?,?,?,?,?,?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, first_name);
pstatement.setString(2, last_name);
pstatement.setString(3, partyname);
pstatement.setString(4, district);
pstatement.setString(5, symbol);
pstatement.setString(7, username);
pstatement.setString(8, password);
updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
out.print("Your successfully register now you can login");
Thread.sleep(500);
response.sendRedirect("login.html");
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

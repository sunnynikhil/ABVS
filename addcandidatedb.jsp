<%-- 
    Document   : addcandidatedb
    Created on : Jun 8, 2019, 3:26:47 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    
String name=request.getParameter("name");
String partyname=request.getParameter("pname");
String district=request.getParameter("district");
String connectionURL = "jdbc:mysql://localhost:3306/voting";
Connection connection = null;
int vote=0;
PreparedStatement pstatement = null;
int updateQuery = 0;
if(name!="" && partyname!="" && district!="" )
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "INSERT INTO candidates(candidatename,partyname,district) VALUES(?,?,?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, name);
pstatement.setString(2, partyname);
pstatement.setString(3, district);
updateQuery = pstatement.executeUpdate();
String query="insert into votes(candidatename,partyname,district,votes) values(?,?,?,?)";
pstatement = connection.prepareStatement(query);
pstatement.setString(1, name);
pstatement.setString(2, partyname);
pstatement.setString(3, district);
pstatement.setInt(4, vote);
updateQuery = pstatement.executeUpdate();
response.sendRedirect("home.html");
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

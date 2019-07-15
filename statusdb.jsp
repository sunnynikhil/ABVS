<%-- 
    Document   : statusdb
    Created on : Jun 8, 2019, 8:16:59 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <% 
            String name=request.getParameter("name");
            String connectionURL = "jdbc:mysql://localhost:3306/voting";
       Connection connection = null;
Statement statement = null;
ResultSet resultset=null;
int updateQuery = 0;
if(name!="")
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "SELECT  candidatename FROM candidates WHERE candidatename='"+name+"';" ;
statement = connection.createStatement();
resultset=statement.executeQuery(queryString);
int rowcount=0;
if(resultset.next())
{   
    rowcount=rowcount+1;


}
if(rowcount==1)
{
    response.sendRedirect("postivestatus.html");
}
else
{
    response.sendRedirect("negativestatus.html");
}
}
catch(Exception e)
{
    out.print(e);
}
}
else
{
    out.print("enter the fields");
}
            %>
    </body>
</html>

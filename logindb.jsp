<%-- 
    Document   : logindb
    Created on : Jun 8, 2019, 10:13:05 AM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logindb</title>
    </head>
    <body>
        <%
       String name=request.getParameter("username");
       String key=request.getParameter("password");
       String adhaar=request.getParameter("adhaarnumber");
       session.setAttribute("username",name);
       session.setAttribute("password",key);
       session.setAttribute("adhaarnumber", adhaar);
       String connectionURL = "jdbc:mysql://localhost:3306/voting";
       Connection connection = null;
Statement statement = null;
ResultSet resultset=null;
int updateQuery = 0;
if(name!="" && key!="" && adhaar!="")
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "SELECT username,password,adhaarnumber FROM users WHERE username='"+name+"'  AND password='"+key+"' AND adhaarnumber='"+adhaar+"';" ;
statement = connection.createStatement();
resultset=statement.executeQuery(queryString);
int rowcount=0;
if(resultset.next())
{   
    rowcount=rowcount+1;


}
if(rowcount==1)
{
    response.sendRedirect("userhome.html");
}

else
{
    out.print("invaild details");
}

}


catch(Exception e)
{
out.print(e);
}
}
else
{
out.print("enter all fields");
}
%>
    </body>
</html>

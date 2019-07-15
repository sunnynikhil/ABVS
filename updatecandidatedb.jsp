<%-- 
    Document   : updatecandidatedb
    Created on : Jun 8, 2019, 7:58:04 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
       String name=request.getParameter("name");
       String key=request.getParameter("oldpassword");
       String password=request.getParameter("newpassword");
       String connectionURL = "jdbc:mysql://localhost:3306/voting";
       Connection connection = null;
Statement statement = null;
ResultSet resultset=null;
int updateQuery = 0;
if(name!="" && key!="")
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "SELECT username,password FROM registers WHERE username='"+name+"'  AND password='"+key+"';" ;
statement = connection.createStatement();
resultset=statement.executeQuery(queryString);
int rowcount=0;
if(resultset.next())
{   
    rowcount=rowcount+1;


}
if(rowcount==1)
{
    String sql="UPDATE registers SET password='"+password+"' WHERE username='"+name+"'";
    statement=connection.createStatement();
    int result = statement.executeUpdate(sql);
    if(result>0)
       response.sendRedirect("candidatehome.html");
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
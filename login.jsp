<%-- 
    Document   : login
    Created on : Jun 8, 2019, 1:27:28 PM
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
            String password=request.getParameter("password");
            session.setAttribute("username", name);
            session.setAttribute("password", password);
         String connectionURL = "jdbc:mysql://localhost:3306/voting";
       Connection connection = null;
Statement statement = null;
ResultSet resultset=null;
int updateQuery = 0;
if(name!="" && password!="")
{
try
{
   Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "SELECT name,password FROM admin WHERE name='"+name+"'  AND password='"+password+"';" ;
statement = connection.createStatement();
resultset=statement.executeQuery(queryString);
int rowcount=0;
if(resultset.next())
{   
    rowcount=rowcount+1;


}
if(rowcount==1)
{
    response.sendRedirect("home.html");
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

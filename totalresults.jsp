<%-- 
    Document   : totalresults
    Created on : Jun 9, 2019, 6:53:55 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <body bgcolor="#ffffb3">
       <h3><a href="home.html" style="text-decoration: none; color: green" >Home</a></h3>
<h1  style="color:#660033;" align="center">E-voting system</h1>
<hr>
<h2 style="color:Red" align="center">Results</h2>
<table align="center" width="500" style="margin: 20px;border-left: 10px">
    <tr bgcolor="#66b3ff"><th>Partyname</th><th> Votes</th></tr>
<%
   
    String connectionURL = "jdbc:mysql://localhost:3306/voting";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultset=null;
    ResultSet result=null;
    PreparedStatement pstatement = null;
    String votes=null;
    String party=null;
    String candidate=null;
    int updateQuery = 0;
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL,"root","");
            String sql1="SELECT partyname,sum(votes) as votesgot FROM votes group by partyname";
          
            statement = connection.createStatement();
            resultset=statement.executeQuery(sql1);
            while(resultset.next())
                
            {
%>
<tr bgcolor="#66b3ff"> 
    <td><%=resultset.getString("partyname")%></td>
    <td><%=resultset.getString("votesgot")%></td></tr>
    
               
<%
             
            }
       
        }
        catch(Exception e)
        {
            out.print(e);
        }
   
    
    %>
    </body>
</html>

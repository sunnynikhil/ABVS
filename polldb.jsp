<%-- 
    Document   : polldb
    Created on : Jun 9, 2019, 3:12:16 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.io.*,java.sql.*,java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String candidate=request.getParameter("name");
            String district=request.getParameter("district");
            String connectionURL = "jdbc:mysql://localhost:3306/voting";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultset=null;
            int updateQuery = 0;
            int votes=0;
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL,"root","");  
            String sql="SELECT votes FROM votes WHERE candidatename='"+candidate+"' AND district='"+district+"'";
            statement = connection.createStatement();
            resultset=statement.executeQuery(sql);
            
            while(resultset.next()){
             votes=resultset.getInt("votes");
            }
            votes=votes+1; 
            String qreuy;
            qreuy="UPDATE votes SET votes='"+votes+"' WHERE candidatename='"+candidate+"' AND district='"+district+"'";
            statement = connection.createStatement();
            updateQuery=statement.executeUpdate(qreuy);
            response.sendRedirect("thankyou.html");
            }
            catch(Exception e)
            {
                
            }
        %>
    </body>
</html>

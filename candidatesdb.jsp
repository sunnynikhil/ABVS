<%-- 
    Document   : candidatesdb
    Created on : Jun 8, 2019, 6:05:38 PM
    Author     : SunNikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#ffffb3">
        <%
            String connectionURL = "jdbc:mysql://localhost:3306/voting";
Connection connection = null;
PreparedStatement pstatement = null;
int updateQuery = 0;
Statement statement = null;
ResultSet resultSet = null;
%>
<h3><a href="userhome.html" style="text-decoration: none;color:green">Home</a></h3>
<h2 align="center"><font color="#660033"><strong>Candidates List</strong></font></h2>
<table align="center" cellpadding="1" cellspacing="1" width="600">
<tr>

</tr>
<tr bgcolor="#66b3ff">
<th>Name</th>
<th>Party</th>
<th>District</th>
</tr>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
statement = connection.createStatement();
String sql = "SELECT * FROM candidates";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
<tr bgcolor="#66b3ff">

<td><%=resultSet.getString("candidatename")%></td>
<td><%=resultSet.getString("partyname")%></td>
<td><%=resultSet.getString("district")%></td>


</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
            %>
    </body>
</html>

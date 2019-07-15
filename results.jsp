<%-- 
    Document   : results
    Created on : Jun 9, 2019, 5:34:30 PM
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
<h3 style="color:black">Here are the results your viewing district wise and you can totall election by clicking here <a href="totalresults.jsp">Results <a> also</h3>
<form  align="center" style="margin-left: 470px;" action="results.jsp">District:<select name="district">
                <option value="">select</option>
                <option value="Adilabad">Adilabad</option>
                <option value="Kothagudem">Kothagudem</option>
                <option value="Hyderabad">Hyderabad</option>
                <option vakue="Jagtial">Jagtial</option>
                <option vakue="Jangaon">Jangaon</option>
                <option value="Jayashankar Bhoopalpally">Jayashankar Bhoopalpally</option>
                <option value="Jogulamba-Gadwal">Jogulamba-Gadwal</option>
                <option value="Kamareddy">Kamareddy</option>
                <option value="Karimnagar">Karimnagar</option>
                <option value="Khammam">Khammam</option>
                <option value="Komaram Bheem Asifabad">Komaram Bheem Asifabad</option>
                <option value="Mahabubabad">Mahabubabad</option>
                <option value="Mahabubnagar">Mahabubnagar</option>
                <option value="Mancherial">Mancherial</option>
                <option value="Medchal">Medchal</option>
                <option value="Medak">Medak</option>
                <option value="Nagarkurnool">Nagarkurnool</option>
                <option value="Nalgonda">Nalgonda</option>
                <option value="Nirmal">Nirmal</option>
                <option value="Nizamabad">Nizamabad</option>
                <option value="Peddapalle">Peddapalle</option>
                <option value="Rajanna Sircilla">Rajanna Sircilla</option>
                <option value="Ranga Reddy">Ranga Reddy</option>
                <option value="Sangareddy">Sangareddy</option>
                <option value="Siddipet">Siddipet</option>
                <option value="Suryapet">Suryapet</option>
                <option value="Vikarabad">Vikarabad</option>
                <option value="Wanaparthy">Wanaparthy</option>
                <option value="Warangal">Warangal</option>
                <option value="Yadadri-Bhuvanagiri">Yadadri-Bhuvanagiri</option>
    </select>
    <input type="submit" name="submit" value="check"> 
</form>
<table align="center" width="500" style="margin: 20px;border-left: 10px">
    <tr bgcolor="#66b3ff"><th>Candidate</th><th>Partyname</th><th> Votes</th></tr>
<%
    String district =request.getParameter("district");
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
    if(district!="")
    {
        try
        {
          Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL,"root","");
            String sql1="SELECT candidatename,partyname,sum(votes) as votesgot FROM votes WHERE district='"+district+"' group by partyname";
          
            statement = connection.createStatement();
            resultset=statement.executeQuery(sql1);
            while(resultset.next())
                
            {
%>
<tr bgcolor="#66b3ff"><td><%=resultset.getString("candidatename")%></td> 
    <td><%=resultset.getString("partyname")%></td>
    <td><%=resultset.getString("votesgot")%></td></tr>
    
               
<%
             
            }
       
        }
        catch(Exception e)
        {
            out.print(e);
        }
    }
    else
    {
        out.print("select district");
    }
    
    %>
    </body>
</html>

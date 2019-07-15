<%-- 
    Document   : poll
    Created on : Jun 9, 2019, 11:33:35 AM
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
       <h3><a href="userhome.html" style="text-decoration: none; color: green" >Home</a></h3>
<h1  style="color:#660033;" align="center">E-voting System</h1>
<hr>   
<h3 align="center"> select your district and enter your Adhaar number and password for last verification</h3>
<form align="center" style="margin-left: 320px;" action="poll.jsp">District:<select name="district">
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
    Adhaar number:<input type="number" name="adhaar">
    Password:<input type="password" name="password">
    <input type="submit" name="submit" value="submit"> 
</form>
<br>
<table align="center" width="500" style="margin: 20px;border-left: 10px">
                       <form algin="center" action="polldb.jsp" method="get">
    <%
    String district=request.getParameter("district");
    String adhaar=request.getParameter("adhaar");
    String key=request.getParameter("password");
    
    String connectionURL = "jdbc:mysql://localhost:3306/voting";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultset=null;
    ResultSet result=null;
    PreparedStatement pstatement = null;
    int updateQuery = 0;
    if(district!="" && adhaar!="" && key!="" )
    {
        try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL,"root","");
            
            String sql1="SELECT adhaar FROM done WHERE adhaar='"+adhaar+"'";
            
            statement = connection.createStatement();
            resultset=statement.executeQuery(sql1);
            
            if(resultset.next()!=false)
            {
                out.print("you cannot vote twice in a single term");
            }
            else
            {
            
            updateQuery=statement.executeUpdate("insert into done(adhaar,password)values('"+adhaar+"','"+key+"')");
            //pstatement = connection.prepareStatement(sql2);          
            //out.print("dfghj");
            //updateQuery=pstatement.executeUpdate();
            //out.print("dfghj");
            //if(updateQuery!=0)
            //{
             //   out.print("sucees");
            //}
            String sql="SELECT district FROM users WHERE adhaarnumber='"+adhaar+"' AND password='"+key+"'";
            statement = connection.createStatement();
            resultset=statement.executeQuery(sql);
            int rowcount=0;
            if(resultset.next())
            {
              rowcount=rowcount+1;
            }
            if(rowcount==0)
            {
                out.print("enter correct password and adhaar number");
            }
            else
            {     
           String dbdistrict=resultset.getString("district");
           if(dbdistrict==district)
           {
               out.print("you can not vote other than district that you registered");
               
           }
           
           
           
           else
           {   
               String query1=" SELECT * FROM candidates WHERE district='"+district+"'";
               statement = connection.createStatement();
               resultset=statement.executeQuery(query1);
              while(resultset.next()){
              
               %>         
                      <tr bgcolor="#66b3ff">
                      <td><b>Candidate:</b></td><td><%=resultset.getString("candidatename")%></td>
                      <td><b>Partyname:</b></td><td><%=resultset.getString("partyname")%></td>
                      <td> <input type="radio" name="name" value="<%=resultset.getString("Candidatename")%>"></td>
                      <td><input type="hidden" name="district" value="<%=resultset.getString("district")%>"></td>
                      </tr>
               <%
              }
              %>
              <tr><td><br></td><td></td><td><input type="submit" value="Vote"></td>
                          </form>
                           </table>
<%
           }
            }
        }
        }
        catch(Exception e)
        {
          
           
        }
    }
    else
    {
        out.print("enter all fields");
    }
%>
    </body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%> 	
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browsing Auction</title>
    <link rel="stylesheet" href="style.css?v=1.0"/>
</head>
<body> 	
 	      <div id="searchWrapper">
 	      <form action="" method="get">
 	      <input type ="text"  name="searchBar" id="searchBar" placeholder="search here..."/>
 	      <input type="submit" value="Search">
 	      </form>
          </div>
          <p></p>


    	<table style ="width:700px" style = "text-align:center">
    	<thead>
    	<tr >
							<th>userID</th>
							<th>title </th>
							<th>question</th>
							<th>reply</th>
					
				   
						</tr>
						</thead>
						<tbody>
						<%
						String url = "jdbc:mysql://localhost:3306/buyme";
						Connection conn = null;
						Statement s = null;
						ResultSet rs = null;
						ResultSet rs2=null;

			    			Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(url, "root", "adamwang0224");
							Locale locale = new Locale("en", "US");
							String query = request.getParameter("searchBar");
							s = conn.createStatement();
							String data="";
							String data2="";
							if(query !=null){
								data = "select * from questions where userID like '%"+query+"%' or title like'%"+query+"%' or questions like '%"+query+"%' or reply like '%"+query+"%'";
							}else{
								data = "select * from questions order by questionID";

							}
							
							rs = s.executeQuery(data);
							%>
							<% 
							while(rs.next()) {
								
									%>
								<tr align="center">
							<td><%= rs.getString("userID") %></td>
							<td> <%= rs.getString("title") %></td>
							<td> <%= rs.getString("questions") %></td>
							<td> <%= rs.getString("reply") %></td>
						</tr>	
								
								<% 
								
							}
							%>
							
    </tbody>
    </table>
</body>
</html>
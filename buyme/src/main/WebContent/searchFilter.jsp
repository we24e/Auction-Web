
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
 	<% if (session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       }%>
    	<%@ include file="navigate2.jsp" %>

    	<table style ="width:700px" style = "text-align:center">
    	<thead>
    	<tr >
							<th>Product ID</th>
							<th>Product Name]</th>
							<th>Seller</th>
							<th>Brand</th>
							<th>size</th>
							<th>color</th>
							<th>Highest Bid</th>
							<th>status(open/close)</th>
				   
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
							NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
							String query = request.getParameter("searchBar");
							s = conn.createStatement();
							String data="";
							String data2="";
							if(query !=null){
								 data = "select * from wintercloth where pid like '%"+query+"%' or des like'%"+query+"%' or brand like '%"+query+"%' or color like '%"+query+"%' or clothtype like'%"+query+"%'";
							}else{
								 data = "select * from wintercloth order by pid";
							}
							
							rs = s.executeQuery(data);

							%>
							<% 
							while(rs.next()) {
							String stat="open";
									%>
								<tr align="center">
							<td><%= rs.getString("pid") %></td>
							<td> <%= rs.getString("des") %></td>
							<td> <%= rs.getString("userID") %></td>
							<td> <%= rs.getString("brand") %></td>
							<td><%= rs.getString("size") %></td>
							<td> <%= rs.getString("color") %></td>
							<td><%= currency.format(rs.getFloat("price")) %></td>
							<%if(rs.getFloat("price")==0){
								stat="close";
							}
							%>
							<td> <%= stat %></td>
						
						</tr>	
								
								<% 
								
							}
							%>
							
    </tbody>
    </table>
</body>
</html>
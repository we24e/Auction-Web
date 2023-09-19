
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
 	      <div id="filer">
 	    	<form action="" method="get">
    		<label for="clothtype">clothtype</label> 
    		<select name="clothtype" id="clothtype">
    		<option value="" disabled selected hidden="true">Select </option>
    		<option value="sweater">sweater</option>
    		<option value="jacket">jacket</option>
		    <option value="hat">hat</option>
    		</select><br>
    		<br>
    		
    		<label for="size">size</label> 
    		<select name="size" id="size">
    		<option value="" disabled selected hidden="true">Select </option>
    		<option value="small">small</option>
    		<option value="med">med</option>
		    <option value="large">large</option>
		    <option value="one">one</option>
    		</select><br>
    		<br>
    		
    		<br>
    		
    		<input type="submit" value="search"/>
    		</form>
    		<br>
          </div>
          <p></p>
          
          
 	<% if (session.getAttribute("user") == null) { 
    		response.sendRedirect("login.jsp");
       }%>
    	<%@ include file="navigate.jsp" %>

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

			    			Class.forName("com.mysql.jdbc.Driver");
							conn = DriverManager.getConnection(url, "root", "adamwang0224");
							Locale locale = new Locale("en", "US");
							NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
							String query = request.getParameter("clothtype");
							String query2 = request.getParameter("size");
							String query3 = request.getParameter("color");
							s = conn.createStatement();
							String data="";
							if(query !=null || query2!=null){
								 data = "select * from wintercloth where clothtype like '%"+query+"%'or size like'%"+query2+"%'or color like'%"+query3+"%'";
							}else{
								 data = "select * from  wintercloth order by pid";
							}
							
							rs = s.executeQuery(data);

							%>
							<% 
							while(rs.next()) {
							String stat="open";
									%>
							<tr align="center">
							<td><%= rs.getString("pid")%></td>
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
							<% 
							}
							%>
				
							
							
    </tbody>
    </table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,java.sql.*,java.text.*"
 	import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<h2>Best Selling Items:</h2>
		    			<table border="1">
		    			<tr>
		<td><b>Product Name/Description</b></td>
		<td><b>Numbers sold</b></td>
		<td><b>Earning</b></td>
		    				</tr>

<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();

// PreparedStatement pt=con.prepareStatement("select pid from auction where sold='"+1+"' group by pid");
// PreparedStatement pt3=con.prepareStatement("select pid, sum(cbval) from auction where sold='"+1+"' group by pid order by sum(cbval)");
// rs = pt.executeQuery();
// while (rs.next()){
// 	int pid=rs.getInt(1);
	ResultSet rs2;
	PreparedStatement pt2=con.prepareStatement("select des, count(des), sum(price) from wintercloth group by des order by count(des) DESC");
	rs2 = pt2.executeQuery();

	%>

		    				
		    			 <%	while(rs2.next()){		
		    				 if(rs2.getInt(3)==0){%>
		    				 	<tr>
		    					<td><%= rs2.getString(1) %></td>
		    					<td>0</td>
		    					<td><%= rs2.getFloat(3) %></td>
		    				</tr>
		    			<% }
		    				 else{%>
		
		<tr>
		    					<td><%= rs2.getString(1) %></td>
		    					<td><%= rs2.getInt(2) %></td>
		    					<td><%= rs2.getFloat(3) %></td>
		    				</tr>
		
		
	<%
	}}



%>
</table>
</body>
</html>
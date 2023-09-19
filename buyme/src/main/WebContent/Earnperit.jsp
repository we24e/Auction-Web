<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><h2>Earning Per ClothType</h2>

		    			<table border="1">
		    			<tr>
						<td><b>Product Type</b></td>
						<td><b>Earnings</b></td>
		    			</tr>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select clothtype, sum(price) from wintercloth group by clothtype;");
rs = pt.executeQuery();
while (rs.next()){

	%>
	
						<tr>
						<td><b><%= rs.getString(1) %></b></td>
						<td><b><%= rs.getFloat(2) %></b></td>
		    			</tr>
	
	
	<%
}
%>
</table>
</body>
</html>
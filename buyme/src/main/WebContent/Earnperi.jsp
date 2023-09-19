<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Sales Per Item (Based On Product Name)</h2>

		    			<table border="1">
		    			<tr>
						<td><b>Product Name</b></td>
						<td><b>Earnings</b></td>
		    			</tr>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select des, sum(price) from wintercloth group by des order by sum(price) Desc;");
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
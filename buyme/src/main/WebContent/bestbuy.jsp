<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
	import="java.io.*,java.util.*,java.sql.*,java.text.*"
 	import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head><h2>Best Buyers</h2>
<body>
		    			<table border="1">
		    			<tr>
		<td><b>Buyer ID</b></td>
		<td><b>Clothes Purchased</b></td>
		    				</tr>


<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select cb, count(*) from auction where sold='"+1+"' group by cb order by count(*) DESC;");
rs = pt.executeQuery();
while (rs.next()){
	%>
	
	<tr>
		    					<td><b><%= rs.getString(1) %></b></td>
		    					<td><b><%= rs.getInt(2) %></b></td>
		    				</tr>
	
	
	
	<%
}
	ResultSet rs2;
	PreparedStatement pt2=con.prepareStatement("select Distinct a.userID from account a where a.userID!='admin' AND a.userID not in (select Distinct cb from auction);");
	rs2 = pt2.executeQuery();
	while (rs2.next()){%>
		<tr>
						<td><b><%= rs2.getString(1) %></b></td>
						<td><b>0</b></td>
		    			</tr>
	<%	
	
}

%>
</table>
</body>
</html>
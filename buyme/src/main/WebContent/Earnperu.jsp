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
<body>
<h2>Earning Per User</h2>

		    			<table border="1">
		    			<tr>
						<td><b>Product Name</b></td>
						<td><b>Earnings</b></td>
		    			</tr>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select a.userID, sum(cbval) from auction u, account a where a.userID=u.userID AND u.sold='"+1+"' group by a.userID;");
rs = pt.executeQuery();
while (rs.next()){

	%>
	
						<tr>
						<td><b><%= rs.getString(1) %></b></td>
						<td><b><%= rs.getFloat(2) %></b></td>
		    			</tr>
	
	
	<%
}
	ResultSet rs2;
	PreparedStatement pt2=con.prepareStatement("select a.userID from account a where a.userID!='admin' AND a.userID not in (select userID from auction);");
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
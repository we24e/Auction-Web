<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




<%Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();

String who = request.getParameter("who");  
String admin="admin";%>
<h2>Auctions Relating to User <%=who%></h2>

<table border="1">
<tr>
<td><b>Auction ID</b></td>
<td><b>Seller/Buyer</b></td>
</tr>



<%if(who==null){
	out.print("No User Typed");
}
else if (who==admin){
	out.print("Not Vaild");
}
else{
	ResultSet rs;
	PreparedStatement pt=con.prepareStatement("select auctionID from auction where userID='" +who+ "'");
	rs = pt.executeQuery();
	while(rs.next()){%>
	
	
	<tr>
						<td><b><%=rs.getString(1)%></b></td>
						<td><b>Seller</b></td>
		    			</tr>
	
	
	
	
		<%
		
	}
	ResultSet rs2;
	PreparedStatement pt2=con.prepareStatement("select Distinct auctionID from bid where userID='" +who+ "'");
	rs2 = pt2.executeQuery();
	while(rs2.next()){%>
	<tr>
	<td><b><%=rs2.getString(1) %></b></td>
	<td><b>Buyer</b></td>
	</tr>
	<%
}}
%>
</table>
</body>
</html>
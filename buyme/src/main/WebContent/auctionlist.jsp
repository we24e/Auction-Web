<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head><form action = userpage.jsp>
<input type = "submit"  value = "UserPage"/> </form>
<form action = checkAuS.jsp>
<input type = "submit"  value = "Your Auction Status and Alerts"/> </form>
<body>

<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
String str = "select * from Auction";
PreparedStatement stmt = con.prepareStatement(str);
ResultSet rs = stmt.executeQuery();


%>
	<form method="post" action="bid.jsp"></form>
	<h1>Auctions</h1>
<form action="part.jsp" method="POST">
See Auctions relating to User:
<input type="text" name="who"/>
<input type="submit" value="submit"/>
</form><br>
	<table border="1">
		<tr>
			<td><b>Action ID</b></td>
			<td><b>Cloth ID</b></td>
			<td><b>Seller</b></td>
			<td><b>Close Time/Date</b></td>
			<td><b>Starting Price</b></td>
			<td><b>Highest Bid Now</b></td>
			<td><b>Bidder</b></td>
			<td><b>Bid</b></td>
			<td><b>Bid History</b></td>
		</tr>
		<%while(rs.next()){
			
		
		 java.util.Date d = new java.util.Date();
		if(d.compareTo(rs.getTimestamp("close_time"))==0 || d.before(rs.getTimestamp("close_time"))  ){
// 		if(t.before(rs.getTime("close_time"))){
		%>
		<tr>
			<td><%=rs.getString("auctionID")%></td>
			<td><%=rs.getString("pid")%></td>
			<td><%=rs.getString("userID")%></td>
			<td><%=rs.getString("close_time")%></td>
			<td><%=rs.getString("initial_price")%></td>
			<td><%=rs.getString("cbval")%></td>
			<td><%=rs.getString("cb")%></td>
			<td><a href="bid.jsp?au=<%=rs.getString("auctionID")%>&ini=<%=rs.getString("initial_price")%>&bidder=<%=rs.getString("userID")%>">Bid</a></td>
			<td><a href="bidhis.jsp?au2=<%=rs.getString("auctionID")%>">Bid History</a></td>

		</tr>
		<%} %>
		<%if(d.after(rs.getTimestamp("close_time"))){%>
<tr>
			<td><%=rs.getString("auctionID")%></td>
			<td><%=rs.getString("pid")%></td>
			<td><%=rs.getString("userID")%></td>
			<td><%=rs.getString("close_time")%></td>
			<td><%=rs.getString("initial_price")%></td>
			<td><%=rs.getString("cbval")%></td>
			<td><%=rs.getString("cb")%></td>
			<td></td>
			<td><a href="bidhis.jsp?au2=<%=rs.getString("auctionID")%>">Bid History</a></td>
		</tr>

		<% }} %>
	</table>
</body>

</html>
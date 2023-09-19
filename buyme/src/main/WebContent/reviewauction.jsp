<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
String str = "select * from Auction";
PreparedStatement stmt = con.prepareStatement(str);
ResultSet rs = stmt.executeQuery();


%>
	<form method="post" action="bid.jsp"></form>
	<h1>Auctions</h1>
	<table border="1">
		<tr>
			<td><b>Action ID</b></td>
			<td><b>Cloth ID</b></td>
			<td><b>Seller</b></td>
			<td><b>Close Time/Date</b></td>
			<td><b>Starting Price</b></td>
			<td><b>Highest Bid Now</b></td>
			<td><b>Bidder</b></td>
		</tr>
		<%while(rs.next()){
			
		
	
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
			<td><a href="deletauction.jsp?id=<%=rs.getString("auctionID")%>">delete</a></td>
		</tr>
		<% } %>
	</table>
</body>

</html>
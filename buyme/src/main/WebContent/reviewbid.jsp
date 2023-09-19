<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
	<%
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		String query = "select * from bid";
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
   <head>
      <title>All Bid</title>
   </head>
   <body>
   	<h5>All Bids</h5><br/>
   	
   
	<table border='1'>
		<tr>
			<td><b>Bid_ID</b></td>
			<td><b>userID</b></td>
			<td><b>auctionID</b></td>
			<td><b>bid</b></td>
			<td><b>upper_limit</b></td>
			<td><b>increment</b></td>
			<td><b>action</b></td>
		</tr>
     		<%while(rs.next()){%>
		<tr>
			<td><%=rs.getString("Bid_ID")%></td>
			<td><%=rs.getString("userID")%></td>
			<td><%=rs.getString("auctionID")%></td>
			<td><%=rs.getString("bid")%></td>
			<td><%=rs.getString("upper_limit")%></td>
			<td><%=rs.getString("increment")%></td>
			<td><a href="removdbid.jsp?id=<%=rs.getString("Bid_ID")%>">Delete </a></td>
			
		
		</tr>	

     
     
     
     
     
     		<%}con.close(); %>


	</table>
    
	
</body>
</html>
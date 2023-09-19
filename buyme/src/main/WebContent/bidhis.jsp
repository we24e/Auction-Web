<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
	<%
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
// 		String query = ;
// 		PreparedStatement stmt = con.prepareStatement(query);
// 		ResultSet rs = stmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
   <head>
      <title>Bidding History</title>
   </head>
   <body>
   	<h5>Bidding History</h5><br/>
   	<%String au2=request.getParameter("au2");
   	int au3 = Integer.parseInt(au2);
   	ResultSet rs;
	PreparedStatement pt=con.prepareStatement("select * from bid where auctionID='" +au3+ "'order by bid desc");
	rs = pt.executeQuery();
   	
   	%>
   
	<table border='1'>
		<tr>
			<td><b>Bid_ID</b></td>
			<td><b>userID</b></td>
			<td><b>auctionID</b></td>
			<td><b>bid</b></td>
		</tr>
     		<%while(rs.next()){%>
		<tr>
			<td><%=rs.getString("Bid_ID")%></td>
			<td><%=rs.getString("userID")%></td>
			<td><%=rs.getString("auctionID")%></td>
			<td><%=rs.getString("bid")%></td>
		
		</tr>	

     
     		<%} %>


	</table>
    
	
</body>
</html>
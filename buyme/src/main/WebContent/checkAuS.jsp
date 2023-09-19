<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head><form action = alert.jsp>
<input type = "submit"  value = "Alerts"/> </form>
<body>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();


PreparedStatement psd=con.prepareStatement("select auctionID from bid where userID='" + session.getAttribute("user") + "'");
ResultSet rs;
rs = psd.executeQuery();



java.util.Date d = new java.util.Date();
String curbid=(String)session.getAttribute("user"); 
%>My Auctions<br>
<table border="1">
		<tr>
		<td><b>Action ID</b></td>
		<td><b>Cloth ID</b></td>
		<td><b>Close Time/Date</b></td>
		<td><b>Highest Bid</b></td>
		<td><b>Auction Status</b></td>
		<td><b>My Bid</b></td>
		</tr>
<%
while(rs.next()){
	
	int auction=rs.getInt(1);
	ResultSet ch;
	PreparedStatement psd2=con.prepareStatement("select * from auction where auctionID='" +auction+ "'");
	ch = psd2.executeQuery();
	while(ch.next()){
		%>

		
		<%
		if(d.before(ch.getTimestamp("close_time")) || d.equals(ch.getTimestamp("close_time"))){
		%>
			<tr>
			<td><%=ch.getString("auctionID")%></td>
			<td><%=ch.getString("pid")%></td>
			<td><%=ch.getString("close_time")%></td>
			<td><%=ch.getString("cbval")%></td>
			<td>Auction is still in progress.</td>
			<td>No results yet.</td>
		</tr>			
		<%
		}
		
		%>
		
		<%
		if(d.after(ch.getTimestamp("close_time"))){
			if((ch.getString("cb")).equals(curbid)){
			ResultSet min;
			min=st.executeQuery("select min_price from auction where auctionID='" +auction+ "'");
			if(min.next()){
				if(ch.getInt("cbval")<min.getInt(1)){
			
		%>
		
		<tr>
			<td><%=ch.getString("auctionID")%></td>
			<td><%=ch.getString("pid")%></td>
			<td><%=ch.getString("close_time")%></td>
			<td><%=ch.getString("cbval")%></td>
			<td>Auction is closed.</td>
			<td>Sorry, you didn't reach the minimal price that the seller set.</td>
		</tr>			
		<%
				}
				if(ch.getInt("cbval")>=min.getInt(1)){
					PreparedStatement alert=con.prepareStatement("insert into alert values(NULL, '" +curbid+ "','" + ch.getString("auctionID") + "',  '" +2+"')"); 
					alert.executeUpdate();
					PreparedStatement sold=con.prepareStatement("update auction set sold='"+1+"' where auctionID='" +auction+ "'");
					sold.executeUpdate();
					PreparedStatement ps=con.prepareStatement("update wintercloth set price='"+ch.getFloat("cbval")+"' where pid='" +ch.getInt("pid")+ "'"); 
					ps.executeUpdate();
		%>
			<tr>
			<td><%=ch.getString("auctionID")%></td>
			<td><%=ch.getString("pid")%></td>
			<td><%=ch.getString("close_time")%></td>
			<td><%=ch.getString("cbval")%></td>
			<td>Auction is closed.</td>
			<td>You have won the auction, please pay <a href= 'aw.jsp'>here</a> </td>
		</tr>	
		
		
		<%}%>
		
		
		
		
		<%
			}}
			
		
			 if(!(ch.getString("cb")).equals(curbid)){
		%>
		<tr>
			<td><%=ch.getString("auctionID")%></td>
			<td><%=ch.getString("pid")%></td>
			<td><%=ch.getString("close_time")%></td>
			<td><%=ch.getString("cbval")%></td>
			<td>Auction is closed.</td>
			<td>Sorry, you didn't win this auction.</td>
		</tr>	
		
	<%				}
			
			
			
			}}}%>
		</table>
</body>
</html>
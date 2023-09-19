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
<body>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
String str = "select * from alert where userID='" + session.getAttribute("user") + "'";
PreparedStatement stmt = con.prepareStatement(str);
ResultSet rs = stmt.executeQuery();


%>

<table border="1">
			<tr>
			<td><b>Action ID</b></td>
			<td><b>Alert Message</b></td>
			</tr>
			<%while(rs.next()){
			if(rs.getInt("message")==1){%>
			<tr>
			<td><%=rs.getString("auctionID")%></td>
			<td>Someone placed a higher bid than yours.</td>
			</tr>
			<%} 
			else if(rs.getInt("message")==2){
			%>
			<tr>
			<td><%=rs.getString("auctionID")%></td>
			<td>You have won this auction, please pay <a href= 'aw.jsp'>here</a></td>
			</tr>
			<%}}%>
			<%
			String str2 = "select * from itemalert where userID='" + session.getAttribute("user") + "'";
			PreparedStatement stmt2 = con.prepareStatement(str2);
			ResultSet rs2 = stmt2.executeQuery();
			while (rs2.next()){
				String strw = "select * from auction where pid='" + rs2.getInt("pid") + "'";
				PreparedStatement stmtw = con.prepareStatement(strw);
				ResultSet rsw = stmtw.executeQuery();
				 java.util.Date d = new java.util.Date();
				 if(rsw.next()){
					if(d.before(rsw.getTimestamp("close_time"))){%>
				
			<tr>
			<td><%=rsw.getString("auctionID")%></td>
			<td>Your alert for item "<%=rsw.getString("pid")%>" is available now in this Auction.</td>
			</tr>

			
			
			
	<%	}}}	
			%>
				</table>
</body>
</html>
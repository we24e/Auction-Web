<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid</title>
</head>
<body>

<form action="bidha.jsp" method="POST">
		<%String au=request.getParameter("au");
		session.setAttribute("au",au);
		if(au == null){
			response.sendRedirect("auctionlist.jsp");
		}
		String ini=request.getParameter("ini");
		session.setAttribute("ini",ini);
		String bidder=request.getParameter("bidder");
		session.setAttribute("bidder",bidder);
// 		String ini=request.getParameter("ini");
// 		session.setAttribute("ini",ini);
// String auctionId = request.getParameter("auctionID");
// String pid = request.getParameter("pid");
// String initial_price = request.getParameter("initial_price");
		%>
<br>
<%-- <input type = "hidden" name="auctionId"  value =<%= auctionId %> />  --%>
<%-- <input type = "hidden" name="pid"  value =<%= pid %> />  --%>
<%-- <input type = "hidden" name="initial_price"  value =<%= initial_price %> />  --%>


<br>
<label>Bid Amount</label><br>
<input type="number" name="bid"/> <br><br>

<label>Upper Limit</label><br>
<input type="number" name="upper_limit"/> <br><br>

<label>Increment</label><br>
Please ignore if you don't want to set up an auto-bidding. <br>
Please type a number between 1-5 if you wish to use auto-bidding.<br>
<input type="number" name="increment" value = "0" max="5"/> <br><br>

<input type="submit" value="submit">

	<br>
</form>
</body>
</html>
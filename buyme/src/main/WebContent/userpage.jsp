<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
</head>
<form action = checkAuS.jsp>
<input type = "submit"  value = "Your Auction Status and Alerts"/> </form>
<form action = pqeustable.jsp>
<input type = "submit"  value = "Post Question"/> </form>
<form action = brokeysear.jsp>
<input type = "submit"  value = "Browse and Search Questions"/> </form>
<form action = createalert.jsp>
<input type = "submit"  value = "Set Up An Alert for An Item"/> </form>
<form action = sim.jsp>
<input type = "submit"  value = "View Similar Items From Past Month"/> </form>
<form action = searchFilter.jsp>
<input type = "submit"  value = "Search Items"/> </form>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
please login here<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("user")%> !<br>
Start An Auction <a href= 'regau.jsp'>here</a> <br><br>
See auctions and<a href='auctionlist.jsp'>bid here</a><br><br>
<a href='logout.jsp'>Log out here</a>

<%
    }
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Customer Representative</title>
</head>

<form action = reviewauction.jsp>
<input type = "submit"  value = "Delete Auctions"/> </form><br>
<form action = reviewbid.jsp>
<input type = "submit"  value = "Delete Bids"/> </form><br>
<form action = repques.jsp>
<input type = "submit"  value = "Reply Questions"/> </form><br>
<form action = Cusrepdeletacc.jsp>
<input type = "submit"  value = "Edit Users"/> </form><br>
<form action = brokeysear.jsp>
<input type = "submit"  value = "Browse and Search Questions"/> </form><br>

<body><%
    if ((session.getAttribute("user") == null)) {
%>
please login here<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
 Welcome, Our best Customer Representative!<br>
<a href='logout.jsp'>Log out here</a>
<%
    }
%>


</body>
</html>
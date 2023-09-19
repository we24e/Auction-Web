<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head><form action = cusrep.jsp>
<input type = "submit"  value = "Register a Customer Representative"/> </form>
<form action = Salesreport.jsp>
<input type = "submit"  value = "Generate Sales Reports"/> </form>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
please login here<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome to <%=session.getAttribute("user")%> Page<br>
<a href='logout.jsp'>Log out here</a>
<%
    }
%>
</body>
</html>
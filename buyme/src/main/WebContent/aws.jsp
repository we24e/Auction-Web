<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>Thanks for your order.<br>
You'll be redirected to your userpage in 5 seconds.<br>
Go to  <a href= 'userpage.jsp'>Userpage</a> now <br> 
<% response.setHeader("Refresh", "5;url=userpage.jsp"); %>
<a href='logout.jsp'>Log out here</a>

</body>
</html>
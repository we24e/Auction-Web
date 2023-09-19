<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="crahand.jsp" method="POST">
Create An Alert For A Specific Item<br><br>
We'll notify you as soon as it's available.<br><br>
<label>Product ID</label><br>
<input type="text" name="pid"/>
<input type="submit" value="submit"/>
</form>
</body>
</html>
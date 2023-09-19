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
<body><%Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();

String pid = request.getParameter("pid");  


if(pid==null){
	out.print("please type something");
}
else{
	PreparedStatement ale=con.prepareStatement("insert into itemalert values(NULL, '"+session.getAttribute("user")+"','" +pid+"' )"); 
	ale.executeUpdate();
	response.sendRedirect("userpage.jsp");
}
%>
</body>
</html>
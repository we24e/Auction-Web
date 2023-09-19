<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 	  String userID = request.getParameter("userID");  
	  String password = request.getParameter("Password");
	  String name = request.getParameter("name"); 
      PreparedStatement preStmt = con.prepareStatement("select * from Representative where userID = '" + userID + "'");
      ResultSet rs=preStmt.executeQuery();
      if(rs.next()){
    	  out.println("This userID is already taken, please use another one <a href='cusrep.jsp'></a>");
      }else{
      PreparedStatement ps = con.prepareStatement("Insert into Representative values('" + userID + "','" +password+ "','" + name + "')");
      ps.executeUpdate();
      response.sendRedirect("adminpage.jsp");
      }
	  %>
</body>
</html>
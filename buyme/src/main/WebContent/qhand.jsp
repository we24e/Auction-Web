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
<body>
   <%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
	  	 
	  String questions = request.getParameter("questions");
	  String title = request.getParameter("title");
	  String noreply = "no reply";
	  if(session.getAttribute("user")!= null){
	  if(questions != null){
		  PreparedStatement ps = con.prepareStatement("Insert into questions(userID, questionID, questions, title, reply) values('" + session.getAttribute("user") + "',Null,'" +questions + "','" +title+ "', '" +noreply+ "')");
		  ps.executeUpdate();
	      response.sendRedirect("userpage.jsp");
	     
	  }
	  else if (questions==null){
		  out.print("please enter a valid question.");
	  }

	  }
	  else {
		  out.print("Please Login in to continue");
	  }
	  
      
	  %>
</body>
</html>
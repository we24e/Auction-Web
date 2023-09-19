<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
	Statement st = con.createStatement();
	String reply = request.getParameter("reply");
	if(reply == null){
		out.println("please type in a valid reply");
	}
	else{
		  PreparedStatement ps = con.prepareStatement("update questions set reply='" +reply+ "' where questionID='" +session.getAttribute("qid")+ "'");
		  ps.executeUpdate();
	response.sendRedirect("repques.jsp");
	}
%>

</body>
</html>
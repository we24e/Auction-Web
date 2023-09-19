<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
	String qid = request.getParameter("id");
	session.setAttribute("qid",qid);
	if(qid == null){
		out.println("Do not have questions");
	}
	else{
	
	response.sendRedirect("REtable.jsp");
	}
%>

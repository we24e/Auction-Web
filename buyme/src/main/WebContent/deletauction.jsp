<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	if(id == null){
		out.println("No Such Auction");
	}else{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		String query = "delete from Auction where auctionID = "+id+";";
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.executeUpdate();
		response.sendRedirect("reviewauction.jsp");
		con.close();
		
		}
%>


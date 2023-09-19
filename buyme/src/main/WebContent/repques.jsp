<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
	<%
	
		String admin = request.getParameter("admin");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		String query = "select userID,questionID,questions from questions";
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Questions</title>
</head>
<form action = reppage.jsp>
<input type = "submit"  value = "RepPage"/> </form>
<body>

	<form method="post" >
	<h5>Customer Questions</h5>
	<table border='1'>
		<tr>
			<td>CustomerID</td>
			<td>Question</td>
		</tr>
		<%while(rs.next()){%>
			<tr>
				<td><%=rs.getString("userID")%></td>
				<td><%=rs.getString("questions") %></td>
				<td><a href="Cusrep_reply.jsp?id=<%=rs.getString("questionID")%>">Click here to answer </a> </td>
			</tr>
		<%}con.close(); %>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
	<%
	
		String userID = request.getParameter("userID");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		String query = "select userID,name from Account where userID!='admin'";
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
</head>
<body>
	<form method="post" action=Curespdeletacc.jsp>
	<h5>All Users</h5>
	<table border='1'>
		<tr>
			<td>User name</td>
		</tr>
		<%while(rs.next()){%>
			<tr>
				<td><%=rs.getString("name") %></td>
				<td><a href="edituser.jsp?id=<%=rs.getString("userID")%>">Delete </a> </td>
				<td><a href="edituserinfo.jsp?id=<%=rs.getString("userID")%>">Edit </a> </td>
			</tr>
		<%}con.close(); %>
	</table>
	</form>
</body>
</html>
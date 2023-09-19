<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
	<%
	
		String userID = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		String query = "select * from Account where userId = '"+userID+"'";
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
	%>
<!DOCTYPE html>
<html>
   <head>
      <title>Edit info</title>
   </head>
   <body>
   	<h5>Edit info</h5><br/>
     <form action="edit2.jsp" method="POST">
     		<%while(rs.next()){%>
			
     <input type = "text" name = "userID" value = "<%=rs.getString("userID")%>" hidden = "hidden" />
     password<input type = "text" name = "password" value = "<%=rs.getString("password")%>" /><br>
     name<input type = "text" name = "name" value = "<%=rs.getString("name")%>" /><br>
     email<input type = "text" name = "email" value = "<%=rs.getString("email")%>" /><br>
     dob<input type = "text" name = "dob" value = "<%=rs.getString("dob")%>" /><br>
     address<input type = "text" name = "address" value = "<%=rs.getString("address")%>" /><br>
     		<%}con.close(); %>
     <input type = "submit" value = "Post">


    </form>
	
</body>
</html>
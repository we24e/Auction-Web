<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select sum(cbval) from auction where sold='"+1+"'");
rs = pt.executeQuery();
if (rs.next()){


%>
	
	<b>Total Earning: </b>
	<b><%=rs.getFloat(1)%></b>
	<%
	
}
%>

</body>
</html>
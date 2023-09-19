<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Similar Items</h2>

<table border="1">
<tr>
<td><b>Item 1</b></td>
<td><b>Item 2</b></td>
</tr>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
java.util.Date d = new java.util.Date();
LocalDate now = LocalDate.now(); 
LocalDate earlier = now.minusMonths(1);
// Calendar cal = Calendar.getInstance();
// cal.add(Calendar.MONTH, -1);
// cal.set(Calendar.DATE, 1);
// java.util.Date firstDateOfPreviousMonth = cal.getTime();

// cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE)); // changed calendar to cal

// java.util.Date lastDateOfPreviousMonth = cal.getTime();
Statement st = con.createStatement();
ResultSet rs;
PreparedStatement pt=con.prepareStatement("select pid from auction where close_time between 'earlier' and 'now'");
rs = pt.executeQuery();

while (rs.next()){
	ResultSet rs2;
	PreparedStatement pt2=con.prepareStatement("select * from wintercloth where pid='" + rs.getInt(1) + "'");
	rs2 = pt2.executeQuery();
	while (rs2.next()){
		ResultSet rs3;
		PreparedStatement pt3=con.prepareStatement("select * from wintercloth where pid='" + rs.getInt(1) + "'Order by pid desc");
		rs3 = pt3.executeQuery();
		while(rs3.next()){
			if((rs2.getString(2)).equals(rs3.getString(2)) && !rs2.getString(1).equals(rs3.getString(1))){%>
						<tr>
						<td><b><%=rs2.getString(1)%></b></td>
						<td><b><%=rs3.getString(1)%></b></td>
		    			</tr>
			
				<%
			}
			if((rs2.getString(4)).equals(rs3.getString(4)) && !rs2.getString(1).equals(rs3.getString(1))){%>
			
									<tr>
						<td><b><%=rs2.getString(1)%></b></td>
						<td><b><%=rs3.getString(1)%></b></td>
		    			</tr>
			
			
			<%}
			if((rs2.getString(5)).equals(rs3.getString(5)) && !rs2.getString(1).equals(rs3.getString(1))){%>
			
			<tr>
<td><b><%=rs2.getString(1)%></b></td>
<td><b><%=rs3.getString(1)%></b></td>
</tr>


<%}			if((rs2.getString(6)).equals(rs3.getString(6)) && !rs2.getString(1).equals(rs3.getString(1))){%>

<tr>
<td><b><%=rs2.getString(1)%></b></td>
<td><b><%=rs3.getString(1)%></b></td>
</tr>


<%}			if((rs2.getString(7)).equals(rs3.getString(7)) && !rs2.getString(1).equals(rs3.getString(1))){%>

<tr>
<td><b><%=rs2.getString(1)%></b></td>
<td><b><%=rs3.getString(1)%></b></td>
</tr>


<%}
		}
		
	}
}
%>
</table>
</body>
</html>
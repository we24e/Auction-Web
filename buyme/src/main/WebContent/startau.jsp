<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>start an auction</title>
</head>
<body>
<%

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
Statement st = con.createStatement();
// ResultSet rs;
// rs = st.executeQuery("select userID from account where userID='" + userID + "'");
// String user_ID =session.getAttribute("user") ;
// if(rs.next())  {
//      user_ID =new String(rs.getString(1));
//     System.out.println("userID :"+ user_ID);  
// }

String min_price = request.getParameter("min_price");
String initial_price = request.getParameter("initial_price");
String close_time = request.getParameter("close_time");
// String close_time = request.getParameter("close_time");
String brand = request.getParameter("brand");
String color = request.getParameter("color");
String size = request.getParameter("size");
String clothtype = request.getParameter("clothtype");
String des= request.getParameter("des");
if(!(clothtype).equals("hat") && !(clothtype).equals("sweater") &&!(clothtype).equals("jacket")&&!(clothtype).equals("Hat") && !(clothtype).equals("Sweater") &&!(clothtype).equals("Jacket")){
	out.print("please check your clothtype");
}
else{
PreparedStatement ps1=con.prepareStatement("Insert into wintercloth values(NULL,'" + des + "','" + request.getSession().getAttribute ("user") + "','" + brand + "','" +color+ "','" + size + "','" + clothtype + "', 0)");
ps1.executeUpdate();
ResultSet rs;
rs = st.executeQuery("select max(pid) from wintercloth where userID='" +session.getAttribute ("user")+"'");
if(rs.next()){
PreparedStatement ps = con.prepareStatement("Insert into auction values(NULL,'" + request.getSession().getAttribute ("user") + "','" + min_price + "','" +initial_price+ "','" + close_time + "','" + rs.getInt(1) + "',0,0, false)"); 
ps.executeUpdate();

response.sendRedirect("successcreau.jsp");
}
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
    String userid = request.getParameter("UserID");   
    String password = request.getParameter("Password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from account where userID='" + userid + "'");

    if (rs.next()) {
    	ResultSet rs0 = st.executeQuery("select * from account where userID='" + userid + "' and password='" + password + "'"); 
    	if(rs0.next()){
    		if((userid).equals("admin")){
    			session.setAttribute("user", userid);
    			 response.sendRedirect("adminpage.jsp");
    			} 
    else if(!(((userid).equals("admin")))){
    		session.setAttribute("user", userid); 
            out.println("welcome " + userid);
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("userpage.jsp");  }      
    } else {
    	out.println("Invalid password <a href='login.jsp'>please try again</a>");
    	
    }} 
    else {
    	out.println("UserID doesn't exist <a href= 'register.jsp'>SignUp here</a>");
    }
%>
</body>
</html>
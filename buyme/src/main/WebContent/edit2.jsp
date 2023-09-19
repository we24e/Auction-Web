<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    
<%
		String id = request.getParameter("userID");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		Class.forName("com.mysql.jdbc.Driver");
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		if (id==null&&password ==null&&name==null&&email==null&&dob==null&&address==null){
			out.println("Cannot be empty");
			
		}
		else{
			try{
				  PreparedStatement ps = c.prepareStatement("update Account set password='"+password+"',name='"+name+"',email='"+email+"',dob='"+dob+"',address='"+address+"' where userID = '"+id+"'");
				  ps.executeUpdate();
					response.sendRedirect("Cusrepdeletacc.jsp");
			}catch(Exception e) {
				e.printStackTrace();
				out.println("xxx");
			}finally{
				c.close();
			}

		}
	%>
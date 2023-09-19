<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    
	<%
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buyme","root", "adamwang0224");
		if (id==null){
			out.println("Do not have user");
			
		}
		else{
			try{
				  PreparedStatement ps = con.prepareStatement("delete from bid where Bid_ID = '"+id+"'");
				  ps.executeUpdate();
					response.sendRedirect("reviewbid.jsp");
			}catch(Exception e) {
				e.printStackTrace();
				out.println("xxx");
			}finally{
				con.close();
			}

		}
	%>
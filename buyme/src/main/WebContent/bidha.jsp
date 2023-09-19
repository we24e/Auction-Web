<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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
String bid = request.getParameter("bid");
String upper_limit = request.getParameter("upper_limit");
String increment = request.getParameter("increment");
String au=request.getParameter("au");
String initial_price=request.getParameter("initial_price");
// int inc = Integer.parseInt(request.getParameter("increment"));

// ResultSet rs2;
// rs2 = st.excuteQuery("select userID from bid where auctionID='" + au + "'"); 
// while (rs2.next()){
// 	if(rs2.getString(1)=session.getAttribute("user")){
// 		out.print("You already placed a bid for this auction!");
// 	}
// }

int bida = Integer.parseInt(bid);
int inii = Integer.parseInt((String)session.getAttribute("ini"));
String curbid=(String)session.getAttribute("user"); 
// int curb=Integer.parseInt(curbid);
int inc = Integer.parseInt(increment);
String cursell=(String)session.getAttribute("bidder"); 
// int curs=Integer.parseInt(cursell);
int auc = Integer.parseInt((String)session.getAttribute("au"));


// ResultSet rs;
// rs = st.executeQuery("select initial_price from auction where auctionID='" + au + "'");
// int ini=request.getParameter("ini");
// if(rs.getInt(1)<=ini){
// 	out.print("please place a higher bid than "+session.getAttribute("ini")+"");
// }
int up = Integer.parseInt(request.getParameter("upper_limit"));

if(curbid.equals(cursell)){
	out.print("You can't bid on your own auction");
}

else if (bida<inii){
	out.print("please place a higher bid than "+inii+"");
}
else if(bida>up){
	out.print("please type a upper limit greater than your current bid");
}


else{
ResultSet rsc; 
rsc=st.executeQuery("select cbval, cb from auction where auctionID='" +auc + "'");
if(rsc.next()){
	if(rsc.getInt(1)==0){
	PreparedStatement ps1=con.prepareStatement("insert into bid values(NULL, '" + request.getSession().getAttribute ("user") + "','" + session.getAttribute("au") + "','" + bid + "','" + upper_limit + "','" + increment + "')"); 
	ps1.executeUpdate();
	PreparedStatement psc=con.prepareStatement("update auction set cbval= "+ bida + ", cb="+request.getSession().getAttribute ("user")+ " where auctionID='"+auc+ "'"); 
	psc.executeUpdate();
	}
	else if(rsc.getInt(1)!=0){
		if((rsc.getString("cb")).equals(curbid)){
			out.print("you already bidded");

		}
			else {
				ResultSet rsb; 
				rsb=st.executeQuery("select cbval, cb from auction where auctionID='" + auc + "'");
				if(rsb.next()){
					String current="";
				if(rsb.getInt(1)<=bida){
					current=new String(rsb.getString(2));
					ResultSet cbc;
					PreparedStatement pt=con.prepareStatement("select upper_limit, increment from bid where userID='" +current+ "'");
					cbc = pt.executeQuery();

					while(cbc.next()){
// 						if (inc!=0 &&cbc.getInt(1)<up){
// 							PreparedStatement alert=con.prepareStatement("insert into alert values(NULL, '" + current + "','" + session.getAttribute("au") + "',  '" +1+"')"); 
// 							alert.executeUpdate();
							
// 							PreparedStatement psdd=con.prepareStatement("update auction set cbval= "+cbc.getInt(1)+"+"+up+", cb='"+curbid+"' where auctionID='" +auc+ "'"); 
// 							psdd.executeUpdate();
// 						}
					
						 if(cbc.getInt(2)==0){
						PreparedStatement al=con.prepareStatement("insert into alert values(NULL, '" + current + "','" + session.getAttribute("au") + "',  '" +1+"')"); 
						al.executeUpdate();
						
						PreparedStatement psd=con.prepareStatement("update auction set cbval= "+ bida + ", cb='"+curbid+"' where auctionID='" +auc+ "'"); 
						psd.executeUpdate();
					}
					else if(cbc.getInt(2)!=0 && cbc.getInt(1) > bida){
						PreparedStatement auto=con.prepareStatement("update bid set bid= "+bida+"+"+cbc.getInt(2)+" where userID='"+current+ "'"); 
						auto.executeUpdate();
						PreparedStatement auto2=con.prepareStatement("update auction set cbval= "+bida+"+"+cbc.getInt(2)+",cb='"+ current+"' where auctionID='" +auc+ "'"); 
						auto2.executeUpdate();
						PreparedStatement ale=con.prepareStatement("insert into alert values(NULL, '" + curbid + "','" + session.getAttribute("au") + "', '" +1+"')"); 
						ale.executeUpdate();
					}
					else if(cbc.getInt(2)!=0 && cbc.getInt(1) <= bida){
						PreparedStatement psd2=con.prepareStatement("update auction set cbval= "+ bida + ", cb='"+ curbid+"' where auctionID='" +auc+ "'"); 
						psd2.executeUpdate();
						PreparedStatement aler=con.prepareStatement("insert into alert values(NULL, '" + current + "','" + session.getAttribute("au") + "', '" +1+"')"); 
						aler.executeUpdate();

						
					}
					}

					
					
					
					}
				
				}
				
				PreparedStatement ps1=con.prepareStatement("insert into bid values(NULL, '" + request.getSession().getAttribute ("user") + "','" + session.getAttribute("au") + "','" + bid + "','" + upper_limit + "','" + increment + "')"); 
				ps1.executeUpdate();
				response.sendRedirect("auctionlist.jsp");
			}
				

			
		
	}

}
}
// }
%>
</body>
</html>
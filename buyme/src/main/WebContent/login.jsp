<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <title>User Login</title>
   </head>
 <body>
   Buyme Login<br/>
     <form action="LoginDetails.jsp" method="POST">
       UserID: <input type="text" name="UserID"/> <br>
       Password:<input type="password" name="Password"/> <br>

	<input type="submit" value="Login"/><br/>
       New User? <a href= 'register.jsp'>SignUp</a><br>
       Customer Representatives <a href= 'replog.jsp'>Login</a>
     </form>
   </body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Post question</title>
   </head>
   <body>
   	<h5>Post Question</h5><br><br>
     <form action="qhand.jsp" method="POST">
     	Enter Your Title Here:<br>
     <input type="text" name="title" > <br>
       	Enter Your Question Here:<br>
	 <input type="text" name="questions" > <br>

	<input type="submit" value="submit">
     </form>
   </body>

</html>
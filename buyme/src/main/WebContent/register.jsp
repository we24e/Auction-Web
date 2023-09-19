<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
</head>
<body>
<form action="checkRegister.jsp" method="POST">
New User<br><br>
<label>UserID</label><br>
<input type="text" name="userID"/> <br>
<label>Password</label><br>
<input type="password" name="Password"/> <br>
<label>Name</label><br>
<input type="text" name="name"/> <br>
<label>Email</label><br>
<input type="text" name="email"/> <br>
<label>DateOfBirth</label><br>
<input type="date" name="dob" min="1950-01-01" max="2019-12-31"/> <br>
<label>Address</label><br>
<input type="text" name="address"/> <br>
<input type="submit" value="SignUp!"/>
</form>
</body>
</html>
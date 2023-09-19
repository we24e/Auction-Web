<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Please type in the details about this shipment. 
<br>
<form action="aws.jsp">
<label>Name</label><br> 
<input type="text" name="name" /> <br><br>

<label>Address</label><br>
<input type="text" name="add"/> <br><br>

<label>Phone Number</label><br> 
<input type="number" name="phone" /> <br><br>

<label>Card Number</label><br>
<input type="number" name="num"/> <br><br>

<label>Card Exp date</label><br> 
<input type="date" name="date" /> <br><br>

<label>Card CVV</label><br> 
<input type="number" name="cvv" /> <br><br>



<input type="submit" value="submit">


</form>
</body>
</html>
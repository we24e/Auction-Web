<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Auction</title>
</head>
<body>
<form action="startau.jsp" method="POST">
New Auction<br>

<label>Minimum Price</label><br>
<input type="number" name="min_price"/> <br>
<label>Initial Price</label><br>
<input type="number" name="initial_price"/> <br>
<label>Close Date and Time</label><br>
<input type="datetime-local" name="close_time" /> <br>
<!-- <label>Close Time</label> -->
<!-- <input type="time" name="close_time"/> <br> -->
<label>Product Name/Description</label><br>
<input type="text" name="des" /> <br>
<label>Product Brand</label><br>
<input type="text" name="brand" /> <br>
<label>Product Color</label><br>
<input type="text" name="color" /> <br>
<label>Product Size</label><br>
<input type="text" name="size" /> <br>
<label>Product Type</label>
(Please Type: hat, sweater, or jacket)<br>
<input type="text" name="clothtype" /> <br>

<input type="submit" value="Start"/>
</form>
</body>
</html>
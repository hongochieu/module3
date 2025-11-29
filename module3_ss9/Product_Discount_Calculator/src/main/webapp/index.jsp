<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Product Discount Calculator</h2>

<form action="display-discount" method="post">
    <label>Product Description:</label><br>
    <input type="text" name="productDescription"><br><br>

    <label>List Price:</label><br>
    <input type="text" name="listPrice"><br><br>

    <label>Discount Percent (%):</label><br>
    <input type="text" name="discountPercent"><br><br>

    <button type="submit">Calculate Discount</button>
</form>

</body>
</html>

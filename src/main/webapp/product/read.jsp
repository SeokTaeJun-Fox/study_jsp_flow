<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body>
<h1>이름 : ${product.productName}</h1>
<h1>가격 : ${product.productPrice}</h1>
<h1>재고 : ${product.productStock}</h1>
<a href="/flow/update.product?id=${product.id}">수정하기</a>

</body>
</html>
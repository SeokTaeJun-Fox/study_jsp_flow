<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<form method="post" action="/flow/update-ok.product">
		<div>
			<input name="id" value=${product.id} type=hidden />
		</div>
		<div>
			<p>상품명</p>
			<input name="productName" value=${product.productName} />
		</div>
		<div>
			<p>상품 가격</p>
			<input name="productPrice" value=${product.productPrice} />
		</div>
		<div>
			<p>상품 재고</p>
			<input name="productStock" value=${product.productStock} />
		</div>
		<button>수정</button>
	</form>
</body>
</html>
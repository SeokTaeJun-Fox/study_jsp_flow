<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<form method="post" action="/flow/write-ok.product">
		<div>
			<p>상품명</p>
			<input name="productName" placeholder="상품명을 입력하세요."/>
		</div>
		<div>
			<p>상품 가격</p>
			<input name="productPrice" placeholder="상품가격을 입력하세요."/>
		</div>
		<div>
			<p>상품 재고</p>
			<input name="productStock" placeholder="상품재고를 입력하세요."/>
		</div>
		<button>상품등록 처리</button>
	</form>
</body>
</html>
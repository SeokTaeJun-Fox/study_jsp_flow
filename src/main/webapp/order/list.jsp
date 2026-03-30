<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>주문 번호</th>
			<th>주문 상품</th>
			<th>주문 수량</th>
			<th>주문 총액</th>
			<th>주문자</th>
		</tr>
		<c:forEach var="item" items="${orders}">
			<tr>
				<td>
					<c:out value="${item.id}" escapeXml="true"></c:out>
				</td>
				<td>
					<c:out value="${item.productName}" escapeXml="true"></c:out>
				</td>
				<td>
					<c:out value="${item.orderCount}" escapeXml="true"></c:out>
				</td>
				<td>
					<c:out value="${item.totalPrice}" escapeXml="true"></c:out>
				</td>
				<td>
					<c:out value="${item.memberName}" escapeXml="true"></c:out>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr />
   <form id="order-form" method="post" action="order-cancel-ok.order">
      <h2>주문 정보</h2>
      <table id="order-table" border='1'>
         <thead>
            <tr>
               <th>상품명</th>
               <th>상품가격</th>
               <th>상품재고</th>
            </tr>
         </thead>
      </table>
      <button id="order-button" type="button" style="display:none;">주문 취소 하기</button>
</body>
</html>
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
	<table border="1" id="list-table">
		<tr>
			<th>주문 번호</th>
			<th>주문 상품</th>
			<th>주문 수량</th>
			<th>주문 총액</th>
			<th>주문자</th>
		</tr>
		<c:forEach var="item" items="${orders}">
			<tr class="item-info">
				<td class="item-id">
					<c:out value="${item.id}" escapeXml="true"></c:out>
				</td>
				<td class="item-product-name">
					<c:out value="${item.productName}" escapeXml="true"></c:out>
				</td>
				<td class="item-order-count">
					<c:out value="${item.orderCount}" escapeXml="true"></c:out>
				</td>
				<td class="item-total-price">
					<c:out value="${item.totalPrice}" escapeXml="true"></c:out>
				</td>
				<td class="item-member-name">
					<c:out value="${item.memberName}" escapeXml="true"></c:out>
				</td>
				<td>
					<input type="checkbox" value="${item.id}" />
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
               <th>주문 번호</th>
               <th>주문 상품</th>
               <th>주문 수량</th>
               <th>주문 총액</th>
               <th>주문자</th>
            </tr>
         </thead>
         <tbody id="order-tbody">
         
         </tbody>
      </table>
      <button id="order-button" style="display:none;">주문 취소 하기</button>
</body>
<script type="text/javascript">
	NodeList.prototype.find = Array.prototype.find;
	const orderTbody = document.querySelector("#order-tbody");
	const checkboxs = document.querySelectorAll("#list-table input[type='checkbox']");
	const infoTrs = document.querySelectorAll("#list-table .item-info");
	const orderButton = document.querySelector("#order-button");
	
	const removeTr = (id) => {
		const orderTrs = document.querySelectorAll("#order-tbody tr")
		const target = orderTrs.find((tr) => { return tr.childNodes[0].childNodes[0].value === id})
		orderTbody.removeChild(target);
	}
	
	const addTr = (id) => {
		const find = infoTrs.find((el) => el.childNodes[1].innerText === id)
		const tr = document.createElement("tr");
		tr.innerHTML = (
			"<tr>" +
			"<td><input name=\"id\" type=\"hidden\" value=\"" + find.childNodes[1].innerText + "\" />" + find.childNodes[1].innerText + "</td>" +
			"<td>" + find.childNodes[3].innerText + "</td>" +
			"<td>" + find.childNodes[5].innerText + "</td>" +
			"<td>" + find.childNodes[7].innerText + "</td>" +
			"<td>" + find.childNodes[9].innerText + "</td>" +
			"</tr>"
		);
		orderTbody.appendChild(tr);
	}
	
	checkboxs.forEach((check) => {
		check.addEventListener("change", (e) => {
			const orderId = e.target.value;
			if(e.target.checked)
				addTr(orderId);
			else
				removeTr(orderId);
			
			const trs = document.querySelectorAll("#order-tbody > tr");
			orderButton.style.display = trs.length === 0 ? "none" : "block"
		});
	});
	

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
   <table id="product-table" border='1'>
      <tr>
         <th>선택</th>
         <th>상품번호</th>
         <th>상품명</th>
         <th>상품가격</th>
         <th>상품재고</th>
      </tr>
   </table>
   
   <hr />
   <form id="order-form" method="post" action="write-ok.order">
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
      <button id="order-button" type="button" style="display:none;">주문 하기</button>
   </form>
   
</body>
<script type="text/javascript">
   const products = JSON.parse(`${products}`);
   const orderForm = document.querySelector("#order-form");
   const productTable = document.querySelector("#product-table")
   
   products.forEach(({id, productName, productPrice, productStock}) => {
      productTable.innerHTML += (
         "<tr>" +
            "<td>" + "<input name='productId' type='checkbox' value='" + id + "' />" + "</td>" +  
            "<td>" + id + "</td>" +
            "<td>" + productName + "</td>" +
            "<td>" + productPrice + "</td>" +
            "<td>" + productStock + "</td>" +
         "</tr>"      
      )
   })
   
   const orderTable = document.querySelector("#order-table")
   const inputs = document.querySelectorAll("#product-table input")
   const orderButton = document.querySelector("#order-button")
   
   NodeList.prototype.filter = Array.prototype.filter;
   NodeList.prototype.find = Array.prototype.find;
   
   inputs.forEach((input) => {
      input.addEventListener("change", (e) => {
         const orderId = e.target.value
         const selectProduct = products.find((product) => product.id === Number(orderId))
         const {id, productName, productPrice, productStock} = selectProduct
         const tr = document.createElement("tr")
         
         tr.innerHTML = (
            "<tr>" +
               "<input name='productId' type='hidden' value='"+ id + "' />" +
               "<td>" + productName + "</td>" +
               "<td>" + productPrice + "</td>" +
               "<td><input name='orderCount' value='1' /></td>" +
            "</tr>"
         )
         
         if(e.target.checked){
            orderTable.appendChild(tr)
            orderButton.style.display ="block";
         }else {
            const trs = document.querySelectorAll("#order-table > tr")
            const selectTr = trs.find(tr => tr.childNodes[0].value === orderId)
            orderTable.removeChild(selectTr)
            
            const removedTrs = document.querySelectorAll("#order-table > tr")
            orderButton.style.display = removedTrs.length === 0 ? "none" : "block"
         }
      })
   })
   
   /* 버튼을 누르면 주문 수량이 0이거나, 상품의 재고보다 구매수량이 많은 경우 요청X */
   orderButton.addEventListener("click", (e) => {
      e.preventDefault();
      
      const productIdInputs = document.querySelectorAll("#order-table input[name='productId']");
      const productCountInputs = document.querySelectorAll("#order-table input[name='orderCount']");
      const submitState = [false, false]
      
      /* 
         1. 주문수량이 0인경우
      */
      if(productCountInputs.filter((input) => Number(input.value) !== 0).length !== productCountInputs.length){
         return alert('주문 수량이 없습니다.')
      }else {
         submitState[0] = true;
      }
      
      /*  
         2. 주문수량보다 제품수량이 적은경우, 구매하려는 수량이 제품의 수량보다 많은 경우
      */
      productCountInputs.forEach((_, i) => {
         const productId = productIdInputs[i].value
         const orderCount = productCountInputs[i].value
         const orderedProduct = products.find(({id}) => String(id) === productId)
         
         if(orderCount > orderedProduct.productStock){
            return alert("구매수량이 상품 수량보다 많습니다.")
         }else{
            submitState[1] = true
            if(submitState.filter((state) => state).length === 2){
               orderForm.submit();
            }
         }
      })
   })
   
</script>
</html>











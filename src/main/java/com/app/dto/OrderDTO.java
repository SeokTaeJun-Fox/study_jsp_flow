package com.app.dto;

import java.util.Objects;

//TBO.ID, TBO.ORDER_COUNT, TBO.PRODUCT_ID, TBO_MEMBER_ID TBO.ORDER_COUNT * TBP.PRODUCT_PRICE TOTAL_PRICE,
//TBM.MEMBER_EMAIL, TBM.MEMBER_NAME,
//TBP.PRODUCT_NAME, TBP.PRODUCT_PRICE, TBP.PRODUCT_STOCK
public class OrderDTO {
	private Long id;
	private Integer orderCount;
	private Long productId;
	private Long memberId;
	private Integer totalPrice;
	private String memberEmail;
	private String memberName;
	private String productName;
	private Integer productPrice;
	private Integer productStock;
	
	public OrderDTO() {;}
	
	public OrderDTO(Long id, Integer orderCount, Long productId, Long memberId, Integer totalPrice, String memberEmail,
			String memberName, String productName, Integer productPrice, Integer productStock) {
		this.id = id;
		this.orderCount = orderCount;
		this.productId = productId;
		this.memberId = memberId;
		this.totalPrice = totalPrice;
		this.memberEmail = memberEmail;
		this.memberName = memberName;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductStock() {
		return productStock;
	}

	public void setProductStock(Integer productStock) {
		this.productStock = productStock;
	}



	@Override
	public String toString() {
		return "OrderDTO [id=" + id + ", orderCount=" + orderCount + ", productId=" + productId + ", memberId="
				+ memberId + ", totalPrice=" + totalPrice + ", memberEmail=" + memberEmail + ", memberName="
				+ memberName + ", productName=" + productName + ", productPrice=" + productPrice + ", productStock="
				+ productStock + "]";
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDTO other = (OrderDTO) obj;
		return Objects.equals(id, other.id);
	}
}

package com.app.vo;

import java.util.Objects;

public class OrderVO {
	private Long id;
	private Integer orderCount;
	private Long productId;
	private Long memberId;
	
	public OrderVO() {;}

	public OrderVO(Long id, Integer orderCount, Long productId, Long memberId) {
		this.id = id;
		this.orderCount = orderCount;
		this.productId = productId;
		this.memberId = memberId;
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

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderCount=" + orderCount + ", productId=" + productId + ", memberId=" + memberId
				+ "]";
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
		OrderVO other = (OrderVO) obj;
		return Objects.equals(id, other.id);
	}
}

package _11_orderProcess.model;

import java.math.BigDecimal;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="orderitems")
public class OrderItemsBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="order_id")
	private OrdersBean_H ordersBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="product_id")
	private ProductBean_H productBean_H;
	private Integer amount;
	private Integer total_price;
	private BigDecimal discount;
	
	
	public OrderItemsBean_H(Integer id, OrdersBean_H ordersBean_H, ProductBean_H productBean_H, Integer amount,
			Integer total_price, BigDecimal discount) {
		super();
		this.id = id;
		this.ordersBean_H = ordersBean_H;
		this.productBean_H = productBean_H;
		this.amount = amount;
		this.total_price = total_price;
		this.discount = discount;
	}
	public OrderItemsBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public OrdersBean_H getOrdersBean_H() {
		return ordersBean_H;
	}
	public void setOrdersBean_H(OrdersBean_H ordersBean_H) {
		this.ordersBean_H = ordersBean_H;
	}
	public ProductBean_H getProductBean_H() {
		return productBean_H;
	}
	public void setProductBean_H(ProductBean_H productBean_H) {
		this.productBean_H = productBean_H;
	}
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	
}

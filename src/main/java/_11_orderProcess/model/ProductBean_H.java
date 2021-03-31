package _11_orderProcess.model;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class ProductBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	@OneToMany(mappedBy = "productBean_H")
	private Set<OrderItemsBean_H> orderItemsBean_H = new LinkedHashSet<>();
	private Integer unit_price;
	private String description;
	private BigDecimal discount;
	private String product_img;
	private Integer stock;
	private Integer status;
	private String category;
	
	public ProductBean_H(Integer id, String title, Set<OrderItemsBean_H> orderItemsBean_H, Integer unit_price,
			String description, BigDecimal discount, String product_img, Integer stock, Integer status,
			String category) {
		super();
		this.id = id;
		this.title = title;
		this.orderItemsBean_H = orderItemsBean_H;
		this.unit_price = unit_price;
		this.description = description;
		this.discount = discount;
		this.product_img = product_img;
		this.stock = stock;
		this.status = status;
		this.category = category;
	}
	public ProductBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Set<OrderItemsBean_H> getOrderItemsBean_H() {
		return orderItemsBean_H;
	}
	public void setOrderItemsBean_H(Set<OrderItemsBean_H> orderItemsBean_H) {
		this.orderItemsBean_H = orderItemsBean_H;
	}
	public Integer getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(Integer unit_price) {
		this.unit_price = unit_price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}

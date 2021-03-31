package _11_orderProcess.model;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

@Entity
@Table(name="orders")
public class OrdersBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	private BigDecimal total_amount;
	private String shipping_address;
	private Date order_date;
	private Date shipping_date;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_delete;
	
	public OrdersBean_H(Integer id, StudentBean_H studentBean_H, TrainerBean_H trainerBean_H, BigDecimal total_amount,
			String shipping_address, Date order_date, Date shipping_date, Integer is_delete) {
		super();
		this.id = id;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
		this.total_amount = total_amount;
		this.shipping_address = shipping_address;
		this.order_date = order_date;
		this.shipping_date = shipping_date;
		this.is_delete = is_delete;
	}
	public OrdersBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public StudentBean_H getStudentBean_H() {
		return studentBean_H;
	}
	public void setStudentBean_H(StudentBean_H studentBean_H) {
		this.studentBean_H = studentBean_H;
	}
	public TrainerBean_H getTrainerBean_H() {
		return trainerBean_H;
	}
	public void setTrainerBean_H(TrainerBean_H trainerBean_H) {
		this.trainerBean_H = trainerBean_H;
	}
	public BigDecimal getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(BigDecimal total_amount) {
		this.total_amount = total_amount;
	}
	public String getShipping_address() {
		return shipping_address;
	}
	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getShipping_date() {
		return shipping_date;
	}
	public void setShipping_date(Date shipping_date) {
		this.shipping_date = shipping_date;
	}
	public Integer getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}
	
}

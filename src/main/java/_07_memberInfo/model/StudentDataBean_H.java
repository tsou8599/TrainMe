package _07_memberInfo.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;



/**
 * @author ali82
 *
 */
@Entity
@Table(name="student_data")
public class StudentDataBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	private Date data_date;
	private Double st_weight;
	
	public StudentDataBean_H() {
		
	};
	public StudentDataBean_H(Integer id, StudentBean_H studentBean_H, Date data_date, Double st_weight) {
		super();
		this.id = id;
		this.studentBean_H = studentBean_H;
		this.data_date = data_date;
		this.st_weight = st_weight;
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
	public Date getData_date() {
		return data_date;
	}
	public void setData_date(Date data_date) {
		this.data_date = data_date;
	}
	public Double getSt_weight() {
		return st_weight;
	}
	public void setSt_weight(Double st_weight) {
		this.st_weight = st_weight;
	}
	
	

}
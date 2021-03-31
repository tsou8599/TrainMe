package _09_trainerCourse.model;

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
import _01_register.model.TrainerBean_H;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;



/**
 * @author ali82
 *
 */
@Entity
@Table(name="trainer_off")
public class TrainerOffBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	private Date date;
	private Integer time;
	@ManyToOne
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	
	public TrainerOffBean_H() {
	}
	
	public TrainerOffBean_H(Integer id, TrainerBean_H trainerBean_H, Date date, Integer time) {
		super();
		this.id = id;
		this.trainerBean_H = trainerBean_H;
		this.date = date;
		this.time = time;
	}
	
	



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public TrainerBean_H getTrainerBean_H() {
		return trainerBean_H;
	}
	public void setTrainerBean_H(TrainerBean_H trainerBean_H) {
		this.trainerBean_H = trainerBean_H;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public StudentBean_H getStudentBean_H() {
		return studentBean_H;
	}
	public void setStudentBean_H(StudentBean_H studentBean_H) {
		this.studentBean_H = studentBean_H;
	}
	
	


}
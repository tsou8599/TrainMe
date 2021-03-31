package _10_studentCourse.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="course_diary_item")
public class CourseDiaryItemBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cdi_id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="course_id")
	private StudentCourseBean_H studentCourseBean_H;
	
	private String action;
	private String lord;
	private String reps;
	private String sets;
	private String rest;
	
	
	public CourseDiaryItemBean_H(Integer cdi_id, StudentCourseBean_H studentCourseBean_H, String action, String lord,
			String reps, String sets, String rest) {
		super();
		this.cdi_id = cdi_id;
		this.studentCourseBean_H = studentCourseBean_H;
		this.action = action;
		this.lord = lord;
		this.reps = reps;
		this.sets = sets;
		this.rest = rest;
	}
	public CourseDiaryItemBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getCdi_id() {
		return cdi_id;
	}
	public void setCdi_id(Integer cdi_id) {
		this.cdi_id = cdi_id;
	}
	public StudentCourseBean_H getStudentCourseBean_H() {
		return studentCourseBean_H;
	}
	public void setStudentCourseBean_H(StudentCourseBean_H studentCourseBean_H) {
		this.studentCourseBean_H = studentCourseBean_H;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getLord() {
		return lord;
	}
	public void setLord(String lord) {
		this.lord = lord;
	}
	public String getReps() {
		return reps;
	}
	public void setReps(String reps) {
		this.reps = reps;
	}
	public String getSets() {
		return sets;
	}
	public void setSets(String sets) {
		this.sets = sets;
	}
	public String getRest() {
		return rest;
	}
	public void setRest(String rest) {
		this.rest = rest;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}

package _09_trainerCourse.model;

import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _10_studentCourse.model.StudentCourseBean_H;



@Entity
@Table(name="ratings")
public class RatingsBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	private Integer point;
	private String comment;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="student_course_id")
	private StudentCourseBean_H studentCourseBean_H;
	
	

	public RatingsBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RatingsBean_H(Integer id, StudentBean_H studentBean_H, TrainerBean_H trainerBean_H, Integer point,
			String comment, StudentCourseBean_H studentCourseBean_H) {
		super();
		this.id = id;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
		this.point = point;
		this.comment = comment;
		this.studentCourseBean_H = studentCourseBean_H;
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

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public StudentCourseBean_H getStudentCourseBean_H() {
		return studentCourseBean_H;
	}

	public void setStudentCourseBean_H(StudentCourseBean_H studentCourseBean_H) {
		this.studentCourseBean_H = studentCourseBean_H;
	}
	
	

}
package _10_studentCourse.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import _01_register.model.StudentBean_H;
import _04_money.model.MoneyBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Entity
@Table(name="Student_course")
public class StudentCourseBean_H implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date date;
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	private Integer time;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_delete;
	private String datdiary_content;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_rated;
	
	@Column(columnDefinition = "INT Default 0")
	private Integer is_allowed;
	
	@Transient
    public Long studentCourseTotal;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="trainer_course_id")
	private TrainerCourseBean_H trainerCourseBean_H;
	
	@OneToMany(mappedBy = "studentCourseBean_H",fetch = FetchType.EAGER)
	private Set<CourseDiaryItemBean_H> courseDiaryItemBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentCourseBean_H")
	private Set<MoneyBean_H> moneyBean_H = new LinkedHashSet<>();
	
	@OneToOne(mappedBy = "studentCourseBean_H" , fetch = FetchType.LAZY)
	RatingsBean_H ratingsBean_H;
	


	public StudentCourseBean_H(Date date, StudentBean_H studentBean_H, Integer time, Integer is_delete,
			Integer is_rated, Integer is_allowed, TrainerCourseBean_H trainerCourseBean_H) {
		super();
		this.date = date;
		this.studentBean_H = studentBean_H;
		this.time = time;
		this.is_delete = is_delete;
		this.is_rated = is_rated;
		this.is_allowed = is_allowed;
		this.trainerCourseBean_H = trainerCourseBean_H;
	}

	public StudentCourseBean_H(Integer id, Date date, StudentBean_H studentBean_H, Integer time, Integer is_executed,
			Integer is_delete, String datdiary_content, Integer is_rated, Integer is_allowed,
			TrainerCourseBean_H trainerCourseBean_H, Set<CourseDiaryItemBean_H> courseDiaryItemBean_H,
			Set<MoneyBean_H> moneyBean_H, RatingsBean_H ratingsBean_H) {
		super();
		this.id = id;
		this.date = date;
		this.studentBean_H = studentBean_H;
		this.time = time;
		this.is_delete = is_delete;
		this.datdiary_content = datdiary_content;
		this.is_rated = is_rated;
		this.is_allowed = is_allowed;
		this.trainerCourseBean_H = trainerCourseBean_H;
		this.courseDiaryItemBean_H = courseDiaryItemBean_H;
		this.moneyBean_H = moneyBean_H;
		this.ratingsBean_H = ratingsBean_H;
	}

	public StudentCourseBean_H() {
		super();
		
	}

	public StudentBean_H getStudentBean_H() {
		return studentBean_H;
	}

	public void setStudentBean_H(StudentBean_H studentBean_H) {
		this.studentBean_H = studentBean_H;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}

	public String getDatdiary_content() {
		return datdiary_content;
	}

	public void setDatdiary_content(String datdiary_content) {
		this.datdiary_content = datdiary_content;
	}

	public Integer getIs_allowed() {
		return is_allowed;
	}

	public void setIs_allowed(Integer is_allowed) {
		this.is_allowed = is_allowed;
	}

	public TrainerCourseBean_H getTrainerCourseBean_H() {
		return trainerCourseBean_H;
	}

	public void setTrainerCourseBean_H(TrainerCourseBean_H trainerCourseBean_H) {
		this.trainerCourseBean_H = trainerCourseBean_H;
	}

	public Integer getIs_rated() {
		return is_rated;
	}

	public void setIs_rated(Integer is_rated) {
		this.is_rated = is_rated;
	}

	public Set<CourseDiaryItemBean_H> getCourseDiaryItemBean_H() {
		return courseDiaryItemBean_H;
	}

	public void setCourseDiaryItemBean_H(Set<CourseDiaryItemBean_H> courseDiaryItemBean_H) {
		this.courseDiaryItemBean_H = courseDiaryItemBean_H;
	}

	public Set<MoneyBean_H> getMoneyBean_H() {
		return moneyBean_H;
	}

	public void setMoneyBean_H(Set<MoneyBean_H> moneyBean_H) {
		this.moneyBean_H = moneyBean_H;
	}

	public RatingsBean_H getRatingsBean_H() {
		return ratingsBean_H;
	}

	public void setRatingsBean_H(RatingsBean_H ratingsBean_H) {
		this.ratingsBean_H = ratingsBean_H;
	}

	public Long getStudentCourseTotal() {
		return studentCourseTotal;
	}

	public void setStudentCourseTotal(Long studentCourseTotal) {
		this.studentCourseTotal = studentCourseTotal;
	}
	
	
	
}

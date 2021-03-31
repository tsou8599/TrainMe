package _04_money.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _10_studentCourse.model.StudentCourseBean_H;


@Entity
@Table(name="money")
public class MoneyBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="st_id")
	StudentBean_H studentBean_H;
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tr_id")
	TrainerBean_H trainerBean_H;
	Date change_time;
	Integer change_amount;
	Integer total_amount;
	@Transient
	List<MoneyBean_H> items = new ArrayList<>();
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="student_course_id")
	private StudentCourseBean_H studentCourseBean_H;
		
		public MoneyBean_H() {
			
		}

		public MoneyBean_H(Integer id, StudentBean_H studentBean_H, TrainerBean_H trainerBean_H, Date change_time,
				Integer change_amount, Integer total_amount, List<MoneyBean_H> items,
				StudentCourseBean_H studentCourseBean_H) {
			super();
			this.id = id;
			this.studentBean_H = studentBean_H;
			this.trainerBean_H = trainerBean_H;
			this.change_time = change_time;
			this.change_amount = change_amount;
			this.total_amount = total_amount;
			this.items = items;
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

		public Date getChange_time() {
			return change_time;
		}

		public void setChange_time(Date change_time) {
			this.change_time = change_time;
		}

		public Integer getChange_amount() {
			return change_amount;
		}

		public void setChange_amount(Integer change_amount) {
			this.change_amount = change_amount;
		}

		public Integer getTotal_amount() {
			return total_amount;
		}

		public void setTotal_amount(Integer total_amount) {
			this.total_amount = total_amount;
		}

		public List<MoneyBean_H> getItems() {
			return items;
		}

		public void setItems(List<MoneyBean_H> items) {
			this.items = items;
		}

		public StudentCourseBean_H getStudentCourseBean_H() {
			return studentCourseBean_H;
		}

		public void setStudentCourseBean_H(StudentCourseBean_H studentCourseBean_H) {
			this.studentCourseBean_H = studentCourseBean_H;
		}

	
		
	
	}

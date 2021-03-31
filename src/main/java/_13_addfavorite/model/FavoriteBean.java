package _13_addfavorite.model;

import javax.persistence.CascadeType;
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
@Table(name="favorite")
public class FavoriteBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;

	
	
	public FavoriteBean(Integer id, StudentBean_H studentBean_H, TrainerBean_H trainerBean_H) {
		super();
		this.id = id;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
		
	}
	
	public FavoriteBean() {
		
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



}

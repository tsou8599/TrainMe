package _03_memberData.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import _01_register.model.MemberBean_H;
import _01_register.model.TrainerBean_H;

@Entity
@Table(name="trainer_license")
public class TrainerLicenseBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@ManyToOne
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	
	public TrainerLicenseBean_H(Integer id, String name, TrainerBean_H trainerBean_H) {
		super();
		this.id = id;
		this.name = name;
		this.trainerBean_H = trainerBean_H;
	}
	public TrainerLicenseBean_H() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public TrainerBean_H getTrainerBean_H() {
		return trainerBean_H;
	}
	public void setTrainerBean_H(TrainerBean_H trainerBean_H) {
		this.trainerBean_H = trainerBean_H;
	}
	
	
}

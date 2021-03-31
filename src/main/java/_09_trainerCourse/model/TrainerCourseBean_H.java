package _09_trainerCourse.model;

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

import _01_register.model.TrainerBean_H;
import _04_money.model.MoneyBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Entity
@Table(name="trainer_course")
public class TrainerCourseBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="sk_id")
	private SkillBean_H skillBean_H;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="skill_type_id")
	private SkillTypeBean_H skill_typeBean_H;
	private Integer price;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_delete;
	
//	@OneToMany(mappedBy = "trainerCourseBean_H", fetch = FetchType.EAGER)
//	private Set<StudentCourseBean_H> studentCourseBean_H = new LinkedHashSet<>();
	
	public TrainerCourseBean_H(TrainerBean_H trainerBean_H, Integer price) {
		super();
		this.trainerBean_H = trainerBean_H;
		this.price = price;
	}
	

//	public Set<StudentCourseBean_H> getStudentCourseBean_H() {
//		return studentCourseBean_H;
//	}
//
//
//	public void setStudentCourseBean_H(Set<StudentCourseBean_H> studentCourseBean_H) {
//		this.studentCourseBean_H = studentCourseBean_H;
//	}


	public TrainerCourseBean_H(Integer id, TrainerBean_H trainerBean_H, SkillBean_H skillBean_H,
			SkillTypeBean_H skill_typeBean_H, Integer price, Integer is_delete) {
		super();
		this.id = id;
		this.trainerBean_H = trainerBean_H;
		this.skillBean_H = skillBean_H;
		this.skill_typeBean_H = skill_typeBean_H;
		this.price = price;
		this.is_delete = is_delete;
	}


	public TrainerCourseBean_H() {
		super();
		// TODO Auto-generated constructor stub
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

	public SkillBean_H getSkillBean_H() {
		return skillBean_H;
	}

	public void setSkillBean_H(SkillBean_H skillBean_H) {
		this.skillBean_H = skillBean_H;
	}

	public SkillTypeBean_H getSkill_typeBean_H() {
		return skill_typeBean_H;
	}

	public void setSkill_typeBean_H(SkillTypeBean_H skill_typeBean_H) {
		this.skill_typeBean_H = skill_typeBean_H;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}


	public Integer getIs_delete() {
		return is_delete;
	}


	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}
	
	

	
	
	
	
}

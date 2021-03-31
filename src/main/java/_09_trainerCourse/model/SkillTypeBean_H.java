package _09_trainerCourse.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="skill_type")
public class SkillTypeBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
//	@OneToMany(mappedBy = "skill_typeBean_H")
//	private Set<TrainerCourseBean_H> books = new LinkedHashSet<>();
	
	public SkillTypeBean_H(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public SkillTypeBean_H() {
		
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
	
}

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
@Table(name="skill")
public class SkillBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@OneToMany(mappedBy = "skillBean_H")
	private Set<TrainerCourseBean_H> courses = new LinkedHashSet<>();
	
	public Set<TrainerCourseBean_H> getCourses() {
		return courses;
	}

	public void setCourses(Set<TrainerCourseBean_H> courses) {
		this.courses = courses;
	}

	public SkillBean_H(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public SkillBean_H() {
		
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

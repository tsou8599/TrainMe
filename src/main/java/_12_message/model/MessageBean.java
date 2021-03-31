package _12_message.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
@Table(name="message")
public class MessageBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	private Date date;
	private String title;
	private String content;
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_read;
	private Integer toType;
	private String kind;
	
	
	
	public MessageBean(Integer id, Date date, String title, String content, StudentBean_H studentBean_H,
			TrainerBean_H trainerBean_H, Integer is_read, Integer toType, String kind) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.content = content;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
		this.is_read = is_read;
		this.toType = toType;
		this.kind = kind;
	}

	public MessageBean() {
		
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getIs_read() {
		return is_read;
	}

	public void setIs_read(Integer is_read) {
		this.is_read = is_read;
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

	public Integer getToType() {
		return toType;
	}

	public void setToType(Integer toType) {
		this.toType = toType;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	
	
	
	

}

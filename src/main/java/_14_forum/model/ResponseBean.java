package _14_forum.model;

import java.sql.Date;

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
@Table(name="response")
public class ResponseBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String response_content;
	private Date response_time;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="article_id")
	private ArticleBean articleBean;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	



	public ResponseBean(Integer id, String response_content, Date response_time, ArticleBean articleBean,
			StudentBean_H studentBean_H, TrainerBean_H trainerBean_H) {
		super();
		this.id = id;
		this.response_content = response_content;
		this.response_time = response_time;
		this.articleBean = articleBean;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
	}

	public ResponseBean() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getResponse_content() {
		return response_content;
	}

	public void setResponse_content(String response_content) {
		this.response_content = response_content;
	}


	public Date getResponse_time() {
		return response_time;
	}

	public void setResponse_time(Date response_time) {
		this.response_time = response_time;
	}

	
	public ArticleBean getArticle_id() {
		return articleBean;
	}

	public void setArticle_id(ArticleBean article_id) {
		this.articleBean = article_id;
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

package _14_forum.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

@Entity
@Table(name="article")
public class ArticleBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	private Date article_time;
	private Date article_update_time;
	private String content;
	private Integer good;
	private Boolean is_delete;

	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="st_id")
	private StudentBean_H studentBean_H;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="tr_id")
	private TrainerBean_H trainerBean_H;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH})
	@JoinColumn(name="article_type_id")
	private ArticleTypeBean articleTypeBean;
	
	@OneToMany(mappedBy = "articleBean")
	private Set<ResponseBean> responseBean = new LinkedHashSet<>();

	


	public ArticleBean(Integer id, String title, Date article_time, Date article_update_time, String content,
			Integer good, Boolean is_delete, StudentBean_H studentBean_H, TrainerBean_H trainerBean_H,
			ArticleTypeBean articleTypeBean, Set<ResponseBean> responseBean) {
		super();
		this.id = id;
		this.title = title;
		this.article_time = article_time;
		this.article_update_time = article_update_time;
		this.content = content;
		this.good = good;
		this.is_delete = is_delete;
		this.studentBean_H = studentBean_H;
		this.trainerBean_H = trainerBean_H;
		this.articleTypeBean = articleTypeBean;
		this.responseBean = responseBean;
	}


	public ArticleBean() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getArticle_time() {
		return article_time;
	}


	public void setArticle_time(Date article_time) {
		this.article_time = article_time;
	}


	public Date getArticle_update_time() {
		return article_update_time;
	}


	public void setArticle_update_time(Date article_update_time) {
		this.article_update_time = article_update_time;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Integer getGood() {
		return good;
	}


	public void setGood(Integer good) {
		this.good = good;
	}


	public Boolean getIs_delete() {
		return is_delete;
	}


	public void setIs_delete(Boolean is_delete) {
		this.is_delete = is_delete;
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


	public ArticleTypeBean getArticleTypeBean() {
		return articleTypeBean;
	}


	public void setArticleTypeBean(ArticleTypeBean articleTypeBean) {
		this.articleTypeBean = articleTypeBean;
	}


	public Set<ResponseBean> getResponseBean() {
		return responseBean;
	}


	public void setResponseBean(Set<ResponseBean> responseBean) {
		this.responseBean = responseBean;
	}


	
	
}

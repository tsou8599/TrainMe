package _14_forum.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="article_type")
public class ArticleTypeBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String article_type_name;
	
	@OneToMany(mappedBy = "articleTypeBean")
	private Set<ArticleBean> articleBean = new LinkedHashSet<>();
	
	public ArticleTypeBean(Integer id, String article_type_name) {
		super();
		this.id = id;
		this.article_type_name = article_type_name;
	}



	public ArticleTypeBean() {
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getArticle_type_name() {
		return article_type_name;
	}



	public void setArticle_type_name(String article_type_name) {
		this.article_type_name = article_type_name;
	}



	public Set<ArticleBean> getArticleBean() {
		return articleBean;
	}



	public void setArticleBean(Set<ArticleBean> articleBean) {
		this.articleBean = articleBean;
	}

	
	
}

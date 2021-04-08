package _01_register.model;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.model.TrainerOffBean_H;
import _11_orderProcess.model.OrdersBean_H;
import _12_message.model.MessageBean;
import _13_addfavorite.model.FavoriteBean;
import _14_forum.model.ArticleBean;
import _14_forum.model.ResponseBean;



/**
 * @author ali82
 *
 */
@Entity
@Table(name="trainer")
public class TrainerBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "INT Default 2")
	private Integer type;
	private String name;
	private String phone;
	private Date birthday;
	private String email;
	private String password;
	@Transient
	private String passwordcheck;
	@Transient
	private String oldpassword;
	@Transient
	private String newpassword;
	@Transient
	private String newpasswordcheck;
	private String id_number;
	private String sex;
	private Integer verification;
	private Integer year;
	@ManyToOne
	@JoinColumn(name="city_id")
	private City_H city;
	@ManyToOne
	@JoinColumn(name="area_id")
	private Area_H area;
	private String address;
	@ManyToOne
	@JoinColumn(name="gym_id")
	private GymBean_H gym;
	@Transient
	private Integer gympassword;
	private String profile_image;
	private String profile_video;
	private Integer is_delete;
	private String hash;
	private String nickname;
	private String bank_account;
	private String course;
	private String introduction;
	@Column(columnDefinition = "Double Default 0")
	private Double ratings;
	private Integer ratings_size;
	
	@Transient
	private MultipartFile trainerImage;
	@Transient
	private MultipartFile trainerVideo;
	@Transient
    public boolean hasError = false;	
	@Transient
    public Long trainerTotal;
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<RatingsBean_H> ratingsBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<TrainerAccountBean_H> trainerAccountBean_H = new LinkedHashSet<>();

	@OneToMany(mappedBy = "trainerBean_H")
	private Set<MoneyBean_H> moneyBean_H = new LinkedHashSet<>();

	@OneToMany(mappedBy = "trainerBean_H")
	private Set<TrainerCourseBean_H> trainerCourseBean_H = new LinkedHashSet<>();

	@OneToMany(mappedBy = "trainerBean_H")
	private Set<OrdersBean_H> ordersBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<TrainerOffBean_H> trainerOffBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<TrainerLicenseBean_H> trainerLicenseBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<MessageBean> messageBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<FavoriteBean> favoriteBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<ArticleBean> articleBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "trainerBean_H")
	private Set<ResponseBean> responseBean = new LinkedHashSet<>();
	
	
	public TrainerBean_H(Integer id, Integer type, String name, String phone, Date birthday, String email, String password,
			String id_number, String sex, Integer verification, GymBean_H gym, Integer is_delete, String myHash,Double ratings,Integer ratings_size) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.phone = phone;
		this.birthday = birthday;
		this.email = email;
		this.password = password;
		this.id_number = id_number;
		this.sex = sex;
		this.verification = verification;
		this.gym = gym;
		this.is_delete = is_delete;
		this.hash = myHash;
		this.ratings = ratings;
		this.ratings_size = ratings_size;
	}




	public TrainerBean_H() {
		
	}


	public Integer getRatings_size() {
		return ratings_size;
	}




	public void setRatings_size(Integer ratings_size) {
		this.ratings_size = ratings_size;
	}




	public Double getRatings() {
		return ratings;
	}



	public void setRatings(Double ratings) {
		this.ratings = ratings;
	}




	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}




	public Integer getType() {
		return type;
	}




	public void setType(Integer type) {
		this.type = type;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public Date getBirthday() {
		return birthday;
	}




	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getPasswordcheck() {
		return passwordcheck;
	}




	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}




	public String getOldpassword() {
		return oldpassword;
	}




	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}




	public String getNewpassword() {
		return newpassword;
	}




	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}




	public String getNewpasswordcheck() {
		return newpasswordcheck;
	}




	public void setNewpasswordcheck(String newpasswordcheck) {
		this.newpasswordcheck = newpasswordcheck;
	}




	public String getId_number() {
		return id_number;
	}




	public void setId_number(String id_number) {
		this.id_number = id_number;
	}




	public String getSex() {
		return sex;
	}




	public void setSex(String sex) {
		this.sex = sex;
	}




	public Integer getVerification() {
		return verification;
	}




	public void setVerification(Integer verification) {
		this.verification = verification;
	}




	public Integer getYear() {
		return year;
	}




	public void setYear(Integer year) {
		this.year = year;
	}




	public City_H getCity() {
		return city;
	}




	public void setCity(City_H city) {
		this.city = city;
	}




	public Area_H getArea() {
		return area;
	}




	public void setArea(Area_H area) {
		this.area = area;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public GymBean_H getGym() {
		return gym;
	}




	public void setGym(GymBean_H gym) {
		this.gym = gym;
	}




	public Integer getGympassword() {
		return gympassword;
	}




	public void setGympassword(Integer gympassword) {
		this.gympassword = gympassword;
	}




	public String getProfile_image() {
		return profile_image;
	}




	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}




	public String getProfile_video() {
		return profile_video;
	}




	public void setProfile_video(String profile_video) {
		this.profile_video = profile_video;
	}




	public Integer getIs_delete() {
		return is_delete;
	}




	public void setIs_delete(Integer is_delete) {
		this.is_delete = is_delete;
	}




	public String getHash() {
		return hash;
	}




	public void setHash(String hash) {
		this.hash = hash;
	}




	public String getNickname() {
		return nickname;
	}




	public void setNickname(String nickname) {
		this.nickname = nickname;
	}




	public String getBank_account() {
		return bank_account;
	}




	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}




	public String getCourse() {
		return course;
	}




	public void setCourse(String course) {
		this.course = course;
	}




	public String getIntroduction() {
		return introduction;
	}




	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}




	public Set<RatingsBean_H> getRatingsBean_H() {
		return ratingsBean_H;
	}




	public void setRatingsBean_H(Set<RatingsBean_H> ratingsBean_H) {
		this.ratingsBean_H = ratingsBean_H;
	}




	public Set<TrainerAccountBean_H> getTrainerAccountBean_H() {
		return trainerAccountBean_H;
	}




	public void setTrainerAccountBean_H(Set<TrainerAccountBean_H> trainerAccountBean_H) {
		this.trainerAccountBean_H = trainerAccountBean_H;
	}




	public Set<MoneyBean_H> getMoneyBean_H() {
		return moneyBean_H;
	}




	public void setMoneyBean_H(Set<MoneyBean_H> moneyBean_H) {
		this.moneyBean_H = moneyBean_H;
	}








	public MultipartFile getTrainerImage() {
		return trainerImage;
	}




	public void setTrainerImage(MultipartFile trainerImage) {
		this.trainerImage = trainerImage;
	}




	public MultipartFile getTrainerVideo() {
		return trainerVideo;
	}




	public void setTrainerVideo(MultipartFile trainerVideo) {
		this.trainerVideo = trainerVideo;
	}




	public boolean getHasError() {
		return hasError;
	}




	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}




	public Set<TrainerCourseBean_H> getTrainerCourseBean_H() {
		return trainerCourseBean_H;
	}




	public void setTrainerCourseBean_H(Set<TrainerCourseBean_H> trainerCourseBean_H) {
		this.trainerCourseBean_H = trainerCourseBean_H;
	}




	public Set<OrdersBean_H> getOrdersBean_H() {
		return ordersBean_H;
	}




	public void setOrdersBean_H(Set<OrdersBean_H> ordersBean_H) {
		this.ordersBean_H = ordersBean_H;
	}




	public Set<TrainerLicenseBean_H> getTrainerLicenseBean_H() {
		return trainerLicenseBean_H;
	}




	public void setTrainerLicenseBean_H(Set<TrainerLicenseBean_H> trainerLicenseBean_H) {
		this.trainerLicenseBean_H = trainerLicenseBean_H;
	}




	public Set<TrainerOffBean_H> getTrainerOffBean_H() {
		return trainerOffBean_H;
	}




	public void setTrainerOffBean_H(Set<TrainerOffBean_H> trainerOffBean_H) {
		this.trainerOffBean_H = trainerOffBean_H;
	}




	public Set<MessageBean> getMessageBean() {
		return messageBean;
	}




	public void setMessageBean(Set<MessageBean> messageBean) {
		this.messageBean = messageBean;
	}




	public Set<FavoriteBean> getFavoriteBean() {
		return favoriteBean;
	}




	public void setFavoriteBean(Set<FavoriteBean> favoriteBean) {
		this.favoriteBean = favoriteBean;
	}




	public Long getTrainerTotal() {
		return trainerTotal;
	}




	public void setTrainerTotal(Long trainerTotal) {
		this.trainerTotal = trainerTotal;
	}




	public Set<ArticleBean> getArticleBean() {
		return articleBean;
	}




	public void setArticleBean(Set<ArticleBean> articleBean) {
		this.articleBean = articleBean;
	}




	


}
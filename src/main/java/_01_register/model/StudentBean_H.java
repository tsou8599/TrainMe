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
import _04_money.model.MoneyBean_H;
import _07_memberInfo.model.StudentDataBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.TrainerOffBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _11_orderProcess.model.OrdersBean_H;
import _12_message.model.MessageBean;
import _13_addfavorite.model.FavoriteBean;
import _14_forum.model.ArticleBean;
import _14_forum.model.ResponseBean;



@Entity
@Table(name="student")
public class StudentBean_H extends MemberBean_H {
	private static final long serialVersionUID = 1L;
	
//-----會員資料--------
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "INT Default 1")
	private Integer type;
	private String name;
	private String phone;
	private String email;  
	private Date birthday;
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
	@Column(columnDefinition = "Double Default 0.0")
	private Integer verification;
	
	
	
//-----個人資料--------
	@ManyToOne
	@JoinColumn(name="city_id")
	private City_H city;
	@ManyToOne
	@JoinColumn(name="area_id")
	private Area_H area;
	private String address;
	private Double heigth;
	private Double weight;
	private String profile_image;
	private String nickname;
	@Column(columnDefinition = "INT Default 0")
	private Integer is_delete;
	private String hash;
	private String introduction;
	private Integer activity;
	

	@Transient
	MultipartFile studentImage;
	@Transient
    public boolean hasError = false;
	@Transient
    public Long studentTotal;
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<MoneyBean_H> moneyBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<RatingsBean_H> ratingsBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<StudentCourseBean_H> studentCourseBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<OrdersBean_H> ordersBean_H = new LinkedHashSet<>();

	@OneToMany(mappedBy = "studentBean_H")
	private Set<TrainerOffBean_H> trainerOffBean_H = new LinkedHashSet<>();

	@OneToMany(mappedBy = "studentBean_H")
	private Set<StudentDataBean_H> studentDataBean_H = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<MessageBean> messageBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<FavoriteBean> favoriteBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "studentBean_H")
	private Set<ArticleBean> articleBean = new LinkedHashSet<>();

	@OneToMany(mappedBy = "studentBean_H")
	private Set<ResponseBean> responseBean = new LinkedHashSet<>();
	
	public StudentBean_H(String name, String phone, String email, Date birthday, String password, String id_number,
			String sex, String hash) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.birthday = birthday;
		this.password = password;
		this.id_number = id_number;
		this.sex = sex;
		this.hash = hash;
	}

	public StudentBean_H() {
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public Double getHeigth() {
		return heigth;
	}

	public void setHeigth(Double heigth) {
		this.heigth = heigth;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Set<MoneyBean_H> getMoneyBean_H() {
		return moneyBean_H;
	}

	public void setMoneyBean_H(Set<MoneyBean_H> moneyBean_H) {
		this.moneyBean_H = moneyBean_H;
	}

	public Set<RatingsBean_H> getRatingsBean_H() {
		return ratingsBean_H;
	}

	public void setRatingsBean_H(Set<RatingsBean_H> ratingsBean_H) {
		this.ratingsBean_H = ratingsBean_H;
	}

	public Set<StudentCourseBean_H> getStudentCourseBean_H() {
		return studentCourseBean_H;
	}

	public void setStudentCourseBean_H(Set<StudentCourseBean_H> studentCourseBean_H) {
		this.studentCourseBean_H = studentCourseBean_H;
	}


	public MultipartFile getStudentImage() {
		return studentImage;
	}

	public void setStudentImage(MultipartFile studentImage) {
		this.studentImage = studentImage;
	}

	public boolean getHasError() {
		return hasError;
	}

	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}

	public Set<OrdersBean_H> getOrdersBean_H() {
		return ordersBean_H;
	}

	public void setOrdersBean_H(Set<OrdersBean_H> ordersBean_H) {
		this.ordersBean_H = ordersBean_H;
	}

	public Set<TrainerOffBean_H> getTrainerOffBean_H() {
		return trainerOffBean_H;
	}

	public void setTrainerOffBean_H(Set<TrainerOffBean_H> trainerOffBean_H) {
		this.trainerOffBean_H = trainerOffBean_H;
	}

	public Set<StudentDataBean_H> getStudentDataBean_H() {
		return studentDataBean_H;
	}

	public void setStudentDataBean_H(Set<StudentDataBean_H> studentDataBean_H) {
		this.studentDataBean_H = studentDataBean_H;
	}

	public Integer getActivity() {
		return activity;
	}

	public void setActivity(Integer activity) {
		this.activity = activity;
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

	public Long getStudentTotal() {
		return studentTotal;
	}

	public void setStudentTotal(Long studentTotal) {
		this.studentTotal = studentTotal;
	}
	
	
	
	


	

}
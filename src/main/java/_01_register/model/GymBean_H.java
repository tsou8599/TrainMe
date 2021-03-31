package _01_register.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Entity
@Table(name="gym")
public class GymBean_H {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	String phone;
	Integer verification; 
	@Column(columnDefinition="text")
	String introduction;
	@ManyToOne
	@JoinColumn(name="city_id")
	private City_H city;
	@ManyToOne
	@JoinColumn(name="area_id")
	private Area_H area;
	private String address;
	@Transient
    public Long gymTotal;
	

	



	public GymBean_H(Integer id, String name, String phone, Integer verification, String introduction, City_H city,
			Area_H area, String address) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.verification = verification;
		this.introduction = introduction;
		this.city = city;
		this.area = area;
		this.address = address;
	}


	public GymBean_H() {
		
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getVerification() {
		return verification;
	}

	public void setVerification(Integer verification) {
		this.verification = verification;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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


	public Long getGymTotal() {
		return gymTotal;
	}


	public void setGymTotal(Long gymTotal) {
		this.gymTotal = gymTotal;
	}
	
	
	
	
	
	
}

package _13_addfavorite.dto;

import java.util.List;

import _09_trainerCourse.model.TrainerCourseBean_H;
import _12_message.dto.MessageInfo;
import _12_message.model.MessageBean;
import _13_addfavorite.model.FavoriteBean;

public class FavoriteInfo {
	
	private Integer id;
	private Integer trId;
	private String name;
	private String profile_image;
	private Double ratings;
	private String city;
	private String area;
	private Object[] skillType;
	private Integer price;
	private String gym;
	
	
	







	public FavoriteInfo(Integer id, Integer trId, String name, String profile_image, double ratings, String city, String area, String gym) {
		super();
		this.id = id;
		this.trId = trId;
		this.name = name;
		this.profile_image = profile_image;
		this.ratings = ratings;
		this.city = city;
		this.area = area;
		this.gym = gym;
	}

//	把FavoriteBean轉成FavoriteInfo(?)/取得FavoriteBean的東西
	public static FavoriteInfo create(FavoriteBean fb) {
		Double ratings = fb.getTrainerBean_H().getRatings() == null ? 0.0 : fb.getTrainerBean_H().getRatings();
		
		return new FavoriteInfo(fb.getId(),fb.getTrainerBean_H().getId(), fb.getTrainerBean_H().getName(), fb.getTrainerBean_H().getProfile_image(),
				ratings,
				fb.getTrainerBean_H().getGym().getCity().getName(),
				fb.getTrainerBean_H().getGym().getArea().getName(),
				fb.getTrainerBean_H().getGym().getName()
				);
	}





//	public Object[] getSkillType() {
//		return skillType;
//	}
//
//
//	public void setSkillType(Object[] objects) {
//		this.skillType = objects;
//	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public String getGym() {
		return gym;
	}


	public void setGym(String gym) {
		this.gym = gym;
	}
	
	
	
	
}

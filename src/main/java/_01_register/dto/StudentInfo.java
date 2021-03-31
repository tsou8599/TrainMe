package _01_register.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

import _01_register.model.StudentBean_H;
import _07_memberInfo.service.StudentInfoService;



@SuppressWarnings("unused")
public class StudentInfo {
	
	private Integer id;
	private Integer type;
	private Integer age;
	private String name;
	private String phone;
	private Date birthday;
	private String birth;
	private String sex;
	private Double heigth;
	private Double weight;
	private String profile_image;
	private String nickname;
	private String introduction;
	private double BMI;
	
	StudentInfoService studentInfoService = new StudentInfoService();
	
	private StudentInfo(Integer id, Integer type, String name, String phone, Date birthday, String sex, Double heigth,
			Double weight, String profile_image, String nickname, String introduction) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.phone = phone;
		SimpleDateFormat myFmt1 = new SimpleDateFormat("yyyy/MM/dd");
		this.birth = myFmt1.format(birthday);
		this.sex = sex;
		
		if (heigth != null) {
			this.heigth = heigth;			
		}else {
			this.heigth = 0.0;
		}
		
		if (heigth != null) {
			this.weight = weight;			
		}else {
			this.weight = 0.0;
		}
		
		if (nickname != null) {
			this.nickname = nickname;
		}else {
			
			this.nickname = "";
		}
		
		if (profile_image != null) {
			this.profile_image = profile_image;
		}else {
			this.profile_image = "/_03_MemberData/member.jpg";
		}
		
		if (introduction != null) {
			this.introduction = introduction;
		}else {
			this.introduction = "此學員尚未填寫自我介紹";
		}
		
		this.age = studentInfoService.calAge(birthday);
		
		if (heigth != null && weight != null) {
			this.BMI = studentInfoService.calBMI(heigth , weight);
		}else {
			this.BMI = 0;
		}
	}
	


	public static StudentInfo create(StudentBean_H sb) {
		return new StudentInfo(sb.getId(), sb.getType(), sb.getName(), sb.getPhone(), 
							   sb.getBirthday(), sb.getSex(), sb.getHeigth(), sb.getWeight(), 
							   sb.getProfile_image(), sb.getNickname(), sb.getIntroduction());
	}
	
}



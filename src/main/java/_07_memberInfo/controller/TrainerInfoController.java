package _07_memberInfo.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.GymBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _02_login.model.LoginBean;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.GymService;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _07_memberInfo.service.TrainerInfoService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.service.TrainerCourseService;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _12_message.service.MessageService;
import _13_addfavorite.model.FavoriteBean;
import _13_addfavorite.service.FavoriteService;
import mail.model.SendingAcceptEmail;
import mail.model.SendingBookCourse;

@SessionAttributes({"LoginOK","studentMoney"})
@Controller
public class TrainerInfoController {
	
	@Autowired
	MemberDataService memberDataService;
	@Autowired
	GymService gymService;
	@Autowired
	TrainerInfoService trainerInfoService;
	@Autowired
	SearchTrainerService searchTrainerService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	MemberService_H memberService;
	
	@Autowired
	TrainerCourseService trainerCourseService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	FavoriteService favoriteService;
	
	@Autowired
	MemPointService memPointService;

	

	@GetMapping("/trainer_info/{id}")
	public String TrainerInfo(Model model,
			@PathVariable("id") Integer id,
			@RequestParam("type") String type,
			@RequestParam(value="stId", required=false) Integer stId) {
		
		if (stId != null) {
			List<FavoriteBean> st_favorite = favoriteService.getFavoriteList(stId);
			Boolean isFavorite = favoriteService.isFavorite(stId, id);
			model.addAttribute("isFavorite", isFavorite);
			model.addAttribute("st_favorite", st_favorite);
		}
		
		
		TrainerBean_H trainerBean = memberDataService.getTrainerById(id);		
		GymBean_H gym =  gymService.getGym(trainerBean.getGym().getId());
		List<TrainerCourseBean_H> trainerCourses = trainerInfoService.getTrainerCourse(id);
		List<TrainerCourseBean_H> trainerCoursesSkillType = trainerInfoService.getTrainerCourseSkillType(id);
		List<TrainerLicenseBean_H> trainerLicenseBean = memberDataService.getTrainerLicenseAll(id);
		List<StudentCourseBean_H> trainerCourseAndStudentCourseAndRatings = trainerCourseService.getTrainerCourseById(id);
		
		model.addAttribute("type",type);
		model.addAttribute("trainerLicenseBean", trainerLicenseBean);
		model.addAttribute("trainerCoursesSkillType", trainerCoursesSkillType);
		model.addAttribute("trainerCourses", trainerCourses);
		model.addAttribute("gym", gym);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("trainerCourseAndStudentCourseAndRatings", trainerCourseAndStudentCourseAndRatings);
		return "/_07_memberInfo/trainer_info";
	}
	
	@GetMapping("/bookCourse")
	public String bookCourse(Model model,@RequestParam("tr") Integer trId ,
			@RequestParam("st") Integer stId,
			@RequestParam("date") String date,
			@RequestParam("hour") Integer hour) {
		TrainerBean_H trainerBean = memberDataService.getTrainerById(trId);
		List<TrainerCourseBean_H> trainerCourses = trainerInfoService.getTrainerCourse(trId);
		String bookTime = date + " " + hour + ":00 - " + (hour+1) + ":00";
		
		MoneyBean_H studentMoney =memPointService.getStudentMoneyLast(stId);
		
		model.addAttribute("hour", hour);
		model.addAttribute("date", date);
		model.addAttribute("bookTime", bookTime);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("trainerCourses", trainerCourses);
		model.addAttribute("studentMoney", studentMoney);
		
		return "/_07_memberInfo/booking_message";
	}
	
	
	@GetMapping("/getSkillPrice")
	public @ResponseBody Integer getSkillPrice(Model model,
			@RequestParam("skillId") Integer skillId,
			@RequestParam("trId") Integer trId) {
		
		return trainerInfoService.getSkillPrice(trId, skillId);
	}
	
	@PostMapping("/addBookCourse")
	public String addBookCourse(Model model,@RequestParam("tr") Integer trId ,
			@RequestParam("st") Integer stId,
			@RequestParam("date") String date,
			@RequestParam("hour") Integer hour,
			@RequestParam("skill") Integer skillId)  {
		Date dateS = null;
		StudentBean_H studentBean = memberDataService.getStudentById(stId);
		TrainerCourseBean_H trainerCourseBean = trainerInfoService.getTrainerCourseBeanByTrId_SkillId(trId, skillId);
		try {
//			date = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			dateS = new java.sql.Date( new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime() );
//			sd = new java.sql.Date(ud.getTime());
			java.util.Date now = new java.util.Date();
			java.sql.Date changeTime = new java.sql.Date(now.getTime());
			StudentBean_H sb = memberDataService.getStudentById(stId);
			
			StudentCourseBean_H sc = new StudentCourseBean_H(dateS, studentBean, hour, 0, 0, 0, trainerCourseBean);
			trainerInfoService.addStudentCourse(sc);
			
			MoneyBean_H moneyBean_H1=new MoneyBean_H();
			//學員預約後money要新增一筆學員扣款
			moneyBean_H1.setStudentBean_H(sb);
			moneyBean_H1.setChange_time(changeTime);
			moneyBean_H1.setChange_amount(-trainerCourseBean.getPrice());
			moneyBean_H1.setStudentCourseBean_H(sc);
			memPointService.saveStudentRefund(moneyBean_H1);
			
			
			//寄預約訊息給教練
			SendingBookCourse bookEmail = new SendingBookCourse(trainerCourseBean.getTrainerBean_H().getEmail(), trainerCourseBean.getTrainerBean_H().getName(), stId, trId, sc);
			bookEmail.sendingBookEmail();
			//傳送預約訊息給教練
			messageService.bookMsgToTrainer(sc);
	
			
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		
		return "redirect:/st_info_lesson/"+stId;
	}
	
	@ModelAttribute
	public void commonData(Model model) {
		
		
		
		// 為了for註冊、登入from:from表單
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("loginBean", loginBean);
			
		List<City_H> cities = addressService.listCities();		
		Map<String, String> sexMap = new HashMap<>();
		Map<Integer, String> gymMap = new HashMap<>();
		List<GymBean_H> gymList = memberService.getGymList_H();
		for (GymBean_H gym : gymList) {
			gymMap.put(gym.getId(), gym.getName());
		}
		sexMap.put("M", "男");
		sexMap.put("F", "女");
		
		model.addAttribute("sexMap", sexMap);
		model.addAttribute("gymList", gymMap);
		model.addAttribute("cities", cities);	
	}
	
}

package _08_searchTrainer.controller;

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

import _01_register.model.GymBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _02_login.model.LoginBean;
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _13_addfavorite.model.FavoriteBean;
import _13_addfavorite.service.FavoriteService;

@Controller
public class SearchTrainerController {
	
	@Autowired
	SearchTrainerService searchTrainerService;
	@Autowired
	AddressService addressService;
	@Autowired
	MemberService_H memberService;
	@Autowired
	FavoriteService favoriteService;

	
	
	

	@GetMapping("/searchTrainerAll")
	public String SearchTrainerAll(Model model, @RequestParam(value="stId", required=false) Integer stId) {
		List<TrainerCourseBean_H> trainerCourseAll = searchTrainerService.getTrainerCourseAll();
		List<TrainerCourseBean_H> trainerOfSkillType = searchTrainerService.getTrainerOfSkillType();
	
		if (stId != null) {
			List<FavoriteBean> st_favorite = favoriteService.getFavoriteList(stId);
			System.out.println("=============================================>"+st_favorite.size());
			model.addAttribute("st_favorite", st_favorite);
		}
	
		model.addAttribute("trainerCourseAll", trainerCourseAll);
		model.addAttribute("trainerOfSkillType", trainerOfSkillType);
		return "/_08_searchTrainer/search_trainer";
	}
	
	@GetMapping("/searchTrainerByCondition")
	public String SearchTrainerByCondition(Model model,
			@RequestParam("skillType") int skillType,
			@RequestParam("city") int city,
			@RequestParam("keyword") String keyword
			) {
		
		List<TrainerCourseBean_H> brforeSearch = searchTrainerService.searchTrainerByCondition(city, skillType, keyword);
		List<TrainerCourseBean_H> trainerOfSkillType = searchTrainerService.getTrainerOfSkillType();

		
	
		model.addAttribute("trainerCourseAll", brforeSearch);
		model.addAttribute("trainerOfSkillType", trainerOfSkillType);
		
		return "/_08_searchTrainer/search_trainer";
	}
	
	
	@PostMapping("totalPage")
	public @ResponseBody String getTotalPage(Model model) {
		Integer totle =  searchTrainerService.getTrainerCourseCount();
		return totle.toString();
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
			
		List<SkillTypeBean_H> skillTypeAll = searchTrainerService.getSkillTypeAll();
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
		model.addAttribute("skillTypeAll", skillTypeAll);	
	}
	
}

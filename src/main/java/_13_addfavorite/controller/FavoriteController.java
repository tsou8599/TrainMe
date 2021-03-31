package _13_addfavorite.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _03_memberData.service.MemberDataService;
import _07_memberInfo.service.TrainerInfoService;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _12_message.dto.MessageInfo;
import _12_message.model.MessageBean;
import _13_addfavorite.dto.FavoriteInfo;
import _13_addfavorite.model.FavoriteBean;
import _13_addfavorite.service.FavoriteService;

@Controller
public class FavoriteController {
	
	@Autowired
	FavoriteService favoriteService;
	@Autowired
	MemberDataService memberDataService;
	@Autowired
	TrainerInfoService trainerInfoService;
	
	@PostMapping("/addFavorite/{id}")
	public @ResponseBody String addFavorite(@PathVariable("id")Integer id,
			@RequestParam("tr_id") Integer trId) {
		FavoriteBean fb = new FavoriteBean(null, memberDataService.getStudentById(id), memberDataService.getTrainerById(trId));
		favoriteService.addFavorite(fb);
		Gson gson = new Gson();
        String json = gson.toJson("ok");
		return json;
	}
	
	@PostMapping("/deleteFavorite/{id}")
	public @ResponseBody String deleteFavorite(@PathVariable("id")Integer id,
			@RequestParam("tr_id") Integer trId) {
		favoriteService.cancelFavorite(favoriteService.getFavoriteBean(id, trId));
		Gson gson = new Gson();
		String json = gson.toJson("ok");
		return json;
	}
	
	@GetMapping("favoriteList/{id}")
	public @ResponseBody String favoriteList(@PathVariable("id")Integer id) {
		Gson gson = new Gson();
        String json = gson.toJson(favoriteService.getFavoriteTrainerIdList(id));
        return json;
	}
	
	@GetMapping("allFavorite/{id}")
	public @ResponseBody String allMessage(@PathVariable("id")Integer id){
		
		List<FavoriteBean> favoriteList = favoriteService.getFavoriteList(id);
		List<Object> favoriteInfos = new ArrayList<>();
		for(FavoriteBean fb:favoriteList) {
			FavoriteInfo info = FavoriteInfo.create(fb);
//			List<SkillTypeBean_H> trainerCoursesSkillType = trainerInfoService.getTrainerSkillType(fb.getTrainerBean_H().getId());
			Integer cheapPrice = trainerInfoService.getCheapPrice(fb.getTrainerBean_H().getId());
			info.setPrice(cheapPrice);

			favoriteInfos.add(info);
		}
		Gson gson = new Gson();
        String json = gson.toJson(favoriteInfos);
		return json;
		
	}
	
	@GetMapping("favoriteTrainer/{id}")
	public String favoriteTrainer() {
		return "/_13_addfavorite/favoriteTrainer";
	}
			
	
}

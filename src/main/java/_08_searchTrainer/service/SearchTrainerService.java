package _08_searchTrainer.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _08_searchTrainer.dao.SearchTrainerDao;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Transactional
@Service
public class SearchTrainerService {
	
	@Autowired
	SearchTrainerDao searchTrainerDao;

	public List<TrainerCourseBean_H> getTrainerCourseAll() {
		return searchTrainerDao.getTrainerCourseAll();
	}
	public List<SkillTypeBean_H> getSkillTypeAll() {
		return searchTrainerDao.getSkillTypeAll();
	}
	
	public List<TrainerCourseBean_H> getTrainerOfSkillType() {
		return searchTrainerDao.getTrainerOfSkillType();
	}
	
	public List<TrainerCourseBean_H> searchTrainerByCondition(int cityId, int skillTypeId, String keyWord) {
		List<TrainerCourseBean_H> searchTrainerByCondition = new ArrayList<>();
		
		System.out.println(cityId);
		List<Integer> searchTrainerByCity = searchTrainerDao.searchTrainerByCity(cityId);
		List<Integer> searchTrainerBySkillType = searchTrainerDao.searchTrainerBySkillType(skillTypeId);
		List<Integer> searchTrainerByKeyWord = searchTrainerDao.searchTrainerByKeyWord(keyWord);
		List<Integer> resultTrainerId = new ArrayList<Integer>();
	
		
//		// 全部都有輸入
		if (cityId != 0 && skillTypeId != 0 && keyWord != "") {
			searchTrainerByKeyWord.retainAll(searchTrainerByCity);
			searchTrainerByKeyWord.retainAll(searchTrainerByKeyWord);
			resultTrainerId.addAll(searchTrainerByKeyWord);
		}
		// 只輸入地址、類型
		if (cityId != 0 && skillTypeId != 0 && keyWord == "") {
			searchTrainerByCity.retainAll(searchTrainerBySkillType);
			resultTrainerId.addAll(searchTrainerByCity);
		}
		// 只輸入地址、關鍵字
		if (cityId != 0 && skillTypeId == 0 && keyWord != "") {
			searchTrainerByKeyWord.retainAll(searchTrainerByCity);
			resultTrainerId.addAll(searchTrainerByKeyWord);
		}
		// 只輸入類型、關鍵字
		if (cityId == 0 && skillTypeId != 0 && keyWord != "") {
			searchTrainerByKeyWord.retainAll(searchTrainerByKeyWord);
			resultTrainerId.addAll(searchTrainerByKeyWord);
		}
		// 只輸入地址
		if (cityId != 0 && skillTypeId == 0 && keyWord == "") {
			resultTrainerId.addAll(searchTrainerByCity);
		}
		// 只輸入類型
		if (cityId == 0 && skillTypeId != 0 && keyWord == "") {
			resultTrainerId.addAll(searchTrainerBySkillType);
		}
		// 只輸入關鍵字
		if (cityId == 0 && skillTypeId == 0 && keyWord != "") {
			resultTrainerId.addAll(searchTrainerByKeyWord);
		}
		
		for(Integer trId:resultTrainerId) {
			searchTrainerByCondition.add(searchTrainerDao.getTrainerCourseByTrainerId(trId));
		}
		return searchTrainerByCondition;
	}
	
	//找出全部有課程的教練有幾筆
		public Integer getTrainerCourseCount() {
			return searchTrainerDao.getTrainerCourseCount();
		}
	
	
	

	
	
}

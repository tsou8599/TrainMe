package _07_memberInfo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _07_memberInfo.dao.TrainerInfoDao;
import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Service
public class TrainerInfoService {
	
	@Autowired
	TrainerInfoDao trainerInfoDao;
	
	public List<TrainerCourseBean_H> getTrainerCourse(int trId) {
		return trainerInfoDao.getTrainerCourse(trId);
	}
	
	public List<TrainerCourseBean_H> getTrainerCourseSkillType(int trId) {
		return trainerInfoDao.getTrainerCourseSkillType(trId);
	}
	
	public List<SkillTypeBean_H> getTrainerSkillType(int trId) {
		return trainerInfoDao.getTrainerSkillType(trId);
	}
	
	//找教練最便宜的課程價格
		public Integer getCheapPrice(int trId) {
			return trainerInfoDao.getCheapPrice(trId);
		}
	
	public Integer getSkillPrice(int trId , int skillId) {
		return trainerInfoDao.getSkillPrice(trId, skillId);
	}
	
	public TrainerCourseBean_H getTrainerCourseBeanByTrId_SkillId(int trId , int skillId) {
		return trainerInfoDao.getTrainerCourseBeanByTrId_SkillId(trId, skillId);
	}
	
	public void addStudentCourse(StudentCourseBean_H sc) {
		trainerInfoDao.addStudentCourse(sc);
	}
}

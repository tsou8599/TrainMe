package _08_searchTrainer.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.TrainerBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Repository
public class SearchTrainerDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourseAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H group by trainerBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerOfSkillType() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H group by trainerBean_H,skill_typeBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SkillTypeBean_H> getSkillTypeAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SkillTypeBean_H";
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> searchTrainerByCity(int cityId) {
		Session session = factory.getCurrentSession();										   
		String hql = "SELECT DISTINCT tc.trainerBean_H.id FROM TrainerCourseBean_H as tc WHERE tc.trainerBean_H.gym.city.id = :cityId ";
		List<Integer> searchTrainerByCity = session.createQuery(hql).setParameter("cityId", cityId).getResultList();
		return searchTrainerByCity;
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> searchTrainerBySkillType(int skillTypeId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT tc.trainerBean_H.id FROM TrainerCourseBean_H as tc WHERE tc.skill_typeBean_H.id = :skillTypeId";
		List<Integer> searchTrainerBySkillType = session.createQuery(hql).setParameter("skillTypeId", skillTypeId).getResultList();
		return searchTrainerBySkillType;
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> searchTrainerByKeyWord(String keyWord) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT tc.trainerBean_H.id FROM TrainerCourseBean_H as tc WHERE tc.trainerBean_H.course like '%" +keyWord+ "%' "
					+ " or tc.trainerBean_H.introduction like '%" + keyWord +  "%' ";	
		return session.createQuery(hql).getResultList();
	}
	
	public TrainerCourseBean_H getTrainerCourseByTrainerId(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H as tc WHERE tc.trainerBean_H.id = :trId group by trainerBean_H ";
		return (TrainerCourseBean_H) session.createQuery(hql).setParameter("trId", trId).getSingleResult();
	}
	
	//找出全部有課程的教練有幾筆
	public Integer getTrainerCourseCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM TrainerCourseBean_H group by trainerBean_H";
		return  (Integer) session.createQuery(hql).getSingleResult();
	}
	
	
	
	
}

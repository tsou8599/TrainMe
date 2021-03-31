package _07_memberInfo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Repository
public class TrainerInfoDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourse(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H WHERE tr_id = :mtrId AND is_delete = 0";
		
		return session.createQuery(hql).setParameter("mtrId", trId).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerCourseSkillType(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT skill_typeBean_H FROM TrainerCourseBean_H WHERE tr_id = :mtrId AND is_delete = 0";
		
		return session.createQuery(hql).setParameter("mtrId", trId).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SkillTypeBean_H> getTrainerSkillType(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT skill_typeBean_H FROM TrainerCourseBean_H WHERE tr_id = :mtrId AND is_delete = 0";
		
		return session.createQuery(hql).setParameter("mtrId", trId).getResultList();
	}
	
	//找教練最便宜的課程價格
	public Integer getCheapPrice(int trId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT MIN(price) FROM TrainerCourseBean_H WHERE tr_id = :mtrId AND is_delete = 0";
		return (Integer) session.createQuery(hql).setParameter("mtrId", trId).getSingleResult();
	}
	
	public Integer getSkillPrice(int trId , int skillId) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT price FROM TrainerCourseBean_H WHERE tr_id = :mtrId and sk_id = :skillId";
		return (Integer) session.createQuery(hql).setParameter("mtrId", trId).setParameter("skillId", skillId).getSingleResult();
	}
	
	public TrainerCourseBean_H getTrainerCourseBeanByTrId_SkillId(int trId , int skillId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H WHERE tr_id = :mtrId and sk_id = :skillId";
		return (TrainerCourseBean_H) session.createQuery(hql).setParameter("mtrId", trId).setParameter("skillId", skillId).getSingleResult();	
	}
	
	public void addStudentCourse(StudentCourseBean_H sc) {
		Session session = factory.getCurrentSession();
		session.save(sc);	
	}
	
	
	
}

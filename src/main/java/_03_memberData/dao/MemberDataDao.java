package _03_memberData.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;

@Repository
public class MemberDataDao {
	
	@Autowired
	SessionFactory factory;

	public void updateStudent(StudentBean_H sb) {
		Session session = factory.getCurrentSession();
		session.update(sb);
	}
	
	public StudentBean_H getStudentById(int id) {
		Session session = factory.getCurrentSession();
		return session.get(StudentBean_H.class, id);
		
	}
	
	public void updateTrainer(TrainerBean_H tb) {
		Session session = factory.getCurrentSession();
		session.update(tb);
	}
	
	public TrainerBean_H getTrainerById(int id) {
		Session session = factory.getCurrentSession();
		return session.get(TrainerBean_H.class, id);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerLicenseBean_H> getTrainerLicenseAll(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerLicenseBean_H WHERE tr_id = :mId";
		return session.createQuery(hql).setParameter("mId", id).getResultList();
	}
	
	public void delTrainerLicense(TrainerLicenseBean_H tlb) {
		Session session = factory.getCurrentSession();
		session.delete(tlb);
	}
	
	public TrainerLicenseBean_H getTrainerLicenseById(int id) {
		Session session = factory.getCurrentSession();
		return session.get(TrainerLicenseBean_H.class, id);
	}
	 
	@SuppressWarnings("unchecked")
	public List<RatingsBean_H> getTrainerRatings(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM RatingsBean_H WHERE tr_id = :mId";
		return session.createQuery(hql).setParameter("mId", id).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TrainerCourseBean_H> getTrainerAndCourse() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TrainerCourseBean_H tc GROUP BY tc.trainerBean_H.id ORDER BY tc.trainerBean_H.id";
//		SELECT  *  FROM  trainer_course tc JOIN trainer t ON tc.tr_id = t.id GROUP BY t.id
		return session.createQuery(hql).getResultList();
	}
	
	
}

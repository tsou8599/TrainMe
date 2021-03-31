package _10_studentCourse.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Repository
public class StudentCourseDao {
	
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getComingSoonCourse(int id , Date nowDate, Date endDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 1 and is_delete = 0 and date BETWEEN '" 
				   + nowDate + "' and '" + endDate + "' and st_id = :mId ORDER BY date";
		courses = session.createQuery(hql).setParameter("mId", id).getResultList();
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getComingSoonCourseAll(int id , Date nowDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 1 and is_delete = 0 and date > '" 
				   + nowDate + "' and st_id = :mId ORDER BY date";
		courses = session.createQuery(hql).setParameter("mId", id).getResultList();
		return courses;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getWaitCourse(int id, Date nowDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 0 and is_delete = 0 and date > :nowDate and st_id = :mId ORDER BY date";
		courses = session.createQuery(hql).setParameter("nowDate", nowDate).setParameter("mId", id).getResultList();
		return courses;
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentCourseBean_H> getBeforeCourse(int id, Date nowDate) {
		Session session = factory.getCurrentSession();
		List<StudentCourseBean_H> courses = new ArrayList<>();
		String hql = "FROM StudentCourseBean_H WHERE is_allowed = 1 and is_delete = 0 and date < :nowDate and st_id = :mId ORDER BY date DESC";
		courses =  session.createQuery(hql).setParameter("nowDate", nowDate).setParameter("mId", id).getResultList();		
		return courses;		
	}
	
	public void cancelCourse(int courseId) {
		Session session = factory.getCurrentSession();
		StudentCourseBean_H scb = session.get(StudentCourseBean_H.class, courseId);
		scb.setIs_delete(1);
		session.update(scb);
	}
	public void allowCourse(int courseId) {
		Session session = factory.getCurrentSession();
		StudentCourseBean_H scb = session.get(StudentCourseBean_H.class, courseId);
		scb.setIs_allowed(1);
		session.update(scb);
	}
//	用課程id找到該堂課程
	public StudentCourseBean_H getStudentCourse(int courseId) {
		Session session = factory.getCurrentSession();
		StudentCourseBean_H scb = session.get(StudentCourseBean_H.class, courseId);
		return scb;
		
	}
	
//	新增評價
	public void addFeedback(RatingsBean_H ratingsBean) {
		Session session = factory.getCurrentSession();
		session.save(ratingsBean);
	}
	
//	找評價內的所有資料
	@SuppressWarnings("unchecked")
	public List<RatingsBean_H> getRatings(){
		Session session = factory.getCurrentSession();
		List<RatingsBean_H> ratings = new ArrayList<>();
		String hql = "FROM RatingsBean_H";
		ratings = session.createQuery(hql).getResultList();		
		return ratings;
	}
	
	public void addSkill(SkillBean_H skillBean_H) {
		Session session = factory.getCurrentSession();
		session.save(skillBean_H);
	}
	
	public SkillTypeBean_H getSkillTypeById(int skillTypeId) {
		Session session = factory.getCurrentSession();
		return session.get(SkillTypeBean_H.class, skillTypeId);
	}
	
	public void addTrainerCourse(TrainerCourseBean_H tcb) {
		Session session = factory.getCurrentSession();
		session.save(tcb);
	}

	public long queryCourseTotal() {

		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM StudentCourseBean_H where is_allowed = 1 AND is_delete = 0";
		
		return (long) session.createQuery(hql).getSingleResult();

	}
	
	
}

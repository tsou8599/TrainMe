package _10_studentCourse.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
@Repository
public class StudentDiaryDao {
	
	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public StudentCourseBean_H getCourseMsg(int id) {
		Session session = factory.getCurrentSession();
		StudentCourseBean_H courses = new StudentCourseBean_H();
		String hql = "FROM StudentCourseBean_H WHERE id = :mId";
		courses =  (StudentCourseBean_H) session.createQuery(hql).setParameter("mId", id).getSingleResult();		
		return courses;		
	}
	
	@SuppressWarnings("unchecked")
	public List<CourseDiaryItemBean_H>  getDiaryItem(int id) {
		Session session = factory.getCurrentSession();
		List<CourseDiaryItemBean_H> courses = new LinkedList<>();
		String hql = "FROM CourseDiaryItemBean_H WHERE course_id = :mId";
		courses =   session.createQuery(hql).setParameter("mId", id).getResultList();;		
		return courses;		
	}
	
	// 儲存CourseDiaryItemBean物件，將參數cdi新增到course_diary_item表格內。

			public int saveTrainerCourseDiaryItem(CourseDiaryItemBean_H cdi) {
				int n = 0;
				Session session = factory.getCurrentSession();
				session.save(cdi);
				n++;

				return n;
			}
			
			public void delTrainerCourseDiaryItem(int Id) {
				Session session = factory.getCurrentSession();
				
				String hql = "DELETE FROM CourseDiaryItemBean_H WHERE cdi_id = :mid";
				
				session.createQuery(hql).setParameter("mid", Id).executeUpdate();		
			}
			
			
			public void updateStudentCourseDatDiaryContent(StudentCourseBean_H scb) {
				Session session = factory.getCurrentSession();
				session.update(scb);
			}
			
		
	
}
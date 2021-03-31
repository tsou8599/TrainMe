package _10_studentCourse.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.dao.StudentCourseDao;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Service
public class StudentCourseService {
	
	@Autowired
	StudentCourseDao studentCourseDao;

	
	public List<StudentCourseBean_H> getComingSoonCourse(int id , Date nowDate){
		
		   Calendar cal = Calendar.getInstance();
		   cal.setTime(nowDate);
		   cal.add(Calendar.DATE, 7);		   
		   java.sql.Date endDate = new java.sql.Date(cal.getTimeInMillis());
		   
		return studentCourseDao.getComingSoonCourse(id, nowDate, endDate);
	}
	
	public List<StudentCourseBean_H> getComingSoonCourseAll(int id , Date nowDate) {
		return studentCourseDao.getComingSoonCourseAll(id, nowDate);
	}
	
	public List<StudentCourseBean_H> getWaitCourse(int id, Date nowDate){
		return studentCourseDao.getWaitCourse(id, nowDate);
	}
	
	public List<StudentCourseBean_H> getBeforeCourse(int id, Date nowDate) {
		return studentCourseDao.getBeforeCourse(id, nowDate);
	}
	
	public void cancelCourse(int courseId) {
		studentCourseDao.cancelCourse(courseId);
	}
	
	public void allowCourse(int courseId) {
		studentCourseDao.allowCourse(courseId);
	}
		
	public StudentCourseBean_H getStudentCourse(int courseId) {
		return studentCourseDao.getStudentCourse(courseId);
	}
	
	public void addFeedback(RatingsBean_H ratingsBean) {
		studentCourseDao.addFeedback(ratingsBean);
	}
	
	public List<RatingsBean_H> getRatings(){
		return studentCourseDao.getRatings();
	}
	
	public void addSkill(SkillBean_H skillBean_H) {
		studentCourseDao.addSkill(skillBean_H);
	}
	
	public SkillTypeBean_H getSkillTypeById(int skillTypeId) {
		return studentCourseDao.getSkillTypeById(skillTypeId);
	}
	
	public void addTrainerCourse(TrainerCourseBean_H tcb) {
		studentCourseDao.addTrainerCourse(tcb);
	}
	
	public long queryCourseTotal() {		
		return studentCourseDao.queryCourseTotal();
	}
}

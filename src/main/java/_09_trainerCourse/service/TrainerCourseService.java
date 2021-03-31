package _09_trainerCourse.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.TrainerBean_H;
import _09_trainerCourse.dao.TrainerCourseDao;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.model.TrainerOffBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
@Transactional
@Service
public class TrainerCourseService {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	TrainerCourseDao trainerCourseDao;
	
	public void saveTimeOff(TrainerOffBean_H tob,int trId) {
		
		tob.setTrainerBean_H(trainerCourseDao.getTrainerById(trId));
		trainerCourseDao.saveTimeOff(tob);
	}
	
	public void deleteTimeOff(String dateBegin ,String dateEnd,int trId) {
		trainerCourseDao.deleteTimeOff(dateBegin, dateEnd, trId);
	}
	
	public List<String> queryTimeOffList(int trId){
		return trainerCourseDao.queryTimeOffList(trId);
	}
	
	public List<String> queryBookedList(int trId) {
		List<String> list = new ArrayList<>();
		List<StudentCourseBean_H> bookedTimes = trainerCourseDao.getTrainerCourseById(trId);
		for(StudentCourseBean_H bookedTime : bookedTimes) {
			String bookedHour = bookedTime.getDate() + "_" + bookedTime.getTime();
//			System.out.println("============================="+bookedTime.getId());
			list.add(bookedHour);
		}	
		return list;
	}
	
	public List<String> queryStudentBookList(int stId) {
		List<String> list = new ArrayList<>();
		List<StudentCourseBean_H> studentBookedTimes = trainerCourseDao.queryStudentBookList(stId);
		for(StudentCourseBean_H studentBookedTime : studentBookedTimes) {
			String studentBookedHour = studentBookedTime.getDate() + "_" + studentBookedTime.getTime();
//			System.out.println("============================="+bookedTime.getId());
			list.add(studentBookedHour);
		}	
		return list;
	}

	public List<StudentCourseBean_H> getTrainerCourseById(int trId){
		return trainerCourseDao.getTrainerCourseById(trId);
	}
	
	public TrainerBean_H getTrainerById(int trId) {
		return trainerCourseDao.getTrainerById(trId);
	}
	
	public List<TrainerCourseBean_H> getTrainerCourseList(int trId) {
		return trainerCourseDao.getTrainerCourseList(trId);
	}
	
	public void delectCourse(int trainCourseId) {
		trainerCourseDao.delectCourse(trainCourseId);
	}
	
		

}

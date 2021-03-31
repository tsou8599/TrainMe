package _07_memberInfo.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.StudentBean_H;
import _03_memberData.dao.MemberDataDao;
import _07_memberInfo.dao.StudentInfoDao;
import _07_memberInfo.model.StudentDataBean_H;
import _10_studentCourse.model.StudentCourseBean_H;

@Transactional
@Service
public class StudentInfoService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	StudentInfoDao studentInfoDao;
	
	@Autowired 
	MemberDataDao memberDataDao;

	public Integer calAge(Date birth) {

		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Taipei"));
		int nowYear = cal.get(Calendar.YEAR);
		cal.setTime(birth);
		int birthYear = cal.get(Calendar.YEAR);
		int age = nowYear - birthYear;

		return age;
	}

	public Double calBMI(double heigth, double weight) {
		heigth = heigth/100;
		double BMI = Math.round(weight / Math.pow(heigth,2) * 100.0) / 100.0;
		
		return BMI;
	}
	
	public Double calBMR(StudentBean_H studentBean) {
		double heigth = studentBean.getHeigth();
		double weight = studentBean.getWeight();
		double BMR = 0.0;
		int age = calAge(studentBean.getBirthday());
		System.out.println(studentBean.getSex());
		if (studentBean.getSex().equals("F")) {
			BMR = (9.6 * weight) + (1.8 * heigth) - (4.7 * age) + 665;
		}
		if (studentBean.getSex().equals("M")) {
			BMR = (13.7 * weight) + (5.0 * heigth) - (6.8 * age) + 66 ; 
		}
	
		return Math.round(BMR * 100.0) / 100.0;
	}
	
	public Double calTDEE(StudentBean_H studentBean) {
		double TDEE = 0.0;
		double BMR = calBMR(studentBean);
		int activity = studentBean.getActivity();
		switch (activity) {
		case 0:
			TDEE = BMR * 1.2;
			break;
		case 1:
			TDEE = BMR * 1.375;
			break;
		case 2:
			TDEE = BMR * 1.55;
			break;
		case 3:
			TDEE = BMR * 1.725;
			break;
		case 4:
			TDEE = BMR * 1.9;
			break;
		}
		
		return  Math.round(TDEE * 100.0) / 100.0 ;
	}
	
	public void saveWeightData(StudentDataBean_H sdb) {
		studentInfoDao.saveWeightData(sdb);
	}
	
	public void updateWeightData(StudentDataBean_H sdb) {
		studentInfoDao.updateWeightData(sdb);
	}
	
	public StudentDataBean_H getStudentWeightDataByDateAndId(int id, Date date) {
		return studentInfoDao.getStudentWeightDataByDateAndId(id, date);
	}
	
	public List<StudentDataBean_H> getStudentWeightData(int id) {
		return studentInfoDao.getStudentWeightData(id);
	}
	
	public List<StudentDataBean_H> getStudentWeightDateData(int id) {
		return studentInfoDao.getStudentWeightDateData(id);
	}
	
	public void updateBodyData(StudentBean_H sb) {
		memberDataDao.updateStudent(sb);
	}
	
	
	
}

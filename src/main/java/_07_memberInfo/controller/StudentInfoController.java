package _07_memberInfo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _07_memberInfo.model.StudentDataBean_H;
import _07_memberInfo.service.StudentInfoService;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;

@Controller
@SessionAttributes({ "LoginOK", "TotalAmount", "comingSoonCourse", "waitCourse" }) // 此處有LoginOK的識別字串
public class StudentInfoController {

	@Autowired
	StudentInfoService studentInfoService;

	@Autowired
	MemberDataService memberDataService;

	@Autowired
	StudentCourseService studentCourseService;

	@Autowired
	MemPointService memPointService;

	@GetMapping("/student_info/{id}")
	public String StudentInfo(Model model, @PathVariable("id") Integer id) {

		StudentBean_H studentBean = memberDataService.getStudentById(id);
		List<StudentDataBean_H> studentDataBean = studentInfoService.getStudentWeightDateData(id);
		int age = studentInfoService.calAge(studentBean.getBirthday());
		model.addAttribute("age", age);
		if (studentBean.getHeigth() != null && studentBean.getWeight() != null) {

			double BMI = studentInfoService.calBMI(studentBean.getHeigth(), studentBean.getWeight());
			double BMR = studentInfoService.calBMR(studentBean);
			double TDEE = studentInfoService.calTDEE(studentBean);
			model.addAttribute("BMI", BMI);
			model.addAttribute("BMR", BMR);
			model.addAttribute("TDEE", TDEE);
			model.addAttribute("StudentDataBean", studentDataBean);
		}

		MoneyBean_H moneyBean = memPointService.getStudentMoneyLast(id);
		System.out.println("moneyBean="+moneyBean);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
//		System.out.println("======================1");
		List<StudentCourseBean_H> comingSoonCourse = studentCourseService.getComingSoonCourse(id, nowDate);
		List<StudentCourseBean_H> waitCourse = studentCourseService.getWaitCourse(id, nowDate);
		model.addAttribute("comingSoonCourse", comingSoonCourse);
		model.addAttribute("waitCourse", waitCourse);
		model.addAttribute("LoginOK", studentBean);
		model.addAttribute("TotalAmount", moneyBean);
		
		return "/_07_memberInfo/student_info";
	}

	@GetMapping("/student_info_edit/{id}")
	public String studentInfoEdit(Model model, @PathVariable("id") Integer id) {
		StudentBean_H studentBean = memberDataService.getStudentById(id);
		model.addAttribute("studentBean", studentBean);
		return "/_07_memberInfo/student_info_edit";
	}

	@PostMapping("/student_bodyData_update/{id}")
	public String studentBodyDataUpdate(@ModelAttribute("studentBean") StudentBean_H newBean, Model model,
			@PathVariable("id") Integer id) {

		StudentBean_H oldBean = memberDataService.getStudentById(id);
		oldBean.setHeigth(newBean.getHeigth());
		oldBean.setWeight(newBean.getWeight());
		oldBean.setActivity(newBean.getActivity());
		oldBean.setIntroduction(newBean.getIntroduction());
		studentInfoService.updateBodyData(oldBean);

		// 取得今天日期
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		// 新增體重資料的StudentDataBean_H
		StudentDataBean_H studentDataBeanNow = new StudentDataBean_H(id, oldBean, nowDate, newBean.getWeight());

		StudentDataBean_H studentDataBeanBefore = null;
		// 之前體重資料的StudentDataBean_H，傳入今天的日期跟學員id，得到資料庫的體重資料
		studentDataBeanBefore = studentInfoService.getStudentWeightDataByDateAndId(id, nowDate);
		// 若studentDataBeanBefore傳回來不是null，就執行以下程式
		if (studentDataBeanBefore != null) {
			// 得到studentDataBeanBefore的日期
			Date tagetDate = studentDataBeanBefore.getData_date();
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
			String nowDateFormat = sdformat.format(nowDate);
			String tagetDateFormat = sdformat.format(tagetDate);

			// 如果新增的日期跟過去的日期是一樣，就更新過去的體重資料，避免同一天寫入多筆體重資料
			if (nowDateFormat.equals(tagetDateFormat)) {
				studentDataBeanBefore.setSt_weight(newBean.getWeight());
				studentInfoService.updateWeightData(studentDataBeanBefore);
			}

		} else {
			// 若是不一樣的日期，就新增一筆體重資料
			studentInfoService.saveWeightData(studentDataBeanNow);
		}

		return "redirect:/student_info/" + id;
	}

	@GetMapping("/CancelCourse/{id}")
	public String cancelCourse(@PathVariable("id") Integer id, @RequestParam("courseId") String courseIdStr,
			Model model) {
		int courseId = Integer.parseInt(courseIdStr);
		studentCourseService.cancelCourse(courseId);

		return "redirect:/student_info/" + id;
	}

}

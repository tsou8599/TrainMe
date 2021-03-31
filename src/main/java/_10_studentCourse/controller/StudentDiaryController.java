package _10_studentCourse.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentDiaryService;

@Controller
@SessionAttributes({ "LoginOK", "beforeCourse","CourseMsg", "StudentCourse","CourseDiaryItem" })
public class StudentDiaryController {

	
	@Autowired
	StudentDiaryService studentDiaryService;

	@GetMapping("/trainer_Course_diary/{id}")
	public String trDiary(Model model, @PathVariable("id") Integer id) {
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
		List<CourseDiaryItemBean_H> diaryItem = studentDiaryService.getDiaryItem(id);
		model.addAttribute("CourseMsg", CourseMsg);
		model.addAttribute("CourseDiaryItem", diaryItem);
		return "/_10_studentCourse/trainer_Course_diary";
	}
	
	@GetMapping("/student_Course_diary/{id}")
	public String stDiary(Model model, @PathVariable("id") Integer id) {
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		
		StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
		List<CourseDiaryItemBean_H> diaryItem = studentDiaryService.getDiaryItem(id);
		model.addAttribute("CourseMsg", CourseMsg);
		model.addAttribute("CourseDiaryItem", diaryItem);
		return "/_10_studentCourse/student_Course_diary";
	}
	
	 @GetMapping("/addCourseDiaryItem")
	 public String addCourseDiaryItem(@RequestParam("action") String action, @RequestParam("CourseMsgId") int CourseMsgId, @RequestParam("lord") String lord, 
			 @RequestParam("reps") String reps,  @RequestParam("sets") String sets,  @RequestParam("rest") String rest) {
	 CourseDiaryItemBean_H courseDiaryItemBean_H = new CourseDiaryItemBean_H();
	 StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(CourseMsgId);
	 courseDiaryItemBean_H.setAction(action);
	 courseDiaryItemBean_H.setLord(lord);
	 courseDiaryItemBean_H.setReps(reps);
	 courseDiaryItemBean_H.setSets(sets);
	 courseDiaryItemBean_H.setRest(rest);
	 courseDiaryItemBean_H.setStudentCourseBean_H(CourseMsg);
	 
	 studentDiaryService.saveCourseDiaryItemBean(courseDiaryItemBean_H);
	 
	 
	 return "redirect:/trainer_Course_diary/" + CourseMsgId;
	 }
	 
	 @GetMapping("/delCourseDiaryItem/{id}/{cdi_id}")
	 public String delLicense(Model model, @PathVariable("id") Integer id, @PathVariable("cdi_id") Integer cdi_id) {
		
		 studentDiaryService.delTrainerCourseDiaryItem(cdi_id);
		
		 return "redirect:/trainer_Course_diary/" + id;
	 }

	 @PostMapping("/updateStudentCourseDatDiaryContent/{id}")
		public String updateStudentCourseDatDiaryContent(@ModelAttribute("studentCourseBean") StudentCourseBean_H newBean, Model model,
				@PathVariable("id") Integer id, HttpServletRequest request) throws IOException, ServletException {
			
			StudentCourseBean_H CourseMsg = studentDiaryService.getCourseMsg(id);
			
			CourseMsg.setDatdiary_content(newBean.getDatdiary_content());

			studentDiaryService.updateStudentCourseDatDiaryContent(CourseMsg);		
			Integer trid = CourseMsg.getTrainerCourseBean_H().getTrainerBean_H().getId();
			return "redirect:/trainerCourse/" + trid;
		}
	
	}



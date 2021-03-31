package _10_studentCourse.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberServiceImpl_H;
import _01_register.service.MemberService_H;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _07_memberInfo.service.StudentInfoService;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.SkillBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.service.TrainerCourseService;
import _10_studentCourse.model.CourseDiaryItemBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _10_studentCourse.service.StudentDiaryService;
import _12_message.service.MessageService;

@SessionAttributes({ "LoginOK", "comingSoonCourse", "waitCourse", "beforeCourse", "type" })
@Controller
public class StudentCourseController {

	@Autowired
	StudentInfoService studentInfoService;
	
	@Autowired
	StudentCourseService studentCourseService;	
	
	@Autowired
	TrainerCourseService trainerCourseService;
	
	@Autowired
	MemPointService memPointService;
	
	@Autowired
	MemberService_H memberService;
	
	@Autowired
	MemberDataService memberDataService;
	
	@Autowired
	MessageService messageService;


	@GetMapping("/st_info_lesson/{id}")
	public String stLesson(Model model, @PathVariable("id") Integer id) {
//		System.out.println("==================okkkkkkkkkkkkkkkkk");
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		List<StudentCourseBean_H> comingSoonCourse = studentCourseService.getComingSoonCourseAll(id, nowDate);
		List<StudentCourseBean_H> waitCourse = studentCourseService.getWaitCourse(id, nowDate);
		List<StudentCourseBean_H> beforeCourse = studentCourseService.getBeforeCourse(id, nowDate);
		List<RatingsBean_H> ratings = studentCourseService.getRatings();
	
		
		model.addAttribute("comingSoonCourse", comingSoonCourse);
		model.addAttribute("waitCourse", waitCourse);
		model.addAttribute("beforeCourse", beforeCourse);
		model.addAttribute("ratings", ratings);

		
		
		return "_10_studentCourse/st_info_lesson";
	}
	
	//同意課程信的查看課程按鈕會轉跳到這個方法
	@GetMapping("/st_info_lesson")
	public String stCheckLesson(HttpServletRequest request, Model model) {
		String stid = request.getParameter("key");
		Integer id = Integer.parseInt(stid);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		List<StudentCourseBean_H> comingSoonCourse = studentCourseService.getComingSoonCourseAll(id, nowDate);
		List<StudentCourseBean_H> waitCourse = studentCourseService.getWaitCourse(id, nowDate);
		List<StudentCourseBean_H> beforeCourse = studentCourseService.getBeforeCourse(id, nowDate);
		List<RatingsBean_H> ratings = studentCourseService.getRatings();
		
		
		
		
		model.addAttribute("comingSoonCourse", comingSoonCourse);
		model.addAttribute("waitCourse", waitCourse);
		model.addAttribute("beforeCourse", beforeCourse);
		model.addAttribute("ratings", ratings);
		
		
		
		return "_10_studentCourse/st_info_lesson";
	}
	
	
	
	@GetMapping("/CancelCourseLesson/{id}")
	public String cancelCourse(
			@PathVariable("id") Integer id, 
			@RequestParam(value="courseId") String courseIdStr, 
			@RequestParam(value="type") String type, 
			Model model) {
		int courseId = Integer.parseInt(courseIdStr);
		studentCourseService.cancelCourse(courseId);
		MoneyBean_H moneyBean_H1=new MoneyBean_H();
		MoneyBean_H moneyBean_H2=new MoneyBean_H();
		StudentCourseBean_H sc=studentCourseService.getStudentCourse(courseId);
		//學員取消課程通知(給教練)
		messageService.cancelMsgToTrainer(sc);
		Date date = new Date();
		java.sql.Date changeTime = new java.sql.Date(date.getTime());
		if(type.equals("waitCourse")) {

			//學員取消課程後要存進新的一筆退款
			StudentBean_H studentBean_H =(StudentBean_H) model.getAttribute("LoginOK");
			moneyBean_H1.setStudentBean_H(studentBean_H);
			moneyBean_H1.setChange_time(changeTime);
			moneyBean_H1.setChange_amount(sc.getTrainerCourseBean_H().getPrice());
			moneyBean_H1.setStudentCourseBean_H(sc);
			memPointService.saveStudentRefund(moneyBean_H1);
		}	else {
			//學員取消課程後要存進新的一筆退款
			StudentBean_H studentBean_H =(StudentBean_H) model.getAttribute("LoginOK");
			moneyBean_H1.setStudentBean_H(studentBean_H);
			moneyBean_H1.setChange_time(changeTime);
			moneyBean_H1.setChange_amount(sc.getTrainerCourseBean_H().getPrice());
			moneyBean_H1.setStudentCourseBean_H(sc);
			memPointService.saveStudentRefund(moneyBean_H1);

			//教練的費用要被扣回去
			TrainerBean_H trainerBean =sc.getTrainerCourseBean_H().getTrainerBean_H();
			moneyBean_H2.setTrainerBean_H(trainerBean);
			moneyBean_H2.setChange_time(changeTime);
			moneyBean_H2.setChange_amount(-sc.getTrainerCourseBean_H().getPrice());
			moneyBean_H2.setStudentCourseBean_H(sc);
			memPointService.saveTrainerRefund(moneyBean_H2);
		}
		
		
		System.out.println(type);
		model.addAttribute("type",type);
		return "redirect:/st_info_lesson/"+id;
	}
	
	@GetMapping("/st_feedback/{courseId}")
	public String feedback(
			@PathVariable("courseId") Integer courseId,
			Model model
			) {
		StudentCourseBean_H studentCourseBean_H = studentCourseService.getStudentCourse(courseId);
		model.addAttribute("studentCourseBean_H",studentCourseBean_H);
		return "_10_studentCourse/st_feedback";
	}
	
	@PostMapping("/addfeedback/{id}")
	public String addfeedback(
			@PathVariable("id") Integer id, 
			@RequestParam("starsVal") Integer starsVal,
			@RequestParam("feedback") String feedback,
			@RequestParam("studentCourseId") Integer studentCourseId
			) {
		StudentCourseBean_H studentCourseBean = studentCourseService.getStudentCourse(studentCourseId);
		TrainerBean_H trainerBean_H = memberDataService.getTrainerById(studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H().getId());
		
		studentCourseBean.setIs_rated(1);
		
		RatingsBean_H ratingsBean = new RatingsBean_H(null, studentCourseBean.getStudentBean_H(), studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H(), starsVal, feedback, studentCourseBean);
		
		studentCourseService.addFeedback(ratingsBean);
		
		List<RatingsBean_H> ratinglist = memberDataService.getTrainerRatings(studentCourseBean.getTrainerCourseBean_H().getTrainerBean_H().getId());	
		
		Double total=0.0;
		for (int i = 0; i < ratinglist.size(); i++) {
			total+= ratinglist.get(i).getPoint();
		}
	
		if(ratinglist.size() == 0) {
		Double avg = ((total) / 1.0);
		trainerBean_H.setRatings(avg);
		trainerBean_H.setRatings_size(ratinglist.size());;
		}else {
		Double avg = ((total) / (double)(ratinglist.size()));
		trainerBean_H.setRatings(avg);
		trainerBean_H.setRatings_size(ratinglist.size());;
		}
		
		memberDataService.updateTrainer(trainerBean_H);
		
		// 頁面跳轉改用jquery的post方法跳轉,這邊return的其實不會有反應,但反正要寫就對ㄌ
		
		return "redirect:/st_info_lesson/" + id;
	}
	
	@PostMapping("/addTrCourse/{id}")
	public @ResponseBody String addTrCourse(Model model, @PathVariable("id") Integer id,  @RequestParam("skillType") Integer skillType,
			@RequestParam("skill") String skill, @RequestParam("price") Integer price) {
			
		SkillBean_H skb = new SkillBean_H(null, skill);
		studentCourseService.addSkill(skb);
		TrainerBean_H tb = trainerCourseService.getTrainerById(id);
		SkillTypeBean_H stb = studentCourseService.getSkillTypeById(skillType);
		TrainerCourseBean_H tcb = new TrainerCourseBean_H(null, tb, skb, stb, price, 0);
		studentCourseService.addTrainerCourse(tcb);
		
		Gson gson = new Gson();
        String json = gson.toJson("ok");
		
		return json;		
	}
	
	@GetMapping("/delectCourse/{id}")
	public String delectCoursr(@PathVariable("id") Integer id , @RequestParam("trainerCourseId") Integer trainerCourseId) {
		trainerCourseService.delectCourse(trainerCourseId);
		return "redirect:/courseSet/"+id;
	}

}



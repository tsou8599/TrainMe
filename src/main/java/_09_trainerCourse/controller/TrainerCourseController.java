package _09_trainerCourse.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

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

import _01_register.dto.StudentInfo;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _07_memberInfo.service.StudentInfoService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.CloseHour;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _09_trainerCourse.model.TrainerOffBean_H;
import _09_trainerCourse.service.TrainerCourseService;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _12_message.service.MessageService;
import mail.model.SendingAcceptEmail;
import mail.model.SendingRejectedEmail;

@Controller
@SessionAttributes({ "LoginOK", "StudentCourse", "Now", "type"})
public class TrainerCourseController {

	@Autowired
	TrainerCourseService trainerCourseService;

	@Autowired
	StudentCourseService studentCourseService;

	@Autowired
	SearchTrainerService searchTrainerService;

	@Autowired
	MemberDataService memberDataService;
	
	
	@Autowired
	StudentInfoService studentInfoService;
	
	@Autowired
	MemPointService memPointService;
	
	@Autowired
	MessageService messageService;

	@GetMapping("/TimeOff/{id}")
	public String timeOff(Model model) {
		return "/_09_trainerCourse/timeOff";
	}

	@GetMapping("/courseSet/{id}")
	public String courseSet(Model model, @PathVariable("id") Integer id) {
		List<SkillTypeBean_H> skillTypeAll = searchTrainerService.getSkillTypeAll();
		List<TrainerCourseBean_H> TrainerCourseList = trainerCourseService.getTrainerCourseList(id);
		
		model.addAttribute("TrainerCourseList", TrainerCourseList);
		model.addAttribute("skillTypeAll", skillTypeAll);
		return "/_09_trainerCourse/tr_lesson_set";
	}

	@GetMapping("/TimeOff/getClosed/{id}")
	public @ResponseBody List<String> getTimeOff(@PathVariable("id") Integer id) {
		List<String> timeOff = trainerCourseService.queryTimeOffList(id);
		return timeOff;
	}

	@GetMapping("/TimeOff/getBooked/{id}")
	public @ResponseBody List<String> getBooked(@PathVariable("id") Integer id) {
		List<String> BookedTimes = trainerCourseService.queryBookedList(id);
		return BookedTimes;
	}
	
	@GetMapping("TimeOff/getStudentBooked/{stId}")
	public @ResponseBody List<String> getStudentBooked(@PathVariable("stId") Integer stId){
		List<String> studentBookedTimes = trainerCourseService.queryStudentBookList(stId);
		return studentBookedTimes;
	}

	@PostMapping(value ="/TimeOff/update/{id}")
	public @ResponseBody String updateTimeOff(@PathVariable("id") Integer id, @RequestParam("data") String data) {
		CloseHour closeHour = (new Gson()).fromJson(data, CloseHour.class);
		System.out.println(closeHour.getDateBegin());
		System.out.println(closeHour.getDateEnd());
		
		trainerCourseService.deleteTimeOff(closeHour.getDateBegin(), closeHour.getDateEnd(), id);

		for (String hour : closeHour.getCloseHour()) {
			String[] closeHourArr = hour.split("_");
			System.out.println(closeHourArr[0] + "===>" + closeHourArr[1]);
			Date date = null;
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateX = sdf.parse(closeHourArr[0]);
				date = new Date(dateX.getTime());

			} catch (Exception e) {
				e.getMessage();
			}

			TrainerOffBean_H tob = new TrainerOffBean_H(null, null, date, Integer.parseInt(closeHourArr[1]));
			trainerCourseService.saveTimeOff(tob, id);

		}
		Gson gson = new Gson();
        String json = gson.toJson("ok");
		
		return json;
		

	}

	@GetMapping("/trainerCourse/{id}")
	public String getTrainerCourse(Model model, @PathVariable("id") Integer id) {
		java.util.Date now = new java.util.Date();
		Date nowDate = new Date(now.getTime());
		List<StudentCourseBean_H> scSet = trainerCourseService.getTrainerCourseById(id);
		
		model.addAttribute("StudentCourse", scSet);
		model.addAttribute("Now", nowDate);
		return "/_09_trainerCourse/tr_course";
	}

	@GetMapping("/CancelStudentCourse/{trid}/{stid}")
	public String cancelCourse(Model model, @PathVariable("trid") Integer trid, @PathVariable("stid") Integer stid,
			@RequestParam("courseId") String courseIdStr,
			@RequestParam("type") String type) {
		int courseId = Integer.parseInt(courseIdStr);
		String stId = String.valueOf(stid);
		StudentBean_H sb = memberDataService.getStudentById(stid);
		
		//寄拒絕預約的信
		StudentCourseBean_H sc = studentCourseService.getStudentCourse(courseId);
		SendingRejectedEmail rejectedEmail=new SendingRejectedEmail(sb.getEmail(), sb.getName(), stId ,sc);
		rejectedEmail.sendingRejectedEmail();
		
		studentCourseService.cancelCourse(courseId);
		//傳送拒絕訊息給學員
		messageService.refuseMsg(sc);
		
		model.addAttribute("type", type);
		return "redirect:/trainerCourse/" + trid;
	}

	@GetMapping("/AllowStudentCourse/{trid}/{stid}")
	public String allowCourse(Model model, @PathVariable("trid") Integer trid, @PathVariable("stid") Integer stid,
			@RequestParam("courseId") String courseIdStr,
			@RequestParam("type") String type) {
		StudentBean_H sb = memberDataService.getStudentById(stid);
		String id = String.valueOf(stid);
		int courseId = Integer.parseInt(courseIdStr);
		StudentCourseBean_H sc=studentCourseService.getStudentCourse(courseId);
		MoneyBean_H moneyBean_H1=new MoneyBean_H();
		MoneyBean_H moneyBean_H2=new MoneyBean_H();
		java.util.Date date = new java.util.Date();
		java.sql.Date changeTime = new java.sql.Date(date.getTime());
		TrainerBean_H trainerBean_H=(TrainerBean_H)model.getAttribute("LoginOK");
		
		//寄同意信
		SendingAcceptEmail acceptEmail = new SendingAcceptEmail(sb.getEmail(), sb.getName(), id ,sc);
		acceptEmail.sendAcceptMail();
		
		//教練同意後money要新增一筆學員扣款
//		moneyBean_H1.setStudentBean_H(sb);
//		moneyBean_H1.setChange_time(changeTime);
//		moneyBean_H1.setChange_amount(-sc.getTrainerCourseBean_H().getPrice());
//		moneyBean_H1.setStudentCourseBean_H(sc);
//		memPointService.saveStudentRefund(moneyBean_H1);
		
		
		//money新增一筆教練費用
		moneyBean_H2.setTrainerBean_H(trainerBean_H);
		moneyBean_H2.setChange_time(changeTime);
		moneyBean_H2.setChange_amount(sc.getTrainerCourseBean_H().getPrice());
//		moneyBean_H2.setStudentCourseBean_H(sc);
		memPointService.saveTrainerRefund(moneyBean_H2);
		
		//如果要把studentcourse的bean設定進去,會有session衝突的問題,所以先註解掉
//		moneyBean_H1.setStudentCourseBean_H(sc);
//		memPointService.saveStudentCourseToMoney(moneyBean_H1);
		moneyBean_H2.setStudentCourseBean_H(sc);
		memPointService.saveStudentCourseToMoney(moneyBean_H2);
		
		studentCourseService.allowCourse(courseId);
		//傳送同意訊息給學員
		messageService.agreeMsg(sc);
		
		System.out.println("type=" + type);
		model.addAttribute("type", type);
		return "redirect:/trainerCourse/" + trid;
	}
	
	@GetMapping("/queryStudent")
	public @ResponseBody String queryStudent(Model model, @RequestParam("stId") Integer stId) {
		StudentBean_H sb = memberDataService.getStudentById(stId);
		StudentInfo info =  StudentInfo.create(sb);		

		Gson gson = new Gson();
        String json = gson.toJson(info);
		
		return json;
	}

}

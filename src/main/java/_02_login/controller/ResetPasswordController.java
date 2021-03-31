	package _02_login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_init.util.GlobalService;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

import _01_register.service.MemberService_H;

import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerValidator;
import _02_login.model.LoginBean;
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.SkillTypeBean_H;
import mail.model.SendingEmail_newpassword;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class ResetPasswordController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberDataService memberDataService;

	@Autowired
	MemberService_H memberService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	SearchTrainerService searchTrainerService;

	private static final Pattern Email_PATTERN = Pattern
			.compile("^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$");

//跳轉忘記密碼頁面
	@GetMapping("/ResetPassword")
	public String stPasswordUpdate(Model model) {

		
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();

		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("loginBean", loginBean);

		return "/_03_memberData/resetPassword";
	}
//讀取忘記密碼頁面
	@PostMapping("/resetPassword")
	public String resetPassword(@ModelAttribute("loginBean") LoginBean loginBean, BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("studentBean", studentBean);
		String useremail = loginBean.getUserEmail();
		String newpassword = getRandomString(6);
		String realpassword = GlobalService.getMD5Endocing(GlobalService.encryptString(newpassword));
		String message = "";
		String name = null;
		MemberBean_H mb = null;
		StudentBean_H sb = null;
		TrainerBean_H tb = null;

		try {
			if (useremail == null || !Email_PATTERN.matcher(useremail).matches()) {
				result.rejectValue("userEmail", "", "必須包含@符號，必須包含點，點和@之間必須有字元");
			} else {
				mb = memberService.checkEmail_H(useremail);
				if (mb != null) {
					if (mb instanceof TrainerBean_H) {
						tb = (TrainerBean_H) mb;
						tb.setPassword(realpassword);
						memberDataService.updateTrainer(tb);
						name = tb.getName();
					}

					if (mb instanceof StudentBean_H) {
						sb = (StudentBean_H) mb;
						sb.setPassword(realpassword);
						memberDataService.updateStudent(sb);
						name = sb.getName();
					}
				}
				SendingEmail_newpassword sn = new SendingEmail_newpassword(useremail, newpassword, name);
				sn.sendMail();
				message = "你的密碼已經重置，請確認你的信箱！";
			}
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			message = "There were an error: " + ex.getMessage();
		} finally {
			request.setAttribute("message", message);
		}
		return "/_03_memberData/resetPassword";
	}

// length為要求產生字符串的長度
	public static String getRandomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(62);
			sb.append(str.charAt(number));
		}
		return sb.toString();
	}
	@ModelAttribute
	public void commonData(Model model) {
		
		List<SkillTypeBean_H> skillTypeAll = searchTrainerService.getSkillTypeAll();
		List<City_H> cities = addressService.listCities();	
		Map<String, String> sexMap = new HashMap<>();
		Map<Integer, String> gymMap = new HashMap<>();
		List<GymBean_H> gymList = memberService.getGymList_H();
		for (GymBean_H gym : gymList) {
			gymMap.put(gym.getId(), gym.getName());
		}
		sexMap.put("M", "男");
		sexMap.put("F", "女");
		model.addAttribute("sexMap", sexMap);
		model.addAttribute("gymList", gymMap);
		model.addAttribute("cities", cities);	
		model.addAttribute("skillTypeAll", skillTypeAll);
	}
}

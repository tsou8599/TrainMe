package _04_money.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.util.GlobalService;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerValidator;
import _02_login.model.LoginBean;
import _04_money.model.CardBean;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;
import _04_money.service.MemPointService;
import _04_money.validate.CardValidator;
import mail.model.SendingEmail;
import mail.service.MailService;

@Controller
@SessionAttributes({ "LoginOK","AccountBean" }) // 此處有LoginOK的識別字串
public class AccountController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemPointService memPointService;
	


	

	@GetMapping("/trainerAccount/{id}")
	public String trainerAccount(Model model, @PathVariable("id") Integer id) {
		System.out.println("進入/trainerAccount/{id}的方法");
		List<TrainerAccountBean_H> account =memPointService.getAccountDetail(id);
		model.addAttribute("AccountBean", account);
		return "/_04_money/tr_bank";
	}
	
	@GetMapping("accountDetails/{id}")
	public String accountDetails(@PathVariable("id")Integer id,
			@RequestParam("date")Date date, Model model) {
		List<MoneyBean_H> trMonthPoint = memPointService.getMonthPoint(date, id);
		System.out.println("==================================>"+trMonthPoint);
		
		model.addAttribute("trMonthPoint", trMonthPoint);
		return "/_04_money/tr_point";
	}

}

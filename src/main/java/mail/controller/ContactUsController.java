package mail.controller;

import java.io.IOException;
import java.util.List;
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
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

import _01_register.service.MemberService_H;

import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerValidator;
import _02_login.model.LoginBean;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import mail.model.ContactBean;
import mail.model.SendingContactUsEmail;
import mail.model.SendingEmail_newpassword;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class ContactUsController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberDataService memberDataService;

	@Autowired
	MemberService_H memberService;

//讀取聯絡我們頁面
	@PostMapping("/contactUs")
	public String contactUs(@ModelAttribute("contactBean") ContactBean contactBean, Model model,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String username = contactBean.getUserName();
		String useremail = contactBean.getUserEmail();
		String q_category = contactBean.getQ_category();
		String subject = contactBean.getSubject();
		String message = contactBean.getMessage();
	
		SendingContactUsEmail scue = new SendingContactUsEmail(username, useremail, q_category, subject, message);
		scue.sendMail();
		
		return "redirect:/";
	}


}

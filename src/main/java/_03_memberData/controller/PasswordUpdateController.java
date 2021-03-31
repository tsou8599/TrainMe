package _03_memberData.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import _01_register.validate.StudentPasswordUpdateValidator;
import _01_register.validate.StudentValidator;
import _01_register.validate.TrainerPasswordUpdateValidator;
import _01_register.validate.TrainerValidator;
import _03_memberData.service.MemberDataService;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class PasswordUpdateController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberDataService memberDataService;

	@Autowired
	MemberService_H memberService;

	@Autowired
	StudentPasswordUpdateValidator st_validator;

	@Autowired
	TrainerPasswordUpdateValidator tr_validator;

//跳轉學員修改密碼頁面
	@GetMapping("/st_PasswordUpdate/{id}")
	public String stPasswordUpdate(Model model, @PathVariable("id") Integer id) {

		StudentBean_H studentBean = memberDataService.getStudentById(id);

		model.addAttribute("studentBean", studentBean);
		model.addAttribute("LoginOK", studentBean);

		return "/_03_memberData/st_passwordUpdate";
	}

//跳轉教練修改密碼頁面
	@GetMapping("/tr_PasswordUpdate/{id}")
	public String trPasswordUpdate(Model model, @PathVariable("id") Integer id) {

		TrainerBean_H trainerBean = memberDataService.getTrainerById(id);

		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("LoginOK", trainerBean);

		return "/_03_memberData/tr_passwordUpdate";
	}

//讀取學員修改密碼頁面
	@PostMapping("/updateStPassword/{id}")
	public String updateStPassword(@ModelAttribute("studentBean") StudentBean_H newBean, BindingResult result,
			Model model, @PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) {

		st_validator.validate(newBean, result);

		StudentBean_H oldBean = memberDataService.getStudentById(id);

		MemberBean_H mb = null;

		mb = memberService.checkOldPassword_H(oldBean.getEmail(),
				GlobalService.getMD5Endocing(GlobalService.encryptString(newBean.getOldpassword())));
		if (mb == null) {
			result.rejectValue("oldpassword", "", "該密碼不存在");
		} else if (!result.hasErrors()) {
			try {
				oldBean.setPassword(
						GlobalService.getMD5Endocing(GlobalService.encryptString(newBean.getNewpassword())));
				memberDataService.updateStudent(oldBean);
				return "redirect:/studentData/" + id;
			} catch (RuntimeException ex) {
				result.rejectValue("oldpassword", "", ex.getMessage());
				ex.printStackTrace();
			}
		}
		return "/_03_memberData/st_passwordUpdate";

	}

//讀取教練修改密碼頁面
	@PostMapping("/updateTrPassword/{id}")
	public String updateTrPassword(@ModelAttribute("trainerBean") TrainerBean_H newBean, BindingResult result,
			Model model, @PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) {

		tr_validator.validate(newBean, result);

		TrainerBean_H oldBean = memberDataService.getTrainerById(id);

		MemberBean_H mb = null;

		mb = memberService.checkOldPassword_H(oldBean.getEmail(),
				GlobalService.getMD5Endocing(GlobalService.encryptString(newBean.getOldpassword())));
		if (mb == null) {
			result.rejectValue("oldpassword", "", "該密碼不存在");
		} else if (!result.hasErrors()) {
			try {
				oldBean.setPassword(
						GlobalService.getMD5Endocing(GlobalService.encryptString(newBean.getNewpassword())));
				memberDataService.updateTrainer(oldBean);
				return "redirect:/trainerData/" + id;

			} catch (RuntimeException ex) {
				result.rejectValue("oldpassword", "", ex.getMessage());
				ex.printStackTrace();
			}
		}

		return "/_03_memberData/tr_passwordUpdate";
	}

}

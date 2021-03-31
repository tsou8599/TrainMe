package _01_register.controller;

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
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.MemberDataService;
import _04_money.model.MoneyBean_H;
import _04_money.service.MemPointService;
import _08_searchTrainer.service.SearchTrainerService;
import _09_trainerCourse.model.RatingsAvgBean_H;
import _09_trainerCourse.model.RatingsBean_H;
import _09_trainerCourse.model.SkillTypeBean_H;
import _09_trainerCourse.model.TrainerCourseBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _10_studentCourse.service.StudentCourseService;
import _12_message.service.MessageService;
import mail.model.ContactBean;
import mail.model.SendingEmail;
import mail.service.MailService;

@Controller
@SessionAttributes({ "LoginOK", "MoneyBean" , "tr_email", "st_email" }) // 此處有LoginOK的識別字串
public class RegisterController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberService_H memberService;

	@Autowired
	StudentValidator st_validator;

	@Autowired
	TrainerValidator tr_validator;

	@Autowired
	MailService mailService;
	
	@Autowired
	MemPointService memPointService;
	
	@Autowired
	SearchTrainerService searchTrainerService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	MemberDataService memberDataService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	StudentCourseService studentCourseService;

	@GetMapping("/")
	public String index(Model model) {
		
//		因為index頁面內就有註冊功能，內有連結了3個Bean的3個form，本方法如果沒有加入這3個Bean就會報錯
//		(可能是因為View元件(index)有要顯示的東西(那3個表單)所以一定要把有的東西都加入model裡)		
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		GymBean_H gymBean = new GymBean_H();
		LoginBean loginBean = new LoginBean();
		StudentCourseBean_H studentCourseBean = new StudentCourseBean_H();
		
		//首頁人氣教練推薦		
		List<TrainerCourseBean_H> trainerAndCourse = memberDataService.getTrainerAndCourse();
		
		//顯示首頁TraineMe的成長數量
		Long trainerTotal = memberService.queryTrainerTotal();
	    Long studentTotal = memberService.queryStudentTotal();
	    Long gymTotal = memberService.queryGymTotal();
	    Long StudentCourseTotal = studentCourseService.queryCourseTotal();
	    trainerBean.setTrainerTotal(trainerTotal);
	    studentBean.setStudentTotal(studentTotal);
	    gymBean.setGymTotal(gymTotal);
	    studentCourseBean.setStudentCourseTotal(StudentCourseTotal);
	    
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("gymBean", gymBean);
		model.addAttribute("loginBean", loginBean);				
		model.addAttribute("trainerAndCourse", trainerAndCourse);	
		model.addAttribute("contactBean" , new ContactBean());
		model.addAttribute("studentCourseBean" , studentCourseBean);

		return "index";
	}

//	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	// 學員註冊
	@PostMapping("/st_register")
	// 此時使用者(在JSP)填寫的內容在這裡傳入↓
	public String stRegister(@ModelAttribute("studentBean") StudentBean_H studentBean, BindingResult result,
			Model model, HttpServletRequest request) {
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();

		// 呼叫Validate進行資料檢查
		st_validator.validate(studentBean, result);
		
		// 當有錯誤時的處理，呼叫寫在本類別的errorResponseSt方法()，把原本的內容studentBean跟Model傳入
		if (result.hasErrors()) {
			errorResponseSt(studentBean, model);
			
			// 資料有誤，導回首頁
			return "index";

		}
		
		// 加密使用者註冊的密碼
		studentBean.setPassword(GlobalService.getMD5Endocing(GlobalService.encryptString(studentBean.getPassword())));

		// 檢查 email是否重複
		if (memberService.idExists_H(studentBean.getEmail())) {
			result.rejectValue("email", "", "帳號已存在，請重新輸入");
			errorResponseSt(studentBean, model);
			return "index";
		}

		// 檢查身分證是否已經存在
		if (memberService.idNumberExists_H(studentBean.getId_number())) {
			result.rejectValue("id_number", "", "此身分證已經使用過囉");
			errorResponseSt(studentBean, model);
			return "index";

		}
		
		
		// 檢查無錯誤
		try {
			
			// 產生寄驗證信用的亂碼
			Random theRandom = new Random();
			theRandom.nextInt(999999);
			studentBean.setHash(DigestUtils.md5Hex("" + theRandom));
			
			// 原來的table有塞預設值(bean),但是hibernate的save()方法會把沒有填資料的欄位都設為null,所以要在這裡再塞一次預設資料
			studentBean.setType(1);
			studentBean.setVerification(0);
			studentBean.setIs_delete(0);
			
			// 儲存新會員
			memberService.saveStudent_H(studentBean);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("email", "", "發生異常，請通知系統人員..." + ex.getMessage());
			errorResponseSt(studentBean, model);

		}
		
//		StudentBean_H sb = memberDataService.getStudentById(studentBean.getId());
//		Integer id = sb.getId();
		// 寄驗證信
		SendingEmail se = new SendingEmail(1, studentBean.getEmail(), studentBean.getHash(), studentBean.getName());
		se.sendMail();
		
		//產生註冊成功通知
		messageService.passVerification(studentBean);
		
		model.addAttribute("st_email", studentBean);
		
		model.addAttribute("studentBean", new StudentBean_H());
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute("contactBean" , new ContactBean());

		// 伺服器通知客戶端對新網址發出請求。其原本參數狀態不被保留。
		// 所以如果只用"index"跳轉後網址會有/tr_register
//		return "redirect:/";
		return "redirect:/registerMessage";
	}

	// 當有錯誤時的處理 - 學員
//	因為傳進來的是已經帶有資料的studentBean,所以不需要加@ModelAttribute("studentBean")
	public void errorResponseSt(StudentBean_H studentBean, Model model) {
		TrainerBean_H trainerBean = new TrainerBean_H();
		LoginBean loginBean = new LoginBean();
		studentBean.setHasError(true);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute("contactBean" , new ContactBean());

	}
	
//	註冊成功跳轉頁面
	@GetMapping("registerMessage")
	public String registerMessage(Model model) {
		
		model.addAttribute("studentBean",new StudentBean_H());
		model.addAttribute("trainerBean",new TrainerBean_H());
		model.addAttribute("loginBean",new LoginBean());
		model.addAttribute("contactBean" , new ContactBean());
		
	return "_01_register/rd_register_message";
	}

//	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	// 教練註冊
	@PostMapping("/tr_register")
	public String trRegister(@ModelAttribute("trainerBean") TrainerBean_H trainerBean, BindingResult result,
			Model model, HttpServletRequest request) {
		StudentBean_H studentBean = new StudentBean_H();
		LoginBean loginBean = new LoginBean();

		// 呼叫Validate進行資料檢查
		tr_validator.validate(trainerBean, result);
		if (result.hasErrors()) {
			errorResponseTr(trainerBean, model);
			return "index";
		}
		trainerBean.setPassword(GlobalService.getMD5Endocing(GlobalService.encryptString(trainerBean.getPassword())));

		// 檢查 email是否重複
		if (memberService.idExists_H(trainerBean.getEmail())) {
			result.rejectValue("email", "", "帳號已存在，請重新輸入");
			errorResponseTr(trainerBean, model);
			return "index";
		}

		// 檢查身分證是否已經存在
		if (memberService.idNumberExists_H(trainerBean.getId_number())) {
			result.rejectValue("id_number", "", "此身分證已經使用過囉");
			errorResponseTr(trainerBean, model);
			return "index";
		}

		System.out.println(memberService.checkverification_H(trainerBean.getGym().getId()));
		if (memberService.checkverification_H(trainerBean.getGym().getId()) != trainerBean.getGympassword()) {
			result.rejectValue("gympassword", "", "驗證碼錯誤");
			errorResponseTr(trainerBean, model);
			return "index";
		}

		try {
			// 檢查無錯誤

			Random theRandom = new Random();
			theRandom.nextInt(999999);
			trainerBean.setHash(DigestUtils.md5Hex("" + theRandom));
			
			trainerBean.setType(2);
			trainerBean.setVerification(0);
			trainerBean.setIs_delete(0);
			trainerBean.setRatings(0.0);
			
			
			memberService.saveTrainer_H(trainerBean);
			
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("email", "", "發生異常，請通知系統人員...");
			errorResponseTr(trainerBean, model);
			return "index";
		}
		
//		TrainerBean_H tb = memberDataService.getTrainerById(trainerBean.getId());
//		Integer id = tb.getId();

		// 寄驗證信
		SendingEmail se = new SendingEmail(2, trainerBean.getEmail(), trainerBean.getHash(), trainerBean.getName());
		se.sendMail();
		
		//產生註冊成功通知
		messageService.passVerification(trainerBean);

		model.addAttribute("tr_email", trainerBean);
		
		model.addAttribute("trainerBean", new TrainerBean_H());
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute("contactBean" , new ContactBean());
		
		return "redirect:/registerMessage";
	}

	// 當有錯誤時的處理 - 教練
	public void errorResponseTr(TrainerBean_H trainerBean, Model model) {
		StudentBean_H studentBean = new StudentBean_H();
		LoginBean loginBean = new LoginBean();
		trainerBean.setHasError(true);
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute("contactBean" , new ContactBean());

	}

	// 驗證信
	@GetMapping("/ActivateAccount")
	public String activate(HttpServletRequest request, Model model) {

		String type = request.getParameter("key");
		String email = request.getParameter("key1");
		String hash = request.getParameter("key2");

		try {
			mailService.changeVerification(type, email, hash);

		} catch (Exception e) {
			e.printStackTrace();
			return index(model);
		}
		System.out.println("Account Successfully Verified.");

		return "_01_register/verifiedSuccessPage";

	}

	@PostMapping("/login")
				// 此時使用者(在JSP)填寫的內容在這裡傳入↓
	public String Login(@ModelAttribute("loginBean") LoginBean loginBean, BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		MemberBean_H mb = null;
		StudentBean_H sb = null;
		TrainerBean_H tb = null;
		List<TrainerCourseBean_H> trainerAndCourse = memberDataService.getTrainerAndCourse();
		
		//顯示首頁TraineMe的成長數量
		TrainerBean_H trainerBean = new TrainerBean_H();
		StudentBean_H studentBean = new StudentBean_H();
		GymBean_H gymBean = new GymBean_H();
	    StudentCourseBean_H studentCourseBean = new StudentCourseBean_H();
	    
		Long trainerTotal = memberService.queryTrainerTotal();
	    Long studentTotal = memberService.queryStudentTotal();
	    Long gymTotal = memberService.queryGymTotal();
	    Long StudentCourseTotal = studentCourseService.queryCourseTotal();
	    
	    trainerBean.setTrainerTotal(trainerTotal);
		studentBean.setStudentTotal(studentTotal);
		gymBean.setGymTotal(gymTotal);
		studentCourseBean.setStudentCourseTotal(StudentCourseTotal);
		
		try {
			mb = memberService.checkIdPassword_H(loginBean.getUserEmail(),
					// 取得使用者輸入的密碼加密比對
					GlobalService.getMD5Endocing(GlobalService.encryptString(loginBean.getPassword())));

			// 判斷該會員是教練ㄇ
			if (mb != null) {

				if (mb instanceof TrainerBean_H) {
					
					// 轉成TrainerBean_H物件以使用其方法
					tb = (TrainerBean_H) mb;
					// 檢查是否通過信箱驗證
					if (memberService.checkPass(tb.getType(), tb.getEmail())) {
						
						// 登入成功, 把該會員tb登記為LoginOK登入狀態→存進LoginOK
						// OK, 登入成功, 將tb物件放入Session範圍內，識別字串為"LoginOK",此時其他頁面的控制器只要有"LoginOK"就能接到此會員的資料
						model.addAttribute("LoginOK", tb);
						
						//取得未讀訊息數量
						Long unreadMessage = messageService.unreadMessage(tb.getId(), tb.getType());
						model.addAttribute("tr_unreadMessage", unreadMessage);
					} else {
						result.rejectValue("userEmail", "", "帳號尚未通過信箱驗證");
						
						// 當有錯誤時的處理，呼叫寫在本類別的errorResponseLg方法()，把原本的內容loginBean跟Model傳入
						errorResponseLg(loginBean, model);
					}
				}

				// 判斷該會員是學員ㄇ
				if (mb instanceof StudentBean_H) {
					sb = (StudentBean_H) mb;				
					if (memberService.checkPass(sb.getType(), sb.getEmail())) {
						// OK, 登入成功, 將sb物件放入Session範圍內，識別字串為"LoginOK"
						model.addAttribute("LoginOK", sb);
						
						
						List<MoneyBean_H> money =memPointService.getStudentMoneyDetail(sb.getId());
						model.addAttribute("MoneyBean", money);
					} else {
						result.rejectValue("userEmail", "", "帳號尚未通過信箱驗證");
						errorResponseLg(loginBean, model);
					}
				}

			} else {
				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
				result.rejectValue("userEmail", "", "該帳號不存在或密碼錯誤");
				errorResponseLg(loginBean, model);
			}

		} catch (RuntimeException ex) {
			result.rejectValue("userEmail", "", ex.getMessage());
			ex.printStackTrace();
			errorResponseLg(loginBean, model);
		}

		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerAndCourse", trainerAndCourse);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute("contactBean" , new ContactBean());
		model.addAttribute("gymBean", gymBean);
		model.addAttribute("studentCourseBean" , studentCourseBean);
		return "index";
	}

	// 當有錯誤時的處理 - 登入
	public void errorResponseLg(LoginBean loginBean, Model model) {
		StudentBean_H studentBean = new StudentBean_H();
		TrainerBean_H trainerBean = new TrainerBean_H();
		loginBean.setHasError(true);
		model.addAttribute("studentBean", studentBean);
		model.addAttribute("trainerBean", trainerBean);

	}

	// 登出
	@RequestMapping("/logout")
	public String logout(
			HttpSession session, 
			Model model, 
			SessionStatus status, // 要移除屬性物件一定要加這行
			RedirectAttributes redirectAtt) {
		MemberBean_H memberBean = (MemberBean_H) model.getAttribute("LoginOK");
		status.setComplete(); // 移除@SessionAttributes({"LoginOK"}) 標示的屬性物件!!!!!!!!!!!!!!!!!!!!!!
		session.invalidate(); // 此敘述不能省略 ( 讓 session 立刻失效 )
		
		model.addAttribute("studentBean",new StudentBean_H());
		model.addAttribute("trainerBean",new TrainerBean_H());
		model.addAttribute("loginBean",new LoginBean());
		return "redirect:/"; 

		
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

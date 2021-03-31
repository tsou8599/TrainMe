package _03_memberData.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _01_register.service.MemberService_H;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.GymService;
import _03_memberData.service.MemberDataService;



@Controller
@SessionAttributes({ "LoginOK","gym","trainerLicenseBean"}) // 此處有LoginOK的識別字串
public class TrInfoAccountContoller {

	@Autowired
	ServletContext servletContext;

	@Autowired
	MemberDataService memberDataService;
	
	@Autowired
	GymService gymService;
	
	@Autowired
	MemberService_H memberService;

	@GetMapping("/tr_info_account/{id}")
	public String trainerData(Model model, @PathVariable("id") Integer id) {
		
		TrainerBean_H trainerBean = memberDataService.getTrainerById(id);
		List<TrainerLicenseBean_H> trainerLicenseBean = memberService.checkTrainerLicense_H(id);
		GymBean_H gym =  gymService.getGym(trainerBean.getGym().getId());
		model.addAttribute("gym", gym);
		
	    model.addAttribute("trainerLicenseBean", trainerLicenseBean);
		model.addAttribute("trainerBean", trainerBean);
		model.addAttribute("LoginOK", trainerBean);
		return "/_03_memberData/tr_info_account";
	}

	@PostMapping("/updateTrInfoAccount/{id}")
	public String updateTrainerData(@ModelAttribute("trainerBean") TrainerBean_H newBean, Model model,
			@PathVariable("id") Integer id, HttpServletRequest request) throws IOException, ServletException {

		TrainerBean_H oldBean = memberDataService.getTrainerById(id);

		oldBean.setYear(newBean.getYear());
		oldBean.setCourse(newBean.getCourse());
		oldBean.setIntroduction(newBean.getIntroduction());
		
		// 圖片處理
		MultipartFile picture = newBean.getTrainerImage(); // 圖片本人
		String originalFilename = picture.getOriginalFilename(); // 圖片的檔名
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			oldBean.setProfile_image("profile_photo/trainer/" + id + "/" + originalFilename); // 將檔名存入資料庫
		}
		// 將圖片存入資料夾
		String folderPath = String
				.format("C:/_TraineMe/workspace/TrainMe_springMVC/src/main/webapp/images/profile_photo/trainer/%s", id);
		File theDir = new File(folderPath);
		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		try (InputStream in = picture.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);

			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 影片處理
		MultipartFile video = newBean.getTrainerVideo(); // 圖片本人
		System.out.println(video);
		String originalFilename_video = video.getOriginalFilename(); // 圖片的檔名
		if (originalFilename_video.length() > 0 && originalFilename_video.lastIndexOf(".") > -1) {
			oldBean.setProfile_video("profile_video/trainer/" + id + "/" + originalFilename_video); // 將檔名存入資料庫
		}
		// 將影片存入資料夾
		String folderPath_video = String
				.format("C:/_TraineMe/workspace/TrainMe_springMVC/src/main/webapp/images/profile_video/trainer/%s", id);
		File theDir_video = new File(folderPath_video);
		if (!theDir_video.exists()) {
			theDir_video.mkdirs();
		}

		try (InputStream in = video.getInputStream();
				OutputStream out = new FileOutputStream(folderPath_video + "/" + originalFilename_video)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);

			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		memberDataService.updateTrainer(oldBean);
		return "redirect:/tr_info_account/" + id;
	}
	 @PostMapping("/addLicense")
	 public String addLicense(@RequestParam("lsname") String lsname, @RequestParam("trainerBeanId") int trainerBeanId) {
	 TrainerLicenseBean_H trainerLicenseBean_H = new TrainerLicenseBean_H();
	 TrainerBean_H tb = memberDataService.getTrainerById(trainerBeanId);
	 trainerLicenseBean_H.setName(lsname);
	 trainerLicenseBean_H.setTrainerBean_H(tb);
	 memberService.saveTrainerLicenseBean_H(trainerLicenseBean_H);
	 return "redirect:/tr_info_account/" + trainerBeanId;
	 }
	 
	 @GetMapping("/delLicense/{tr_id}/{id}")
	 public String delLicense(Model model, @PathVariable("tr_id") Integer tr_id, @PathVariable("id") Integer id) {
		memberService.delTrainerLicense_H(id);
		
		 return "redirect:/tr_info_account/" + tr_id;
	 }

}

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

import _01_register.model.StudentBean_H;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;
import _03_memberData.service.AddressService;
import _03_memberData.service.MemberDataService;

@Controller
@SessionAttributes({ "LoginOK" }) // 此處有LoginOK的識別字串
public class StudentDataContoller {

	@Autowired
	ServletContext servletContext;

	@Autowired
	AddressService addressService;

	@Autowired
	MemberDataService memberDataService;

	@GetMapping("/studentData/{id}")
	public String studentData(Model model, @PathVariable("id") Integer id) {
		
		StudentBean_H studentBean = memberDataService.getStudentById(id);
		if (studentBean.getCity() != null) {
			List<Area_H> areas = addressService.listAreas(studentBean.getCity().getId());
			Map<Integer, String> areaMap = new HashMap<>();
			for (Area_H area : areas) {
				areaMap.put(area.getId(), area.getName());
			}
			model.addAttribute("areaList", areaMap);
		}

		model.addAttribute("studentBean", studentBean);
		model.addAttribute("LoginOK", studentBean);
		return "/_03_memberData/studentData";
	}
	
	

	@GetMapping("/areaList")
	public @ResponseBody List<Area_H> getAreaList(Model model, @RequestParam Integer cityId) {
		List<Area_H> areas = addressService.listAreas(cityId);

		return areas;
	}

	@PostMapping("/updateStData/{id}")
	public String updateStudentData(@ModelAttribute("studentBean") StudentBean_H newBean, Model model,
			@PathVariable("id") Integer id, HttpServletRequest request) throws IOException, ServletException {

		StudentBean_H oldBean = memberDataService.getStudentById(id);

//		System.out.println("=========================>" + newBean.getCity().getId());
		oldBean.setPhone(newBean.getPhone());
		oldBean.setNickname(newBean.getNickname());
		oldBean.setCity(newBean.getCity());
		oldBean.setArea(newBean.getArea());
		oldBean.setAddress(newBean.getAddress());
		// 圖片處理
		MultipartFile picture = newBean.getStudentImage(); // 圖片本人
		String originalFilename = picture.getOriginalFilename(); // 圖片的檔名
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			oldBean.setProfile_image("profile_photo/student/" + id + "/" + originalFilename); // 將檔名存入資料庫
		}
		// 將圖片存入資料夾
		String folderPath = String
				.format("C:/_TraineMe/workspace/TrainMe_springMVC/src/main/webapp/images/profile_photo/student/%s", id);
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

		memberDataService.updateStudent(oldBean);
		return "redirect:/studentData/" + id;
	}

	@ModelAttribute
	public void commonData(Model model) {
		List<City_H> cities = addressService.listCities();
		Map<Integer, String> citiesMap = new HashMap<>();
		for (City_H city : cities) {
			citiesMap.put(city.getId(), city.getName());
		}
		model.addAttribute("cityList", citiesMap);

	}

}

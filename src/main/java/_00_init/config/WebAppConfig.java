package _00_init.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Configuration
@EnableWebMvc
@ComponentScan({ "_00_init","_01_register","_02_login","_03_memberData","_04_money"
	,"_07_memberInfo","_08_searchTrainer","_09_trainerCourse","_10_studentCourse","mail"
	,"_12_message","_13_addfavorite"})
public class WebAppConfig implements WebMvcConfigurer {
	
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		//  /WEB-INF/views/welcome.jsp → 視圖的真實位置
		resolver.setPrefix("/WEB-INF/views/");   //  前導字
		resolver.setSuffix(".jsp");             // 後贅字
		return resolver;
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
		resource.setBasename("messages");
		return resource;
	}
	
	// 找靜態資源
//	@Override 
//	// 應用系統必須透過ResourceHandlerRegistry的輔助，以便處理靜態檔案：
//	// 只要請求路徑是以/css/開頭的任何請求，都轉到/WEB-INF/views/css/去尋找
//	// 只要請求路徑是以/images/開頭的任何請求，都轉到/WEB-INF/views/images/去尋找
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//	     registry.addResourceHandler("/css/**")
//	             .addResourceLocations("/WEB-INF/views/css/");
//	     registry.addResourceHandler("/images/**")
//	             .addResourceLocations("/WEB-INF/views/images/");
//	}
	
	// 找靜態資源
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		
		configurer.enable();
	}
	
	// 上傳檔案
		@Bean
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver resolver = new CommonsMultipartResolver();
			resolver.setDefaultEncoding("UTF-8");
			resolver.setMaxUploadSize(81920000);
			return resolver;
		}
	
	

}

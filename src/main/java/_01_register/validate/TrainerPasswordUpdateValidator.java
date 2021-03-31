package _01_register.validate;

import java.util.regex.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;


@Component
@Scope("prototype")
public class TrainerPasswordUpdateValidator implements Validator {
	
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("((?=.*\\d)(?=.*[a-z]).{6,})");
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TrainerBean_H.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "trainerBean.name.empty", "姓名欄位不正確");
//		ValidationUtils.rejectIfEmpty(errors, "password", "trainerBean.password.empty", "密碼欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "passwordcheck", "trainerBean.passwordcheck.empty", "密碼確認欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "phone", "trainerBean.phone.empty", "電話欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "email", "trainerBean.email.empty", "email欄不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "id_number", "trainerBean.id_number.empty", "身分證欄位不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "gympassword", "trainerBean.gympassword.empty", "健身房驗證碼不能空白");

		TrainerBean_H tb = (TrainerBean_H) target;
		
		if (tb.getNewpassword() != null  && !PASSWORD_PATTERN.matcher(tb.getNewpassword()).matches()) {
			errors.rejectValue("newpassword", "studentBean.password.space", "密碼至少含有一個小寫字母，且長度不能小於六個字元");
		}	
		
		if (tb.getNewpasswordcheck() != null && tb.getNewpassword() != null && !tb.getNewpasswordcheck().equals(tb.getNewpassword())
		) {
			errors.rejectValue("newpasswordcheck", "studentBean.password.mustEqual", "新密碼欄位並須和新密碼確認一致");
		}
		

	}

}

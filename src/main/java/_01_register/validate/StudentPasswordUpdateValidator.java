package _01_register.validate;

import java.util.regex.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import _01_register.model.StudentBean_H;


@Component
@Scope("prototype")
public class StudentPasswordUpdateValidator implements Validator {
	
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("((?=.*\\d)(?=.*[a-z]).{6,})");
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return StudentBean_H.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "studentBean.name.empty", "姓名欄位不正確");
//		ValidationUtils.rejectIfEmpty(errors, "password", "studentBean.password.empty", "密碼欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "passwordcheck", "studentBean.passwordcheck.empty", "密碼確認欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "phone", "studentBean.phone.empty", "電話欄位不能為空白");
//		ValidationUtils.rejectIfEmpty(errors, "email", "studentBean.email.empty", "email欄不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "id_number", "studentBean.id_number.empty", "身分證欄位不能空白");

		StudentBean_H sb = (StudentBean_H) target;
		
		if (sb.getNewpassword() != null && !PASSWORD_PATTERN.matcher(sb.getNewpassword()).matches()) {
			errors.rejectValue("newpassword", "studentBean.password.space", "密碼至少含有一個小寫字母，且長度不能小於六個字元");
		}	
		
		if (sb.getNewpasswordcheck() != null && sb.getNewpassword() != null && !sb.getNewpasswordcheck().equals(sb.getNewpassword())
		) {
			errors.rejectValue("newpasswordcheck", "studentBean.password.mustEqual", "新密碼欄位並須和新密碼確認一致");
		}

	}

}

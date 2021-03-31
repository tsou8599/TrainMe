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
public class TrainerValidator implements Validator {
	
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("((?=.*\\d)(?=.*[a-z]).{6,})");
	private static final Pattern Email_PATTERN = Pattern.compile("^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$");
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return TrainerBean_H.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "trainerBean.name.empty", "姓名欄位不正確");
		ValidationUtils.rejectIfEmpty(errors, "password", "trainerBean.password.empty", "密碼欄位不能為空白");
		ValidationUtils.rejectIfEmpty(errors, "passwordcheck", "trainerBean.passwordcheck.empty", "密碼確認欄位不能為空白");
		ValidationUtils.rejectIfEmpty(errors, "phone", "trainerBean.phone.empty", "電話欄位不能為空白");
		ValidationUtils.rejectIfEmpty(errors, "email", "trainerBean.email.empty", "email欄不能空白");
		ValidationUtils.rejectIfEmpty(errors, "id_number", "trainerBean.id_number.empty", "身分證欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "gympassword", "trainerBean.gympassword.empty", "健身房驗證碼不能空白");

		TrainerBean_H tb = (TrainerBean_H) target;

		if (tb.getName() != null && tb.getName().length() < 1 || tb.getName().length() > 30) {
			errors.rejectValue("name", "trainerBean.name.size", "姓名欄位格式不正確");
		}
		
		if (tb.getPassword() != null  && !PASSWORD_PATTERN.matcher(tb.getPassword()).matches()) {
			errors.rejectValue("password", "trainerBean.password.space", "密碼至少含有一個小寫字母，且長度不能小於六個字元");
		}
		
		if (tb.getPasswordcheck() != null && tb.getPassword() != null && !tb.getPasswordcheck().equals(tb.getPassword())
		) {
			errors.rejectValue("passwordcheck", "trainerBean.password.mustEqual", "密碼欄位並須和密碼確認一致");
		}
		
		if (tb.getEmail() == null || !Email_PATTERN.matcher(tb.getEmail()).matches()) {
			errors.rejectValue("email", "trainerBean.email.invalid", "必須包含@符號，必須包含點，點和@之間必須有字元");
		}
		
		if (tb.getBirthday() == null) {
			errors.rejectValue("birthday", "trainerBean.birthday", "生日欄位必須輸入");
		}
		if (tb.getSex() == null) {
			errors.rejectValue("sex", "trainerBean.sex", "性別欄位必須輸入");
		}
		
		
		if (!(tb.getGympassword() instanceof Integer )) {
			errors.rejectValue("gympassword", "trainerBean.gympassword", "此攔位必須輸入數字");
		}


	}

}

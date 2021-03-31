package _04_money.validate;

import java.util.regex.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import _01_register.model.StudentBean_H;
import _04_money.model.CardBean;


@Component
@Scope("prototype")
public class CardValidator implements Validator {
	
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("((?=.*\\d)(?=.*[a-z]).{6,})");
	private static final Pattern Email_PATTERN = Pattern.compile("^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$");
	private static final Pattern TEL_PATTERN = Pattern.compile("^[0-9]*$");

	
	@Override
	public boolean supports(Class<?> clazz) {
		return StudentBean_H.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		

		CardBean cb = (CardBean) target;
		String cardNum=cb.getCardNo1()+cb.getCardNo2()+cb.getCardNo3()+cb.getCardNo4();
		
		
//		if (cb.getName() != null && cb.getName().length() < 1 || cb.getName().length() > 5) {
//			errors.rejectValue("name", "", "姓名欄位格式不正確");
//		}

		if (cardNum.length() != 16 ||!TEL_PATTERN.matcher(cardNum).matches()) {
			errors.rejectValue("cardNo1", "", "信用卡欄位不正確");
		}
//		if ((cb.getCardNo1().length() != 16)){
//			errors.rejectValue("cardNo1", "", "信用卡欄位不完整");
//		}
//		if (cb.getExpiryMonth().equals("-1") && !cb.getExpiryYear().equals("-1"))
//		 {
//			errors.rejectValue("expiryMonth", "", "請選擇到期月份");
//		}
//		if (cb.getExpiryYear().equals("-1") && !cb.getExpiryMonth().equals("-1"))
//		 {
//			errors.rejectValue("expiryMonth", "", "請選擇到期年份");
//		}
		if (cb.getExpiryMonth().length()!=4 ||!TEL_PATTERN.matcher(cb.getExpiryMonth()).matches())
		 {
			errors.rejectValue("expiryMonth", "", "到期月份及年份不完整");
		}
		if (cb.getCardCVV().length()<3)
		 {
			errors.rejectValue("cardCVV", "", "CVV欄位不完整");
		}
		if (cb.getCardName().length() > 25  || TEL_PATTERN.matcher(cb.getCardName()).matches()) {
			errors.rejectValue("cardName", "", "姓名欄位格式不正確");
		}
		if (!TEL_PATTERN.matcher(cb.getTel()).matches()) {
			errors.rejectValue("tel", "", "電話欄位只能為數字");
		}
		if (!Email_PATTERN.matcher(cb.getEmail()).matches()) {
			errors.rejectValue("email", "", "必須包含@符號，必須包含點，點和@之間必須有字元");
		}
//		
//		if (st.getBirthday() == null) {
//			errors.rejectValue("cardCVV", "studentBean.birthday", "生日欄位格式不正確");
//		}
//		if (st.getSex() == null) {
//			errors.rejectValue("sex", "studentBean.sex", "性別欄位格式不正確");
//		}


	}

}

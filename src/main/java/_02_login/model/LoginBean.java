package _02_login.model;


public class LoginBean {
	String userEmail; 
	String password;
	public boolean hasError = false;
	
	
	public LoginBean() {
	}



	public LoginBean(String userEmail, String password) {
		this.userEmail = userEmail;
		this.password = password;
	}

	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public boolean getHasError() {
		return hasError;
	}



	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	
	
	
	
	
}

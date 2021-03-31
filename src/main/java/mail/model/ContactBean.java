package mail.model;


public class ContactBean {
	String userName; 
	String userEmail; 
	String q_category;
	String subject;
	String message;
	
	public ContactBean(String userName, String userEmail, String q_category, String subject, String message) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.q_category = q_category;
		this.subject = subject;
		this.message = message;
	}

	public ContactBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
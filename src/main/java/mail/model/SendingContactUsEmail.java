package mail.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingContactUsEmail {

	private String userName; 
	private String userEmail; 
	private String q_category; 
	private String subject;
	private String detailMessage;
	
	public SendingContactUsEmail(String userName ,String userEmail, String q_category, String subject, String detailMessage) {
		this.userName = userName;
		this.userEmail = userEmail;
		this.q_category = q_category;
		this.subject = subject;
		this.detailMessage = detailMessage;
	}
	
	public void sendMail() {
		// Enter the email address and password for the account from which verification link will be send
		String email = "trainme015@gmail.com";
		String password = "Trainme0!";
		
		Properties theProperties = new Properties();
		
		theProperties.put("mail.smtp.auth", "true");
		theProperties.put("mail.smtp.starttls.enable", "true");
		theProperties.put("mail.smtp.host", "smtp.gmail.com");
		theProperties.put("mail.smtp.port", "587");
		
		Session session = Session.getDefaultInstance(theProperties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});
		
		try {
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 設定信件標題
			message.setSubject("[問題類型:" + " " + q_category + "] " + "[姓名:" + " " + userName + "] " + "[使用者信箱:" + " " + userEmail + "]");
			
			// 設定信件內容
			message.setContent("遇到了什麼問題:" + " " + subject + "\n" + "問題描述:" + " " + detailMessage, "text/plain; charset=UTF-8");
			Transport.send(message);
			
			System.out.println("Successfully sent mail");
			
		} catch (Exception e) {
			System.out.println("Error at SendingEmail.java: " + e);
		}
		
	}
	
}

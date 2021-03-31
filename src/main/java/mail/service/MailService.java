package mail.service;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mail.dao.MailDao;
@Transactional
@Service
public class MailService {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	MailDao dao;

	

	public void changeVerification(String type , String email , String hash) {
			dao.changeVerification(type, email, hash);
	}
	
	
	
	
}

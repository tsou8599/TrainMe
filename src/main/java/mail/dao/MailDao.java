package mail.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;

@Repository
public class MailDao {

	
	
	@Autowired
	SessionFactory factory ;
	

    public MailDao() {
    }
    
    // 更改驗證狀態碼
    public void changeVerification(String type , String email , String hash) {
    	String MemType = "";
    	int typeInt = Integer.parseInt(type);
    	// 判斷會員類型
    	if(typeInt == 1) {
    		 MemType = "StudentBean_H";
		}
		if(typeInt == 2) {
			 MemType = "TrainerBean_H";
			
		}
		
    	String hql1 = "From " + MemType + " WHERE email= :memail and hash= :mhash and verification = :mverification ";
    	Session session = factory.getCurrentSession();
    	StudentBean_H sb = new StudentBean_H();
    	TrainerBean_H tb = new TrainerBean_H();
    	MemberBean_H memberBean = (MemberBean_H) session.createQuery(hql1)
					               						.setParameter("memail", email)
					               						.setParameter("mhash", hash)
					               						.setParameter("mverification", 0)					               						
					               						.getSingleResult();
		    	if(memberBean != null) {		    		
		    		if(memberBean instanceof StudentBean_H) {
		    			sb = (StudentBean_H) memberBean;
		    			sb.setVerification(1);
		    			session.update(sb);
		    		}
		    		if(memberBean instanceof TrainerBean_H) {
		    			tb = (TrainerBean_H) memberBean;
		    			tb.setVerification(1);
		    			session.update(tb);
		    		}
				} 

	}
    
   
}

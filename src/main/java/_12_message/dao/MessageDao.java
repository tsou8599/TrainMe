package _12_message.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.MemberBean_H;
import _12_message.model.MessageBean;

@Repository
public class MessageDao {

	@Autowired
	SessionFactory factory;
	
	public void addMessage(MessageBean messageBean) {
		Session session = factory.getCurrentSession();
		session.save(messageBean);
	}
	
	//查詢未讀訊息數量
	public Long unreadMessage(int id,int type) {
		Session session = factory.getCurrentSession();
		String hql = null;
		if (type == 1) {
			hql = "SELECT COUNT(*) FROM MessageBean WHERE st_id = :mId and is_read = 0";
		}
		if (type == 2) {
			hql = "SELECT COUNT(*) FROM MessageBean WHERE tr_id = :mId and is_read = 0";			
		}
		
		return (Long) session.createQuery(hql).setParameter("mId", id).getSingleResult();
		
	}
	
	//用訊息id找訊息
	public MessageBean getMessageById(int msgId) {
		Session session = factory.getCurrentSession();
		return session.get(MessageBean.class, msgId);
	}
	
	
	//更換訊息狀態為已讀
	public void changeIsRead(MessageBean msgb) {
		Session session = factory.getCurrentSession();
		msgb.setIs_read(1);
		session.update(msgb);
	}
	
	//找會員所有訊息
	@SuppressWarnings("unchecked")
	public List<MessageBean> getAllMessage(int id,int toType) {
		Session session = factory.getCurrentSession();
		String hql = null;
		if(toType == 1) {
			hql = "FROM MessageBean WHERE st_id = :mId ORDER BY date DESC";			
		}
		if(toType == 2) {
			hql = "FROM MessageBean WHERE tr_id = :mId ORDER BY date DESC";
		}
		return session.createQuery(hql).setParameter("mId", id).getResultList();
		
	}
	
	
}

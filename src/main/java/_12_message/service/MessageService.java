package _12_message.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _04_money.model.MoneyBean_H;
import _10_studentCourse.model.StudentCourseBean_H;
import _12_message.dao.MessageDao;
import _12_message.model.MessageBean;

@Transactional
@Service
public class MessageService {
	
	@Autowired
	MessageDao messageDao;
	
	//通過驗證後通知
	public void passVerification(MemberBean_H mb) {
		MessageBean msg = new MessageBean();
		msg.setTitle("【TrainMe通知】 歡迎加入TrainMe！");
		msg.setContent("親愛的會員你好，TrainMe 希望帶你認識更多好教練，趕快到「個人主頁」及「帳號設定」，一起運動吧！");
		msg.setIs_read(0);
		if (mb instanceof TrainerBean_H) {
			TrainerBean_H tb = (TrainerBean_H) mb;
			msg.setTrainerBean_H(tb);
			msg.setToType(2);
			msg.setKind("trPass");
		}
		if (mb instanceof StudentBean_H) {
			StudentBean_H sb = (StudentBean_H) mb;
			msg.setStudentBean_H(sb);
			msg.setToType(1);
			msg.setKind("stPass");
		}
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		
		messageDao.addMessage(msg);		
	}
	
	//學員預約課程通知(給教練)
	public void bookMsgToTrainer(StudentCourseBean_H sc) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(2);
		msg.setKind("trBook");
		msg.setTitle("【預約通知】 有筆一新的預約！");
		msg.setContent("親愛的 " + sc.getTrainerCourseBean_H().getTrainerBean_H().getName() 
					  +" 教練你好，學員 " + sc.getStudentBean_H().getName() 
					  + " 希望於 "
				      + sc.getDate() 
				      + " " 
				      + sc.getTime() 
				      + ":00-" 
				      + (sc.getTime()+1)  
				      + ":00" 
					  +" 預約您的「"
				      + sc.getTrainerCourseBean_H().getSkillBean_H().getName()
					  +"」課程，請趕快到「課程管理」回覆唷！");
		msg.setTrainerBean_H(sc.getTrainerCourseBean_H().getTrainerBean_H());
		messageDao.addMessage(msg);	
	}
	
	//學員預約課程通知(給學員)
	public void bookMsgToStudent(StudentCourseBean_H sc) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(1);
		msg.setKind("stBook");
		msg.setTitle("【預約通知】 你剛剛預約了一堂課程！");
		msg.setContent("親愛的 " + sc.getStudentBean_H().getName() 
					  +" 你好，你剛剛預約了一堂 "
					  + sc.getTrainerCourseBean_H().getTrainerBean_H().getName()
					  + " 教練的「"
					  + sc.getTrainerCourseBean_H().getSkillBean_H().getName()
					  + "」課程，將在 "
				      + sc.getDate() 
				      + " " 
				      + sc.getTime() 
				      + ":00-" 
				      + (sc.getTime()+1)  
				      + ":00" 
					  + " 上課，本堂課程扣款 "
				      + sc.getTrainerCourseBean_H().getPrice()
					  + " 點，可以到「我的課程」、「我的點數」中確認唷！");
		msg.setStudentBean_H(sc.getStudentBean_H());
		messageDao.addMessage(msg);	
	}
	
	
	
	//學員取消課程通知(給教練)
	public void cancelMsgToTrainer(StudentCourseBean_H sc) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(2);
		msg.setKind("cancelToTr");
		msg.setTitle("【取消課程通知】 有一堂課程被取消");
		msg.setContent("親愛的 " 
					  + sc.getTrainerCourseBean_H().getTrainerBean_H().getName() 
					  +" 教練你好，學員 " 
					  + sc.getStudentBean_H().getName() 
					  + " 取消了之前跟你預約在 "
				      + sc.getDate() 
				      + " " 
				      + sc.getTime() 
				      + ":00-" 
				      + (sc.getTime()+1)  
				      + ":00" 
					  +" 的「"
				      + sc.getTrainerCourseBean_H().getSkillBean_H().getName()
					  +"」課程！");
		msg.setTrainerBean_H(sc.getTrainerCourseBean_H().getTrainerBean_H());
		messageDao.addMessage(msg);	
	}
	
	
	//教練同意課程通知(給學員)
	public void agreeMsg(StudentCourseBean_H sc) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(1);
		msg.setKind("allowToSt");
		msg.setTitle("【課程通知】 你的預約已經被教練同意囉！");
		msg.setContent("親愛的 " + sc.getStudentBean_H().getName()
					  + " 你好，你之前預約在 "
					  + sc.getDate() 
					  + " " 
					  + sc.getTime() 
				      + ":00-" 
				      + (sc.getTime()+1)  
				      + ":00" 
				      + " 上課的 "
					  + sc.getTrainerCourseBean_H().getTrainerBean_H().getName()
					  + " 教練的「"
					  + sc.getTrainerCourseBean_H().getSkillBean_H().getName()
					  + "」課程，教練已經同意囉，可以到「我的課程」中確認！");
		msg.setStudentBean_H(sc.getStudentBean_H());
		messageDao.addMessage(msg);	
	}
	
	
	//教練不同意課程通知(給學員)
	public void refuseMsg(StudentCourseBean_H sc) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(1);
		msg.setKind("rejectToSt");
		msg.setTitle("【課程通知】 你的預約被教練拒絕了！");
		msg.setContent("親愛的 " + sc.getStudentBean_H().getName()
					  + " 你好，你之前預約在 "
					  + sc.getDate() 
				      + " " 
				      + sc.getTime() 
				      + ":00-" 
				      + (sc.getTime()+1)  
				      + ":00" 
				      + " 上課的 "
					  + sc.getTrainerCourseBean_H().getTrainerBean_H().getName()
					  + " 教練的「"
					  + sc.getTrainerCourseBean_H().getSkillBean_H().getName()
					  + "」課程，被教練拒絕了，將退還 "
					  + sc.getTrainerCourseBean_H().getPrice()
					  + " 點給你，可以到「我的點數」中確認，TrainMe也期待你的下次預約！");
		msg.setStudentBean_H(sc.getStudentBean_H());
		messageDao.addMessage(msg);	
	}
	
	//學員儲值成功通知(給學員)
	public void storedValueMsg(MoneyBean_H mb) {
		MessageBean msg = new MessageBean();
		msg.setIs_read(0);
		Date now = new Date();
		java.sql.Date nowDate = new java.sql.Date(now.getTime());
		msg.setDate(nowDate);
		msg.setToType(1);
		msg.setKind("stPrice");
		msg.setTitle("【儲值成功通知】 你剛剛完成了一筆儲值！");
		msg.setContent("親愛的 " + mb.getStudentBean_H().getName()
					  +" 你好，你剛剛成功儲值了 "
					  + mb.getChange_amount()
					  + " 點，目前的點數餘額為 "
					  + mb.getTotal_amount()
					  + " 點，可以到「我的點數」中確認唷！");
		msg.setStudentBean_H(mb.getStudentBean_H());
		messageDao.addMessage(msg);	
	}
	
	//收藏教練通知(給教練)-再說
	
	//查詢未讀訊息數量
	public Long unreadMessage(int id,int type) {
		return messageDao.unreadMessage(id, type);
	}
	
	//更換訊息狀態為已讀
	public void changeIsRead(MessageBean msgb) {
		messageDao.changeIsRead(msgb);
	}
	
	//找會員所有訊息
	public List<MessageBean> getAllMessage(int id,int toType) {
		return messageDao.getAllMessage(id, toType);
	}
	
	//用訊息id找訊息
		public MessageBean getMessageById(int msgId) {
			return messageDao.getMessageById(msgId);
		}
	

}

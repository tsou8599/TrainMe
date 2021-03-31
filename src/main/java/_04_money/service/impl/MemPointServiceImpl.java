package _04_money.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.StudentBean_H;
import _04_money.dao.impl.MemPointDaoImpl;
import _04_money.model.CardBean;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;
import _04_money.service.MemPointService;

@Service
public class MemPointServiceImpl implements MemPointService {

	@Autowired
	SessionFactory factory;
	@Autowired
	MemPointDaoImpl dao;

	@Transactional
	@Override
	public List<MoneyBean_H> getStudentMoneyDetail(int id) {

		return dao.getStudentMoneyDetail(id);
	}
	
	@Transactional
	@Override
	public List<MoneyBean_H> getTrainerMoneyDetail(int id) {

		return dao.getTrainerMoneyDetail(id);
	}

	@Transactional
	@Override
	public List<TrainerAccountBean_H> getAccountDetail(int id) {
		return dao.getAccountDetail(id);
	}

	//學員儲值點數使用這個方法
	@Transactional
	@Override
	public int saveMoney(MoneyBean_H moneyBean_H) {

//		System.out.println(LoginOK.id);
		
		if(moneyBean_H.getChange_amount()==3000) {
			moneyBean_H.setChange_amount(3020);
		}
		if(moneyBean_H.getChange_amount()==5000) {
			moneyBean_H.setChange_amount(5050);
		}
		if(moneyBean_H.getChange_amount()==7000) {
			moneyBean_H.setChange_amount(7070);
		}
		if(moneyBean_H.getChange_amount()==10000) {
			moneyBean_H.setChange_amount(10100);
		}
		int size = dao.getStudentMoneyDetail(moneyBean_H.getStudentBean_H().getId()).size();
		if(size==0) {
			moneyBean_H.setTotal_amount(moneyBean_H.getChange_amount());
		}else {
			
			int total = dao.getStudentMoneyLast(moneyBean_H.getStudentBean_H().getId()).getTotal_amount()+moneyBean_H.getChange_amount();
			moneyBean_H.setTotal_amount(total);
		}
		
		return dao.saveMoney(moneyBean_H);
//		return 1;
	}

	//新增學員點數資料使用這個方法
	@Transactional
	@Override
	public int saveStudentRefund(MoneyBean_H moneyBean_H) {
		
		//判斷他資料庫裏面有幾筆money資料
		int size = dao.getStudentMoneyDetail(moneyBean_H.getStudentBean_H().getId()).size();
		
		//如果是0筆就把要變更的$放到total，否則新的total就是變更的$加上舊的$
		if(size==0) {
			moneyBean_H.setTotal_amount(moneyBean_H.getChange_amount());
		}else {
			
			int total = dao.getStudentMoneyLast(moneyBean_H.getStudentBean_H().getId()).getTotal_amount()+moneyBean_H.getChange_amount();
			moneyBean_H.setTotal_amount(total);
		}
		return dao.saveMoney(moneyBean_H);
	}
	
	//更新money使用這個方法
		@Transactional
		@Override
		public int saveStudentCourseToMoney(MoneyBean_H moneyBean_H) {
			
			return dao.updateMoney(moneyBean_H);
		}
		
	//新增教練點數資料使用這個方法
	@Transactional
	@Override
	public int saveTrainerRefund(MoneyBean_H moneyBean_H) {
		int size = dao.getTrainerMoneyDetail(moneyBean_H.getTrainerBean_H().getId()).size();
		if(size==0) {
			moneyBean_H.setTotal_amount(moneyBean_H.getChange_amount());
		}else {
			
			int total = dao.getTrainerMoneyLast(moneyBean_H.getTrainerBean_H().getId()).getTotal_amount()+moneyBean_H.getChange_amount();
			moneyBean_H.setTotal_amount(total);
		}
		return dao.saveMoney(moneyBean_H);
	}
	
	@Transactional
	@Override
	public MoneyBean_H getStudentMoneyLast(int id) {
		return dao.getStudentMoneyLast(id);
	}
	
	@Transactional
	@Override
	public List<MoneyBean_H> getMonthPoint(java.sql.Date date, int trId) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH);
		if(month == 0) {
			month = 12;
		}
		
		return dao.getMonthPoint(month, trId);
	}
	

}

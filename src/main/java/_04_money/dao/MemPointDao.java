package _04_money.dao;

import java.util.List;

import _01_register.model.StudentBean_H;
import _04_money.model.MoneyBean_H;
import _04_money.model.TrainerAccountBean_H;

public interface MemPointDao {

	public List<MoneyBean_H> getStudentMoneyDetail(int id);

	public List<TrainerAccountBean_H> getAccountDetail(int id);

	public int saveMoney(MoneyBean_H moneyBean_H);

//	public int saveRefund(MoneyBean_H moneyBean_H);

	public List<MoneyBean_H> getTrainerMoneyDetail(int id);

	public int updateMoney(MoneyBean_H moneyBean_H);

	public MoneyBean_H getStudentMoneyLast(int id);

	// 查詢教練本月的入帳點數
	public List<MoneyBean_H> getMonthPoint(int month, int trId);

	public MoneyBean_H getTrainerMoneyLast(int trId);

}

package _01_register.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;
import _04_money.model.MoneyBean_H;


// 本類別使用為標準的Hibernate+Spring技術來存取資料庫。
@Repository
public class MemberDaoImpl_H implements MemberDao_H {

	@Autowired
	SessionFactory factory;

	public MemberDaoImpl_H() {
	}

	// 儲存StudentBean物件，將參數sb新增到Student表格內。

	@Override
	public int saveStudent_H(StudentBean_H sb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(sb);
		n++;
		return n;
	}

	// 儲存TrainerBean物件，將參數tr新增到Trainer表格內。

	@Override
	public int saveTrainer_H(TrainerBean_H tr) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(tr);
		n++;

		return n;
	}

	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，

	// 否則傳回false，表示此id可使用。
	@Override
	public boolean idExists_H(String email) {

		boolean exist = false;
		String[] types = { "StudentBean_H", "TrainerBean_H" };
		for (int i = 0; i < types.length; i++) {

			String hql = "FROM " + types[i] + " WHERE email = :memail";
			Session session = factory.getCurrentSession();

			@SuppressWarnings("unchecked")
			List<MemberBean_H> mb = session.createQuery(hql).setParameter("memail", email).getResultList();
			if (mb.size() != 0) {

				exist = true;
				return exist;
			}

		}

		return exist;
	}

	@Override
	public boolean idNumberExists_H(String idNumber) {
		boolean exist = false;
		String[] types = { "StudentBean_H", "TrainerBean_H" };
		for (int i = 0; i < types.length; i++) {

			String hql = "FROM " + types[i] + " WHERE id_number = :mid_number";
			Session session = factory.getCurrentSession();

			@SuppressWarnings("unchecked")
			List<MemberBean_H> mb = session.createQuery(hql).setParameter("mid_number", idNumber).getResultList();
			if (mb.size() != 0) {
				exist = true;
			}
		}
		return exist;
	}

	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，

	// 如果找不到對應的會員資料，傳回值為null。
	@Override
	public StudentBean_H queryStudent_H(String id) {
		StudentBean_H sb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM StudentBean_H WHERE id = :mId";
		try {
			sb = (StudentBean_H) session.createQuery(hql).setParameter("mId", id).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDaoImpl_H類別queryStudent_H()發生例外: " + e.getMessage());
		}

		return sb;
	}
	
//	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// // 否則傳回 null。
	@SuppressWarnings("unused")
	@Override
	public MemberBean_H checkIdPassword_H(String email, String password) {
		String[] types = { "StudentBean_H", "TrainerBean_H" };
		MemberBean_H mbh = null;
		StudentBean_H sbh = null;
		TrainerBean_H trh = null;
		Session session = factory.getCurrentSession();

		for (int i = 0; i < types.length; i++) {
			
			
			String type = types[i];
			
			String hql = "FROM " + type + " WHERE email = :memail and password = :psw";

			if (type.equals("StudentBean_H")) {

				try {
					return (StudentBean_H) session.createQuery(hql).setParameter("memail", email)
							.setParameter("psw", password).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}

			} 
			
			if (type.equals("TrainerBean_H")) {

				try {
					return (TrainerBean_H) session.createQuery(hql).setParameter("memail", email)
							.setParameter("psw", password).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}
			}

		}
		return null;
	}
	@Override
	public MemberBean_H checkOldPassword_H(String email, String password) {
		String[] types = { "StudentBean_H", "TrainerBean_H" };
		Session session = factory.getCurrentSession();
		for (int i = 0; i < types.length; i++) {
			
			
			String type = types[i];
			
			String hql = "FROM " + type + " WHERE email = :memail and password = :psw";

			if (type.equals("StudentBean_H")) {

				try {
					return (StudentBean_H) session.createQuery(hql).setParameter("memail", email)
							.setParameter("psw", password).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}

			} 
			
			if (type.equals("TrainerBean_H")) {

				try {
					return (TrainerBean_H) session.createQuery(hql).setParameter("memail", email)
							.setParameter("psw", password).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}
			}

		}
		return null;
	}
	@Override
	public MemberBean_H checkEmail_H(String email) {
		String[] types = { "StudentBean_H", "TrainerBean_H" };
		Session session = factory.getCurrentSession();
		for (int i = 0; i < types.length; i++) {
			
			
			String type = types[i];
			
			String hql = "FROM " + type + " WHERE email = :memail";

			if (type.equals("StudentBean_H")) {

				try {
					return (StudentBean_H) session.createQuery(hql).setParameter("memail", email).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}

			} 
			
			if (type.equals("TrainerBean_H")) {

				try {
					return (TrainerBean_H) session.createQuery(hql).setParameter("memail", email).getSingleResult();
				} catch (NoResultException e) {
					continue;
				}
			}

		}
		return null;
	}
	// 儲存TrainerLicenseBean物件，將參數tl新增到trainer_license表格內。

		@Override
		public int saveTrainerLicenseBean_H(TrainerLicenseBean_H tl) {
			int n = 0;
			Session session = factory.getCurrentSession();
			session.save(tl);
			n++;

			return n;
		}
		
		@Override
		public List <TrainerLicenseBean_H> checkTrainerLicense_H(int id) {
			
			String hql = "FROM TrainerLicenseBean_H WHERE tr_id = :metr_id ORDER BY id DESC";
			Session session = factory.getCurrentSession();
			
			@SuppressWarnings("unchecked")
			List <TrainerLicenseBean_H> mb = session.createQuery(hql).setParameter("metr_id", id).getResultList();
			return mb;
		}
		
		@Override
		public void delTrainerLicense(int Id) {
			Session session = factory.getCurrentSession();
			
			String hql = "DELETE FROM TrainerLicenseBean_H WHERE id = :mid";
			
			session.createQuery(hql).setParameter("mid", Id).executeUpdate();		
		}
		

	@SuppressWarnings("unchecked")
	@Override
	public List<GymBean_H> getGymList_H() {

		List<GymBean_H> gyms = new ArrayList<GymBean_H>();
		Session session = factory.getCurrentSession();
		String hql = "FROM GymBean_H";

		gyms = session.createQuery(hql).getResultList();

		return gyms;
	}

//=========================================================================
	@Override
	public int checkverification_H(int gymId) {

		Session session = factory.getCurrentSession();
		String hql = "SELECT verification FROM GymBean_H  WHERE id = :gId";

		return (int) session.createQuery(hql).setParameter("gId", gymId).getSingleResult();

	}

	// 檢查是否通過信箱驗證
	@Override
	public boolean checkPass(int type, String email) {
		Session session = factory.getCurrentSession();
		boolean pass = false;
		StudentBean_H sb = new StudentBean_H();
		TrainerBean_H tb = new TrainerBean_H();

		String MemType = "";

		if (type == 1) {
			MemType = "StudentBean_H";
		}
		if (type == 2) {
			MemType = "TrainerBean_H";
		}
		String hql1 = "SELECT verification From " + MemType + " WHERE email= :memail ";

		int n = (int) session.createQuery(hql1).setParameter("memail", email).getSingleResult();

		if (n == 1) {
			pass = true;
		}

		return pass;
	}

	@Override
	public List<StudentBean_H> listAll_H() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public long queryTrainerTotal() {

		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM TrainerBean_H";
		
		return (long) session.createQuery(hql).getSingleResult();

	}
	
	@Override
	public long queryStudentTotal() {

		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM StudentBean_H";
		
		return (long) session.createQuery(hql).getSingleResult();

	}
	
	@Override
	public long queryGymTotal() {

		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM GymBean_H";
		
		return (long) session.createQuery(hql).getSingleResult();

	}

}

package _01_register.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import _01_register.dao.MemberDaoImpl_H;
import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;



@Service
public class MemberServiceImpl_H implements MemberService_H {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	MemberDaoImpl_H dao;

	public MemberServiceImpl_H() {
		System.out.println("service==============================================================");
	}

	@Transactional
	@Override
	public int saveStudent_H(StudentBean_H sb) {
		int n = 0;		
		n = dao.saveStudent_H(sb);
		n++;
		return n;
	}
	
	@Transactional
	@Override
	public int saveTrainer_H(TrainerBean_H tr) {
		int n = 0;
		n = dao.saveTrainer_H(tr);
		return n;
	}
	@Transactional
	@Override
	public boolean idExists_H(String email) {
		boolean exist = false;
		exist = dao.idExists_H(email);
		return exist;

	}

	@Transactional
	@Override
	public MemberBean_H checkIdPassword_H(String email, String password) {
		MemberBean_H mb = null;
		mb = dao.checkIdPassword_H(email, password);	
		return mb;
	}
	@Transactional
	@Override
	public MemberBean_H checkOldPassword_H(String email, String password) {
		MemberBean_H mb = null;
		mb = dao.checkOldPassword_H(email, password);	
		return mb;
	}
	@Transactional
	@Override
	public int saveTrainerLicenseBean_H(TrainerLicenseBean_H tl) {
		int n = 0;		
		n = dao.saveTrainerLicenseBean_H(tl);
		n++;
		return n;
	}
	@Transactional
	@Override
	public MemberBean_H checkEmail_H(String email) {
		MemberBean_H mb = null;
		mb = dao.checkEmail_H(email);	
		return mb;
	}
	@Transactional
	@Override
	public List <TrainerLicenseBean_H> checkTrainerLicense_H(int id) {
		return dao.checkTrainerLicense_H(id);
	}

	@Transactional
	@Override
	public void delTrainerLicense_H(int id) {
		dao.delTrainerLicense(id);
	}

	@Transactional
	@Override
	public List<StudentBean_H> listAll_H() {

		return dao.listAll_H();
	}
	@Transactional
	@Override
	public List<GymBean_H> getGymList_H() {
		List<GymBean_H> gyms = new ArrayList<GymBean_H>();
		gyms = dao.getGymList_H();
		return gyms;

	}
	@Transactional
	@Override
	public int checkverification_H(int gymId) {
		int n;
		n = dao.checkverification_H(gymId);
		return n;
	}
	@Transactional
	@Override
	public MemberBean_H queryStudent_H(String id) {
		MemberBean_H mb = null;
		mb = dao.queryStudent_H(id);
		return mb;
	}
	@Transactional
	@Override
	public boolean idNumberExists_H(String idNumber) {
		boolean exist = false;
		exist = dao.idNumberExists_H(idNumber);
		return exist;
	}
	
	@Transactional
	@Override
	public boolean checkPass(int type, String email) {		
		return dao.checkPass(type, email);
	}
	
	@Transactional
	@Override
	public long queryTrainerTotal() {		
		return dao.queryTrainerTotal();
	}
	
	@Transactional
	@Override
	public long queryStudentTotal() {		
		return dao.queryStudentTotal();
	}

	@Transactional
	@Override
	public long queryGymTotal() {		
		return dao.queryGymTotal();
	}

//	@Override
//	public StudentBean queryMember(String id) {
//		return dao.queryMember(id);
//	}
//
//	@Override
//	public void updateUnpaidOrderAmount(OrderBean ob) {
//		dao.updateUnpaidOrderAmount(ob);
//	}
//	public StudentBean checkIdPassword(String userId, String password) {
//		StudentBean mb = dao.checkIdPassword(userId, password);
//		return mb;
//	}
}

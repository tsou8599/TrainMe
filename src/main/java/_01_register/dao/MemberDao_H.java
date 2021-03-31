package _01_register.dao;


import java.util.List;

import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;




public interface MemberDao_H {

	
	public MemberBean_H queryStudent_H(String id);
	
	public int checkverification_H(int verification);

	public MemberBean_H checkIdPassword_H(String email, String password);
	
	public MemberBean_H checkOldPassword_H(String email, String password);
	
	public MemberBean_H checkEmail_H(String email);
	
	public List<StudentBean_H> listAll_H() ;
	
	public List<GymBean_H> getGymList_H() ;
//	
//	void updateUnpaidOrderAmount(OrderBean ob);
//
//	public void setConnection(Connection con);

	int saveStudent_H(StudentBean_H sb);

	int saveTrainer_H(TrainerBean_H tr);

	boolean idExists_H(String email);
	
	boolean idNumberExists_H(String idNumber);
	
	boolean checkPass(int type , String email );

	int saveTrainerLicenseBean_H(TrainerLicenseBean_H tl);

	public List<TrainerLicenseBean_H> checkTrainerLicense_H(int id);


	void delTrainerLicense(int Id);

	long queryTrainerTotal();

	long queryStudentTotal();
	
	long queryGymTotal();

	
}
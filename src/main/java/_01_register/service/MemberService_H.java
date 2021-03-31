package _01_register.service;

import java.util.List;

import _01_register.model.GymBean_H;
import _01_register.model.MemberBean_H;
import _01_register.model.StudentBean_H;
import _01_register.model.TrainerBean_H;
import _03_memberData.model.TrainerLicenseBean_H;




public interface MemberService_H {
	boolean idExists_H(String email);
	boolean idNumberExists_H(String idNumber);
	int checkverification_H(int gymId);
	int saveStudent_H(StudentBean_H sb);
	int saveTrainer_H(TrainerBean_H tr);
	int saveTrainerLicenseBean_H(TrainerLicenseBean_H tl);
	boolean checkPass(int type , String email );

	MemberBean_H queryStudent_H(String id);
	MemberBean_H checkIdPassword_H(String email, String password) ;
	MemberBean_H checkOldPassword_H(String email, String password) ;
	MemberBean_H checkEmail_H(String email) ;
	public List <TrainerLicenseBean_H> checkTrainerLicense_H(int id);
	
	List<StudentBean_H> listAll_H();
	List<GymBean_H> getGymList_H();
	void delTrainerLicense_H(int id);
	long queryTrainerTotal();
	long queryStudentTotal();
	long queryGymTotal();


	
	

	
}

package _03_memberData.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.GymBean_H;
import _03_memberData.dao.AddressDao;
import _03_memberData.dao.GymDao;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Transactional
@Service
public class GymService {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	GymDao gymDao;
	
	public GymBean_H getGym(int gymId) {
		return gymDao.getGym(gymId);
	}

}

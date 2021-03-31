package _03_memberData.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _03_memberData.dao.AddressDao;
import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Transactional
@Service
public class AddressService {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	AddressDao addressDao;
	
	public List<City_H> listCities() {
		return addressDao.listCities();
	}
	
	public List<Area_H> listAreas(int cityId) {
		return addressDao.listAreas(cityId);
	}
	
	public City_H  getCityById(int id) {
		
		return 	addressDao.getCityById(id);
	}
	public Area_H  getAreaById(int id) {
		
		return 	addressDao.getAreaById(id);
	}
}

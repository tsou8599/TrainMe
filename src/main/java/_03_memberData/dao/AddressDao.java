package _03_memberData.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _03_memberData.model.Area_H;
import _03_memberData.model.City_H;

@Repository
public class AddressDao {

	@Autowired
	SessionFactory sessionFactory;

	public AddressDao() {
	}

	@SuppressWarnings("unchecked")
	public List<City_H> listCities() {

		Session session = sessionFactory.getCurrentSession();
		String hql = "from City_H";

		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Area_H> listAreas(int cityId) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Area_H WHERE city_H.id = :cityId";
		
		return session.createQuery(hql)
					  .setParameter("cityId", cityId)
					  .getResultList();
	}
	
	public City_H  getCityById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(City_H.class, id);	
	}
	public Area_H  getAreaById(int id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Area_H.class, id);	
	}

}

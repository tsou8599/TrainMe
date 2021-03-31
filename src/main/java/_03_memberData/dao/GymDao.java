package _03_memberData.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.GymBean_H;

@Repository
public class GymDao {

	@Autowired
	SessionFactory sessionFactory;

	public GymDao() {
	}
	
	public GymBean_H getGym(int gymId) {
		
		Session session = sessionFactory.getCurrentSession();
		String hql = "From GymBean_H WHERE id = :gymId";
		
		return (GymBean_H) session.createQuery(hql)
					           .setParameter("gymId", gymId)
				               .getSingleResult();
	}

}

package _13_addfavorite.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.model.TrainerBean_H;
import _13_addfavorite.model.FavoriteBean;

@Repository
public class FavoriteDao {
	
	@Autowired
	SessionFactory factory;
	
	//收藏教練
	public void addFavorite(FavoriteBean fb) {
		Session session = factory.getCurrentSession();
		session.save(fb);
	}
	
	//查詢收藏教練列表
	@SuppressWarnings("unchecked")
	public List<FavoriteBean> getFavoriteList(int stId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteBean WHERE st_id = :stId";
		return session.createQuery(hql).setParameter("stId", stId).getResultList();
	}
	
	//查詢收藏
	public FavoriteBean getFavoriteBean(int stId, int trId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteBean WHERE st_id = :stId and tr_id = :trId";
		return (FavoriteBean) session.createQuery(hql).setParameter("stId", stId).setParameter("trId", trId).getSingleResult();
	}
	
	
	//取消收藏
	public void cancelFavorite(FavoriteBean fb) {
		Session session = factory.getCurrentSession();
		session.delete(fb);
	}
	
	//判斷教練是否被學生收藏
	public Boolean isFavorite(int stId, int trId) {
		Boolean isFavorite = true;
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoriteBean WHERE st_id = :stId and tr_id = :trId";
		try {
			session.createQuery(hql).setParameter("stId", stId).setParameter("trId", trId).getSingleResult();
		} catch (NoResultException  e) {
			 isFavorite = false;
		}
	
		return isFavorite;
	}

}

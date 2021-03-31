package _13_addfavorite.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _13_addfavorite.dao.FavoriteDao;
import _13_addfavorite.model.FavoriteBean;

@Transactional
@Service
public class FavoriteService {
	
	@Autowired
	FavoriteDao favoriteDao;
	
	//收藏教練
	public void addFavorite(FavoriteBean fb) {
		favoriteDao.addFavorite(fb);
	}
	
	//查詢收藏教練列表
	public List<FavoriteBean> getFavoriteList(int stId) {
		return favoriteDao.getFavoriteList(stId);
	}
	
	//查詢收藏的所有教練的id
	public List<Integer> getFavoriteTrainerIdList(int stId) {
		List<Integer> trainerIds = new ArrayList<>();
		List<FavoriteBean> fbs = favoriteDao.getFavoriteList(stId);
		for(FavoriteBean fb : fbs) {
			trainerIds.add(fb.getTrainerBean_H().getId());
		}
		return trainerIds;
		
	}
	
	//查詢收藏
	public FavoriteBean getFavoriteBean(int stId, int trId) {
		return favoriteDao.getFavoriteBean(stId, trId);
	}
	
	//取消收藏
	public void cancelFavorite(FavoriteBean fb) {
		favoriteDao.cancelFavorite(fb);
	}
	
	//判斷教練是否被學生收藏
		public Boolean isFavorite(int stId, int trId) {
			return favoriteDao.isFavorite(stId, trId);
		}

}

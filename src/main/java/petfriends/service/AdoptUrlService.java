package petfriends.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.model.AdoptPhotoUrlBean;
import petfriends.model.AdoptPhotoUrlDAO;
@Service
public class AdoptUrlService {
	@Autowired
	private AdoptPhotoUrlDAO adoptPhotoUrlDAO;
	public AdoptUrlService(AdoptPhotoUrlDAO adoptPhotoUrlDAO){
		this.adoptPhotoUrlDAO=adoptPhotoUrlDAO;
	}
	
	public List<AdoptPhotoUrlBean> select(AdoptPhotoUrlBean bean) {
		List<AdoptPhotoUrlBean> result = null;
		if(bean!=null && bean.getUrlId()!=0) {
			AdoptPhotoUrlBean temp = adoptPhotoUrlDAO.select(bean.getUrlId());
			if(temp!=null) {
				result = new ArrayList<AdoptPhotoUrlBean>();
				result.add(temp);
			}
		} else {
			result = adoptPhotoUrlDAO.select(); 
		}
		return result;
	}
	public AdoptPhotoUrlBean select(int AId) {
		AdoptPhotoUrlBean result = null;
		if(AId>0) {
			result = adoptPhotoUrlDAO.select(AId);
		}
		return result;
	}	
	public AdoptPhotoUrlBean insert(AdoptPhotoUrlBean bean) {
		AdoptPhotoUrlBean result = null;
		if(bean!=null) {
			result = adoptPhotoUrlDAO.insert(bean);
		}
		return result;
	}
	public AdoptPhotoUrlBean update(AdoptPhotoUrlBean bean) {
		AdoptPhotoUrlBean result = null;
		if(bean!=null) {
			result = adoptPhotoUrlDAO.update(bean);
		}
		return result;
	}
	public boolean delete(AdoptPhotoUrlBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = adoptPhotoUrlDAO.delete(bean.getUrlId());
		}
		return result;
	}
}

package petfriends.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.AdoptPhotoUrlBean;
import petfriends.model.AdoptPhotoUrlDAO;
@Repository
@Transactional
public class AdoptPhotoUrlDAOHibernate implements AdoptPhotoUrlDAO {
	/*
	 * PetType FindCity FindDate
	 */
	@Autowired
	private SessionFactory sessionFactory;
	public AdoptPhotoUrlDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<AdoptPhotoUrlBean> select() {
		return this.getSession().createQuery("FROM AdoptPhotoUrlBean", AdoptPhotoUrlBean.class).getResultList();
	}

	@Override
	public AdoptPhotoUrlBean select(int UrlId) {
		return getSession().get(AdoptPhotoUrlBean.class, UrlId);
	}

	@Override
	public AdoptPhotoUrlBean insert(AdoptPhotoUrlBean bean) {
		if (bean != null) {
			AdoptPhotoUrlBean select = this.select(bean.getUrlId());
			if (select == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public AdoptPhotoUrlBean update(AdoptPhotoUrlBean bean) {
		getSession().saveOrUpdate(bean);
		return null;
	}

	@Override
	public boolean delete(int UrlId) {
		AdoptPhotoUrlBean bean = this.select(UrlId);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
}
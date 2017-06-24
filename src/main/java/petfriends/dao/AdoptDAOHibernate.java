package petfriends.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.AdoptBean;
import petfriends.model.AdoptDAO;
import petfriends.model.AdoptPhotoUrlBean;
@Repository
@Transactional
public class AdoptDAOHibernate implements AdoptDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public AdoptDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<AdoptBean> select() {
		return this.getSession().createQuery("FROM AdoptBean", AdoptBean.class).getResultList();
	}

	@Override
	public AdoptBean select(int AId) {
		return getSession().get(AdoptBean.class, AId);
	}

	@Override
	public AdoptBean insert(AdoptBean bean) {
		if (bean != null) {
			AdoptBean select = this.select(bean.getAId());
			if (select == null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public AdoptBean update(AdoptBean bean) {
		getSession().saveOrUpdate(bean);
		return null;
	}

	@Override
	public boolean delete(int AId) {
		AdoptBean bean = this.select(AId);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
	@Override
	public Set<AdoptPhotoUrlBean> getUrlsByAdoptBean(Integer AId) {
		Set<AdoptPhotoUrlBean> set = select(AId).getAdoptPhotoUrlBeans();
		return set;
	}
}
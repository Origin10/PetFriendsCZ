package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import vo.CookBean;

public class CookDAOHibernate implements CookDAO {
	private SessionFactory sessionFactory;
	public CookDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public CookBean select(int cookId) {
		return getSession().get(CookBean.class, cookId);
	}
	@Override
	public List<CookBean> select() {
		return this.getSession().createQuery("FROM CookBean", CookBean.class).getResultList();
	}
	@Override
	public CookBean insert(CookBean cookBean) {
		if(cookBean!=null) {
			this.getSession().save(cookBean);
			return cookBean;
		}
		return null;
	}
	@Override
	public CookBean update(CookBean cookBean) {
		if(cookBean!=null && cookBean.getCookId() != 0) {
			this.getSession().update(cookBean);
		}
		return cookBean;
	}
	@Override
	public boolean delete(int cookId) {
		CookBean cookBean = this.select(cookId);
		if(cookBean!=null) {
			this.getSession().delete(cookBean);
			return true;
		}
		return false;
	}
	
}
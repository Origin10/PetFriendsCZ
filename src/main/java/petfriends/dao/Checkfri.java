package petfriends.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.Informfri_VO;
@Repository
@Transactional
public class Checkfri {
	@Autowired
	private SessionFactory sessionFactory;

	public Checkfri(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

//	public static void main(String[] args) {
//
//		Checkfri ss = new Checkfri(HibernateUtil.getSessionFactory());
//		List<Informfri_VO> aa = ss.select_to_who(3);
//		if (!aa.isEmpty()) {
//			for (Informfri_VO y : aa) {
//				System.out.println(y);
//			}
//			System.out.println(aa.size());
//		} else {
//			System.out.println(" sys null");
//		}
//
//	}

	public List<Informfri_VO> select_to_who(int to_mem_id) {
		try {
			String select = "from Informfri_VO where to_fri_num = " + to_mem_id;
			List<Informfri_VO>  check = getSession().createQuery(select).getResultList();
			 return check;
		} catch (java.lang.NullPointerException e) {
			return null;
		}
	}
	
	
	public Informfri_VO select_who_send(int mem_id ,int mem_fri_id) {
		try {
			String select = "from Informfri_VO where mem_id = " + mem_id +"AND to_fri_num =" + mem_fri_id;
			Informfri_VO  check = (Informfri_VO) getSession().createQuery(select).getSingleResult();
			System.out.println(check);
			return check;
		} catch (java.lang.NullPointerException e ) {
			return null;
		} 
	}
	
	public boolean insert_invalid(int mem_id ,int mem_fri_id) {

			String select = "insert into informFri  values("+mem_id+ "," + mem_fri_id +")";			
		 Query query =   getSession().createNativeQuery(select);
		 	int i = query.executeUpdate();
		 if(i == 1 ){
			 return true;
		 }
			return false;
	}
	

	
	public boolean delete(Informfri_VO check) {
		if(check != null){
			getSession().delete(check);
			return true;
		}
		return false;
	}
}
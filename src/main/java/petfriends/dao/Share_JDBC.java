package petfriends.dao;


import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.Share_VO;
@Repository
@Transactional
public class Share_JDBC {
	@Autowired
	private SessionFactory sessionFactory;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	public Share_JDBC(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

//
//	public static void main(String[] args) {
//		Share_JDBC s = new Share_JDBC(HibernateUtil.getSessionFactory());
		
//		 String re = s.select_valid(1);
//		 System.out.println(re);

//		 Share_VO vo = s.select_share(1);
//		 System.out.println(vo);

//		 List<Share_VO> sbean = s.select_BY_MEMID(1);
//			 System.out.println(sbean);
		
//			 ShareService ss = new ShareService(new Share_JDBC(HibernateUtil.getSessionFactory()));
//			 List<Share_VO> sbean= ss.select_all(3);
//			 System.out.println(sbean);
//		 boolean re = s.insert_Share("HHHHH", 1);
//		 System.out.println(re);

		

//		Share_VO sbean	=  new Share_VO();
//		sbean.setShare_Id(1);
//		sbean.setShare_content("123");
//		sbean.setShare_date(sdf.format(new java.util.Date().getTime()));
//		boolean aa = s.Update_share(sbean);
//		System.out.println(aa);
		
//		Share_VO  sbean =s.select_share(3);
//		
//		boolean a =s.delete(sbean);
//
//		System.out.println(a);
//	}

	public String select_valid(int mem_id) { // ok
			String result = null;
			try{
			String select = "select TOP 1 Share_content from share where mem_id = :id ORDER BY share_id DESC";
			Query query = getSession().createNativeQuery(select);
			query.setParameter("id", mem_id);
			result = (String) query.getSingleResult();
			}catch (javax.persistence.NoResultException nre){
				return null;
			}
		return result;
	}
	
	

	public Share_VO select_share(int sid) { // ok
	
		return  getSession().get(Share_VO.class, sid);
	
	}

	
	
	public List<Share_VO> select_BY_MEMID(int mem_id) {
		List<Share_VO> result = getSession().createQuery("From Share_VO where  mem_id = " + mem_id + "order by  share_date DESC", Share_VO.class).getResultList();

		return result;

		
	}

	
	
	public boolean insert_Share(String share_context, int mem_id) {   //ok
			String insert_Share = "insert into share(share_content,share_date,mem_id) values(:content,:date,:id)";
			NativeQuery query = getSession().createNativeQuery(insert_Share);
			query.setParameter("content", share_context);
			query.setParameter("date", sdf.format(new java.util.Date().getTime()));
			query.setParameter("id", mem_id);
			int i = query.executeUpdate();
		if (i == 1) {
			return true;
		}else{
			return false;
		}
		
	}

	
	
	
	
	
	public boolean Update_share(Share_VO sbean) { // ok

		 getSession().update(sbean);
		 
		return true;
		 
	}
	


	public boolean delete(Share_VO sbean) { // ok
		if (sbean != null) {
			return true;
		}
		return false;
	}


	

}

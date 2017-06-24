package petfriends.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.Fri_VO;
@Repository
@Transactional
public class Fri {
	
	@Autowired
	private SessionFactory sessionFactory;
	public Fri(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();

	}
	
//	public static void main(String[] args){
//		Fri fri = new  Fri(HibernateUtil.getSessionFactory());
////		int[] a = {4,7};
////		boolean res = fri.del(a);
////		System.out.println(res);
//		
//		boolean b =fri.insert(2, 3);
//		System.out.println(b);
//		
//	}
	
	
	
	public List<Fri_VO> select (int mem_id ,int mem_fri_id){
	
		String sql = "select * from fri where mem_id in(" + mem_id +","+ mem_fri_id + ") AND mem_fri_num in ("+ mem_id + "," + mem_fri_id +")";
		List<Fri_VO> fbean  = getSession().createNativeQuery(sql).addEntity(Fri_VO.class).getResultList();
		if(fbean != null){
			return fbean;
		}
		return null;

	}
	
	
	public  boolean insert(int[] fri_id){

		String sql = "insert into fri(mem_id ,mem_fri_num) values(" + fri_id[0] + ","+ fri_id[1] +"),(" + fri_id[1]  + ","+fri_id[0] +")";	
		NativeQuery query = getSession().createNativeQuery(sql);
		int i = query.executeUpdate();
		System.out.println("i ==" + i );
			if(i==2){
				return true;
			}
		
		return false;
	}
	
	public  boolean del(int[] fri_id){

		if(!fri_id.equals(null)){
		for(int i = 0 ; i <fri_id.length;i++){
			Query query =getSession().createQuery("from Fri_VO where fri_id =" +fri_id[i]);
			Fri_VO vo =(Fri_VO) query.getSingleResult();
			getSession().delete(vo);
			}
		return true;
		}
		return false;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}

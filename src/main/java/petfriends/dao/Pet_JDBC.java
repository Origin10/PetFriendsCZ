package petfriends.dao;


import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.Pet_VO;
@Repository
@Transactional
public class Pet_JDBC  {
	@Autowired
	private SessionFactory sessionFactory;

	public Pet_JDBC(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

//	public static void main(String[] args ){
//		Pet_JDBC p = new Pet_JDBC(HibernateUtil.getSessionFactory());
	
//			Pet_VO vo = new Pet_VO();
//			vo.setPet_name("AOA");
//			vo.setMem_id(1);
//			vo.setPet_info("AOA");
//			boolean result = p.insert_pet(vo);
//			 System.out.println(result);
		
//			List<Pet_VO> list = p.select_pet_list(2);
//				 System.out.println(list  +"   ");
//		
//			Pet_VO vo = p.select_pet_info(2);
//			System.out.println(vo);

//			List<Pet_VO> vo = p.select_pet_list(1);
//			for(Pet_VO aa:vo ){
//				System.out.println(aa);
//				
//			}
				 
//	}
	

	public boolean insert_pet(Pet_VO pbean) {             			 //OK
			String insert_Pet = "insert into pet(pet_name,pet_photo,pet_info,mem_id) values (:name,:photo,:info,:id)";
			NativeQuery  query = getSession().createNativeQuery(insert_Pet);
			query.setParameter("name",pbean.getPet_name());
			query.setParameter("photo",pbean.getPet_photo());
			query.setParameter("info",pbean.getPet_info());
			query.setParameter("id",pbean.getMem_id());
			int i = query.executeUpdate();
		if(i==1){
				return true;
			}return false;
	}

//	public List<Pet_VO> select_pet_name(int mem_id) { 				  //OK
//		List<Pet_VO>  result = null;
//			try{
//				getSession().beginTransaction();
//				String select = "select p.pet_name from pet p join mem m on m.mem_id = p.mem_id where p.mem_id= :id ";
//				NativeQuery  query = getSession().createNativeQuery(select);
//				query.setParameter("id",mem_id);
//				result = query.list();
//					getSession().getTransaction().commit();
//			}catch(RuntimeException ex){	
//					throw ex;
//			}finally{
//				
//			}
//				return result;
//		}
	
	public Pet_VO select_pet(int pet_id) { 				  //OK
		return (Pet_VO) getSession().get(Pet_VO.class, pet_id);
	}
	

	public List<Pet_VO> select_pet_list(int mem_id) {			//OK
		
		String select = "select p.* from pet p join mem m on m.mem_id = p.mem_id where p.mem_id=";
		List<Pet_VO> result =  getSession().createNativeQuery(select + mem_id).addEntity(Pet_VO.class).list();
			return result;
		}
	
	
	public boolean delete(Pet_VO pbean) {						//ok
		if(pbean != null){
			getSession().delete(pbean);
			return true;
		}
		return false;
}
	
	
	
	public boolean Update_pet(Pet_VO pbean) {						//ok
		if(pbean!= null){
			 getSession().update(pbean);
			 return true;
		}
		return false;
	}




}

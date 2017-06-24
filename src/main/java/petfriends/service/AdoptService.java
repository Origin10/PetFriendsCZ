package petfriends.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.model.AdoptBean;
import petfriends.model.AdoptDAO;
@Service
public class AdoptService {
	@Autowired
	private AdoptDAO adoptDAO;
	public AdoptService(AdoptDAO adoptDAO){
		this.adoptDAO=adoptDAO;
	}
	/*public static void main(String[] args) {

		ApplicationContext context = new AnnotationConfigApplicationContext(HibernateConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		AdoptService adoptService = (AdoptService) context.getBean("adoptService");
		AdoptBean bean = new AdoptBean();
		bean.setPetForm(1);
		bean.setUserName("Mr.Hsu");
		bean.setUserEmail("sksly789@gmail.com");
		bean.setUserPhone("0989739908");
		bean.setPetName("rabbit");
		bean.setPetType("兔子");
		bean.setPetFeature("White mix Gray hear");
		bean.setFindCity("新北市");
		bean.setFindDistrict("中和區");
		bean.setFindRoad("民德路");
		bean.setFindDate(new java.petfriends.util.Date());
		bean.setPetGender("");
		bean.setPetNotes("She is so cute.");

		adoptService.insert(bean);
		sessionFactory.getCurrentSession().getTransaction().commit();
		((ConfigurableApplicationContext) context).close();
	}*/
	
	
	public List<AdoptBean> select(AdoptBean bean) {
		List<AdoptBean> result = null;
		if(bean!=null && bean.getAId()!=0) {
			AdoptBean temp = adoptDAO.select(bean.getAId());
			if(temp!=null) {
				result = new ArrayList<AdoptBean>();
				result.add(temp);
			}
		} else {
			result = adoptDAO.select(); 
		}
		return result;
	}
	public AdoptBean select(int AId) {
		AdoptBean result = null;
		if(AId>0) {
			result = adoptDAO.select(AId);
		}
		return result;
	}	
	public AdoptBean insert(AdoptBean bean) {
		AdoptBean result = null;
		if(bean!=null) {
			result = adoptDAO.insert(bean);
		}
		return result;
	}
	public AdoptBean update(AdoptBean bean) {
		AdoptBean result = adoptDAO.select(bean.getAId());
		if(bean!=null) {
			result.setUserTitle(bean.getUserTitle());
			result.setUserName(bean.getUserName());
			result.setUserPhone(bean.getUserPhone());
			result.setUserEmail(bean.getUserEmail());
			result.setPetName(bean.getPetName());
			result.setPetType(bean.getPetType());
			result.setPetBreeds(bean.getPetBreeds());
			result.setPetFeature(bean.getPetFeature());
			result.setFindCity(bean.getFindCity());
			result.setFindDistrict(bean.getFindDistrict());
			result.setFindRoad(bean.getFindRoad());
			result.setFindDate(bean.getFindDate());
			result.setIcNumber(bean.getIcNumber());
			result.setPetGender(bean.getPetGender());
			result.setPetNotes(bean.getPetNotes());
		}
		return result;
	}
	public boolean delete(AdoptBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = adoptDAO.delete(bean.getAId());
		}
		return result;
	}
}

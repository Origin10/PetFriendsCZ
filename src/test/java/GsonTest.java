import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import petfriends.model.AdoptBean;
import petfriends.model.AdoptPhotoUrlBean;

public class GsonTest {

	public static void main(String[] args) {
		
		//第一個BEAN
		AdoptBean bean=new AdoptBean();
		bean.setAId(1);
		bean.setUserTitle("這是一個標題");
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
		bean.setFindDate(new java.util.Date());
		bean.setPetGender("女性");
		bean.setPetNotes("She is so cute.");
		//第一個BEAN的URL
		AdoptPhotoUrlBean apuBean=new AdoptPhotoUrlBean();
		apuBean.setAdoptBean(bean);
		apuBean.setPhotoOrder(1);
		apuBean.setPhotoUrl("http//ssss/");
		apuBean.setUrlId(1);
		//第一個BEAN的第二個URL
		AdoptPhotoUrlBean apuBean2=new AdoptPhotoUrlBean();
		apuBean2.setAdoptBean(bean);
		apuBean2.setPhotoOrder(2);
		apuBean2.setPhotoUrl("http//aaaa/");
		apuBean2.setUrlId(2);
		
		//第二個BEAN
		AdoptBean bean2=new AdoptBean();
		bean2.setAId(2);
		bean2.setUserTitle("這是第二個");
		bean2.setPetForm(1);
		bean2.setUserName("徐先生");
		bean2.setUserEmail("sksly789@yahoo.com.tw");
		bean2.setUserPhone("0987878787");
		bean2.setPetName("dog");
		bean2.setPetType("大狗");
		bean2.setPetFeature("White mix black hear");
		bean2.setFindCity("新北市");
		bean2.setFindDistrict("中和區");
		bean2.setFindRoad("莒光路");
		bean2.setFindDate(new java.util.Date());
		bean2.setPetGender("男性");
		bean2.setPetNotes("He is so big.");

		//第二個BEAN的URL
		AdoptPhotoUrlBean apuBean3=new AdoptPhotoUrlBean();
		apuBean3.setAdoptBean(bean2);
		apuBean3.setPhotoOrder(1);
		apuBean3.setPhotoUrl("http//bbb/");
		apuBean3.setUrlId(3);
		
		Set<AdoptPhotoUrlBean> apuBeans=new HashSet<AdoptPhotoUrlBean>();
		apuBeans.add(apuBean);
		apuBeans.add(apuBean2);
		
		//System.out.println(apuBean);
		//System.out.println(apuBean2);
		
		Set<AdoptPhotoUrlBean> apuBeans2=new HashSet<AdoptPhotoUrlBean>();
		apuBeans2.add(apuBean3);
		
		bean2.setAdoptPhotoUrlBeans(apuBeans2);
		
		bean.setAdoptPhotoUrlBeans(apuBeans);
		
		List<AdoptBean> adoptBeans=new ArrayList<AdoptBean>();
		adoptBeans.add(bean);
		adoptBeans.add(bean2);
		//Gson gson = new Gson();
		
		
		Gson gson=new GsonBuilder().setExclusionStrategies(new ExclusionStrategy() {  
            
            @Override  
            public boolean shouldSkipField(FieldAttributes f) {  
            	return f.getName().contains("adoptBean");  
            }  
              
            @Override  
            public boolean shouldSkipClass(Class<?> clazz) {  
                return false; 
            }  
        }).create();
		
		String json=gson.toJson(adoptBeans);
		System.out.println(json);
	}

}

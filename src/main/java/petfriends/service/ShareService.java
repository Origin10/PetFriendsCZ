package petfriends.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.dao.Share_JDBC;
import petfriends.model.Share_VO;
@Service
public class ShareService {
	@Autowired
	private static SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	private Share_JDBC share;
	public ShareService(Share_JDBC share) {
		this.share = share;
	}
		public List<Share_VO> select_all(int id ){
			List<Share_VO>  result = share.select_BY_MEMID(id);
			if(result != null){
				return result;
			}
			return null;
				
		}

		
		public boolean update(int sid, String content ,int mid){
			String  valid = share.select_valid(mid);
			Share_VO sbean	=  share.select_share(sid);			
			if(valid == null && sbean == null){
				sbean.setShare_Id(sid);
				sbean.setShare_content(content);
				sbean.setShare_date(sdf.format(new java.util.Date().getTime()));
				share.Update_share(sbean);
				return true;
			}
			if(!sbean.getShare_content().equals(content)){
				sbean.setShare_Id(sid);
				sbean.setShare_content(content);
				sbean.setShare_date(sdf.format(new java.util.Date().getTime()));
				share.Update_share(sbean);
			return true;
			}
			return false;
		}
		
		
		
		public String  select_valid(int mem_id){
			String result =share.select_valid(mem_id);
			if (result !=null){
				return result;
			}
			return null;
		}
		
		public  boolean insert_Share(String share_context, int mem_id){
			boolean result = share.insert_Share(share_context, mem_id);
			if(result){
				return result;
			}
				return false;
				
			}
		
		
		public boolean delete(int sid){
			Share_VO  sbean =share.select_share(sid);
			if(sbean != null){
				boolean  result =share.delete(sbean);
			}return false;
			
		
		}
}

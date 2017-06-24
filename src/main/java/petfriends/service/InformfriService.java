package petfriends.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.dao.Checkfri;
import petfriends.dao.Mem_JDBC;
import petfriends.model.Informfri_VO;
@Service
public class InformfriService {
	@Autowired
	private Checkfri chfri;

	
	public InformfriService (Checkfri chfri){
		this.chfri = chfri;
	}
	
	public  List<Informfri_VO> select_info(int to_mem_id){
		List<Informfri_VO> inbean =	chfri.select_to_who(to_mem_id);
		if(inbean != null){
			return inbean;
		}
		return null;
	}
	
	public boolean delete(int[] num){
		boolean result = false;
	Informfri_VO iobj = chfri.select_who_send(num[1],num[0]);
				if(iobj != null){
					result = chfri.delete(iobj);
				}
		
		return result;
		
	}
	
	public boolean insert(int[] num){
			boolean  result= chfri.insert_invalid(num[1], num[0]);			
			if(result ){
				return result;
			}
	return result;
	}
	
	
	
	
	
	
	
}

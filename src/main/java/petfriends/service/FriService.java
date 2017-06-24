package petfriends.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.dao.Fri;
import petfriends.model.Fri_VO;

@Service
public class FriService {
	@Autowired
	private Fri fri;
	public FriService(Fri fri){
		this.fri = fri;
	}
	
	public int[] list (int mem_id ,int mem_fri_id){
		
		List<Fri_VO> fbean = fri.select(mem_id, mem_fri_id);
		int[] num = {fbean.get(0).getFri_id(),fbean.get(1).getFri_id()};
		
		return num;
	}

	public boolean insertFri(int[] fri_id){
		boolean result = fri.insert(fri_id);
		if(result){
			return result;
		}	
		return false;
	}
	
	public boolean delFri(int[] fri_id){
		int[] a = this.list(fri_id[0], fri_id[1]);
		boolean result = fri.del(a);
		if(result){
			return result;
		}
		
		return false;
	}
	
	
	
	

}

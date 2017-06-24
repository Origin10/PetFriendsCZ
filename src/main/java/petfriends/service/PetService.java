package petfriends.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.dao.Pet_JDBC;
import petfriends.model.Pet_VO;
@Service
public class PetService {
	@Autowired
	private Pet_JDBC pet;
	public PetService(Pet_JDBC pet) {
		this.pet = pet;
	}

	
	public boolean insert(Pet_VO pbean){			//ok
		boolean result = pet.insert_pet(pbean);
		if(result){
			 return result;
		}
		return false;
	}
	
	public byte[] select_photo (int pid){				//ok
		Pet_VO  vo = pet.select_pet(pid);	
		if(vo !=null){
			byte[] image = vo.getPet_photo();
			return image;
		}
		return null;
	}
	
	
	public Pet_VO select_info(int pid){				//ok
		Pet_VO  vo = pet.select_pet(pid);		
		if(vo != null){	
			return vo;	
	}
			return null;
		}
	
	
	public boolean pupdate(Pet_VO pbean){
			Pet_VO  vo = pet.select_pet(pbean.getPet_id());
			boolean result =false;
			if(pbean.getPet_photo() != null){
				vo.setPet_name(pbean.getPet_name());
				vo.setPet_info(pbean.getPet_info());
				vo.setPet_photo(pbean.getPet_photo());
				 result = pet.Update_pet(vo);
			}else{
				vo.setPet_name(pbean.getPet_name());
				vo.setPet_info(pbean.getPet_info());
				 result = pet.Update_pet(vo);
			}
		return result;
	}
	
	
	
	public boolean pdelete(int pid){
		boolean result =false;
		Pet_VO vo = pet.select_pet(pid);
		if(vo != null){
		 result = pet.delete(vo);
		return result;
		}
		return result;
	}
	
	
	public List<Pet_VO> select_pet_all(int mem_id){
		List<Pet_VO> pbean = null;
		pbean =	pet.select_pet_list(mem_id);
		if(pbean != null){
			return pbean;
		}
		return pbean;
	}
	
}


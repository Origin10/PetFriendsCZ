package petfriends.dao;

import java.util.List;

import petfriends.model.Pet_VO;
import petfriends.model.Share_VO;

public interface PetInterFace {
	boolean insert_pet(Pet_VO pbean);
	
	List<byte[]> select_pet_photo(int mem_id);
	
	List<Pet_VO> select_pet_name(int mem_id);
	
	Pet_VO select_pet_info(int pid);
	
	boolean Update_pet(Pet_VO pbean);
	
	List<Pet_VO> select_pet_list(int mem_id);
}

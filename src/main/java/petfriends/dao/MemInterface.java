package petfriends.dao;


import java.util.List;

import petfriends.model.Mem_VO;


interface MemInterface {
//	 Mem_VO insert_Mem(Mem_VO bean);
//	 
	Mem_VO select_id(int mem_id);
	 
	boolean insert_Mem(Mem_VO bean);
	
	 Mem_VO select_email(String mem_mail);
	 
	 List<Mem_VO> select_fri_info(int mem_id);
	 
//	 List<Mem_VO> select_all();
	 
//	 
//	 boolean delete(int id);
}

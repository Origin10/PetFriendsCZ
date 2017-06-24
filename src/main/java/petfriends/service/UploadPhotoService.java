package petfriends.service;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.dao.Pet_JDBC;
import petfriends.model.Pet_VO;

@Service
public class UploadPhotoService {
	@Autowired
	private Pet_JDBC pet;
	UploadPhotoService(Pet_JDBC pet){
		this.pet=pet;
	}
	
	public Pet_VO petPhoto(InputStream in){
		Pet_VO pbean = null;
		if(in != null){
			pet.insert_pet(pbean);
		}
		
		
		return pbean;
	}
}

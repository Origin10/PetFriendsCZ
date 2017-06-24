package petfriends.service.impl;

import petfriends.model.MemShipping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.service.MemShippingService;

import petfriends.repository.MemShippingRepository;

@Service
public class MemShippingServiceImpl implements MemShippingService {
	
	@Autowired
	private MemShippingRepository memShippingRepository;
	
	
	public MemShipping findById(Long id) {
		return memShippingRepository.findOne(id);
	}
	
	public void removeById(Long id) {
		memShippingRepository.delete(id);
	}

}

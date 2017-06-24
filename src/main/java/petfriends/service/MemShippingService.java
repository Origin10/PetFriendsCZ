package petfriends.service;

import petfriends.model.MemShipping;

public interface MemShippingService {
	MemShipping findById(Long id);
	
	void removeById(Long id);
}

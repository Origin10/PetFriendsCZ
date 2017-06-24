package petfriends.service;

import petfriends.model.UserPayment;

public interface MemPaymentService {
	UserPayment findById(Long id);
	
	void removeById(Long id);
}

package petfriends.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import petfriends.model.UserPayment;
import petfriends.service.MemPaymentService;

import petfriends.repository.MemPaymentRepository;

@Service
public class MemPaymentServiceImpl implements MemPaymentService {

	@Autowired
	private MemPaymentRepository memPaymentRepository;
		
	public UserPayment findById(Long id) {
		return memPaymentRepository.findOne(id);
	}
	
	public void removeById(Long id) {
		memPaymentRepository.delete(id);
	}
} 

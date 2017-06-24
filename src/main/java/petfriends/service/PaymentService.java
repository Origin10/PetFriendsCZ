package petfriends.service;

import petfriends.model.Payment;
import petfriends.model.UserPayment;

public interface PaymentService {
	Payment setByUserPayment(UserPayment userPayment, Payment payment);
}

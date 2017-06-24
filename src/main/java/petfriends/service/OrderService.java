package petfriends.service;

import petfriends.model.*;


public interface OrderService {
	Order createOrder(ShoppingCart shoppingCart,
			ShippingAddress shippingAddress,
			BillingAddress billingAddress,
			Payment payment,
			String shippingMethod,
			Mem_VO mem);
	
	Order findOne(Long id);
}

package petfriends.service;

import petfriends.model.MemShipping;
import petfriends.model.ShippingAddress;

public interface ShippingAddressService {
	ShippingAddress setByUserShipping(MemShipping memShipping, ShippingAddress shippingAddress);
}

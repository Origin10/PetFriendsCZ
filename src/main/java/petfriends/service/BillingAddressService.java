package petfriends.service;

import petfriends.model.BillingAddress;
import petfriends.model.MemBilling;

public interface BillingAddressService {
	BillingAddress setByUserBilling(MemBilling memBilling, BillingAddress billingAddress);
}

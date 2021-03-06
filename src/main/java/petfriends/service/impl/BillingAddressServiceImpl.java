package petfriends.service.impl;

import org.springframework.stereotype.Service;

import petfriends.model.BillingAddress;
import petfriends.model.MemBilling;
import petfriends.service.BillingAddressService;

@Service
public class BillingAddressServiceImpl implements BillingAddressService{
	
	public BillingAddress setByUserBilling(MemBilling memBilling, BillingAddress billingAddress) {
		billingAddress.setBillingAddressName(memBilling.getUserBillingName());
		billingAddress.setBillingAddressStreet1(memBilling.getUserBillingStreet1());
		billingAddress.setBillingAddressStreet2(memBilling.getUserBillingStreet2());
		billingAddress.setBillingAddressCity(memBilling.getUserBillingCity());
		billingAddress.setBillingAddressState(memBilling.getUserBillingState());
		billingAddress.setBillingAddressCountry(memBilling.getUserBillingCountry());
		billingAddress.setBillingAddressZipcode(memBilling.getUserBillingZipcode());
		
		return billingAddress;
	}

}

package petfriends.repository;

import org.springframework.data.repository.CrudRepository;

import petfriends.model.UserPayment;

public interface MemPaymentRepository extends CrudRepository<UserPayment, Long>{

}

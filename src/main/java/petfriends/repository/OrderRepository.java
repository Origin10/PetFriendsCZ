package petfriends.repository;

import org.springframework.data.repository.CrudRepository;

import petfriends.model.Order;

public interface OrderRepository extends CrudRepository<Order, Long>{

}

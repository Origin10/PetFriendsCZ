package petfriends.repository;


import org.springframework.data.repository.CrudRepository;
import petfriends.model.ShoppingCart;

public interface ShoppingCartRepository extends CrudRepository<ShoppingCart, Long> {

}

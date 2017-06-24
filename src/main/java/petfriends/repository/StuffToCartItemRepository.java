package petfriends.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import petfriends.model.StuffToCartItem;
import petfriends.model.CartItem;

@Transactional
public interface StuffToCartItemRepository extends CrudRepository<StuffToCartItem, Long> {
	void deleteByCartItem(CartItem cartItem);
}

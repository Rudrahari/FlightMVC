package flight.app.repository;

import flight.app.entities.Card;
import flight.app.entities.User;

public interface UserDao {

	int insertUser(User user);
	User validateUser(String email);
	User getUser(String email);
	User getUser(int id);
	int updateUser(User user);
	int insertDefaultCardDetails();
	int updateCardDetails(Card card);
	int deleteCardDetails(int id);
	Card getCard(int id);
}

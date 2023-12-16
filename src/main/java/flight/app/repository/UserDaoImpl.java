package flight.app.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import flight.app.entities.Card;
import flight.app.entities.User;

public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		String INSERTQUERY;
		INSERTQUERY="insert into user(full_name,email,mobile,dob,gender,password_salt,password_hash) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERTQUERY,user.getFullName(),user.getEmail(),
				user.getMobile(),user.getDob(),user.getGender(),user.getPasswordSalt(),user.getPasswordHash());
	}

	@Override
	public User validateUser(String email) {
		// TODO Auto-generated method stub
		String GET_PASSWORD="select * from user where email=?";
		System.out.println(email);
		return jdbcTemplate.queryForObject(GET_PASSWORD, new UserRowMapper(),email);
	}

	@Override
	public User getUser(String email) {
		// TODO Auto-generated method stub
		String GET_USER="select * from user where email=?";
		User user=jdbcTemplate.queryForObject(GET_USER, new UserRowMapper(),email);
		return user;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		String UPDATE_QUERY="update user set full_name=?,email=?,mobile=?,dob=?,gender=? where id=?";
		return jdbcTemplate.update(UPDATE_QUERY,user.getFullName(),user.getEmail(),
				user.getMobile(),user.getDob(),user.getGender(),user.getId());
	}

	@Override
	public int insertDefaultCardDetails() {
		// TODO Auto-generated method stub  `card_type`, `card_no`, `expiry_date`, `status`
		String INSERT_QUERY="insert into user_card_details(card_type,card_no,expiry_date,status) values(?,?,?,?)";
		return jdbcTemplate.update(INSERT_QUERY,null,null,null,false);
	}

	@Override
	public int updateCardDetails(Card card) {
		// TODO Auto-generated method stub
		String UPDATE_QUERY="update user_card_details set card_type=?,card_no=?,expiry_date=?,status=? where id=?";
		return jdbcTemplate.update(UPDATE_QUERY,card.getCardType(),card.getCardNo(),card.getExpiryDate(),card.isStatus(),card.getId());
	}

	@Override
	public int deleteCardDetails(int id) {
		// TODO Auto-generated method stub
		String DELETE_QUERY="update user_card_details set status=? where id=?";
		return jdbcTemplate.update(DELETE_QUERY,false,id);
	}

	@Override
	public Card getCard(int id) {
		// TODO Auto-generated method stub
		String GET_CARD="select * from user_card_details where id=?";
		return jdbcTemplate.queryForObject(GET_CARD,new CardRowMapper(),id);
	}

	@Override
	public User getUser(int id) {
		// TODO Auto-generated method stub
		String GET_USER="select * from user where id=?";
		return jdbcTemplate.queryForObject(GET_USER,new UserRowMapper(),id);
	}


	 
}

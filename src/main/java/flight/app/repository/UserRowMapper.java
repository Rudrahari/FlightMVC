package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		User user=new User();
		user.setId(rs.getInt("id"));
		user.setFullName(rs.getString("full_name"));
		user.setEmail(rs.getString("email"));
		user.setDob(rs.getDate("dob"));
		user.setGender(rs.getString("gender"));
		user.setMobile(rs.getString("mobile"));
		user.setPasswordSalt(rs.getString("password_salt"));
		user.setPasswordHash(rs.getString("password_hash"));
		return user;
	}

	
}

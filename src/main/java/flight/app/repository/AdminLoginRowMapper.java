package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.AdminLogin;

public class AdminLoginRowMapper implements RowMapper<AdminLogin> {

	@Override
	public AdminLogin mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		AdminLogin admin=new AdminLogin();
		//admin.setEmail(rs.getString("email"));
		admin.setPasswordSalt(rs.getString("password_salt"));
		admin.setPasswordHash(rs.getString("password_hash"));
		return admin;
	}

	

}

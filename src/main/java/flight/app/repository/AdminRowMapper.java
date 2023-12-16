package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.Admin;

public class AdminRowMapper implements RowMapper<Admin> {

	@Override
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Admin admin=new Admin();
		admin.setId(rs.getInt("id"));
		admin.setFullName(rs.getString("full_name"));
		admin.setEmail(rs.getString("email"));
		admin.setMobile(rs.getString("mobile"));
		admin.setActive(rs.getBoolean("is_active"));
		admin.setDob(rs.getDate("dob"));
		admin.setGender(rs.getString("gender"));
		admin.setPasswordSalt(rs.getString("password_salt"));
		admin.setPasswordHash(rs.getString("password_hash"));
		admin.setRoot(rs.getBoolean("is_root"));
		return admin;
	}

}

package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.Airlines;

public class AirlinesSeatsRowMapper implements RowMapper<Airlines> {

	@Override
	public Airlines mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Airlines airlines=new Airlines();
		airlines.setId(rs.getInt("id"));
		airlines.setAirlinesName(rs.getString("airlines"));
		airlines.setFlightModel(rs.getString("flight_model"));
		airlines.setFlightNo(rs.getString("flight_no"));
		airlines.setTotalSeats(rs.getInt("total_seats"));
		airlines.setEconomyClassSeats(rs.getInt("economy_class_seats"));
		airlines.setFirstClassSeats(rs.getInt("first_class_seats"));
		airlines.setBusinessClasSeats(rs.getInt("business_class_seats"));
		return airlines;
	}

}

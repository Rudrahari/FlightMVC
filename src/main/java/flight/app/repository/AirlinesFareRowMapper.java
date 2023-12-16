package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.AirlinesFare;

public class AirlinesFareRowMapper implements RowMapper<AirlinesFare> {

	@Override
	public AirlinesFare mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		AirlinesFare fare=new AirlinesFare();
		fare.setId(rs.getInt("id"));
		fare.setAirlines(rs.getString("airlines"));
		fare.setFlightNo(rs.getString("flight_no"));
		fare.setFlightModel(rs.getString("flight_model"));
		fare.setEconomyClassFare(rs.getDouble("economy_class_fare"));
		fare.setFirstClassFare(rs.getDouble("first_class_fare"));
		fare.setBusinessClassFare(rs.getDouble("business_class_fare"));
		return fare;
	}

}

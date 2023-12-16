package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.FlightAvailability;

//`airlines`, `flight_no`, `flight_model`, `total_seats`, `economy_class_seats`, `first_class_seats`, `business_class_seats`
public class FlightAvailabilityRowMapper implements RowMapper<FlightAvailability>{

	@Override
	public FlightAvailability mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		FlightAvailability flight=new FlightAvailability();
		flight.setAirlines(rs.getString("airlines"));
		flight.setFlightNo(rs.getString("flight_no"));
		flight.setFlightModel(rs.getString("flight_model"));
		flight.setTotalSeats(rs.getInt("total_seats"));
		flight.setEconomyClassSeats(rs.getInt("economy_class_seats"));
		flight.setBusinessClassSeats(rs.getInt("business_class_seats"));
		flight.setFirstClassSeats(rs.getInt("first_class_seats"));
		return flight;
	}

}

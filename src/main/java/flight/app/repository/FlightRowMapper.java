package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.Flight;

public class FlightRowMapper implements RowMapper<Flight>{

	@Override
	public Flight mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Flight flight=new Flight();
		flight.setId(rs.getInt("id"));
		flight.setAirlines(rs.getString("airlines"));
		flight.setFlightModel(rs.getString("flight_model"));
		flight.setFlightNo(rs.getString("flight_no"));
		flight.setSource(rs.getString("source_place"));
		flight.setDestination(rs.getString("destination_place"));
		flight.setSourceTimeZone(rs.getString("source_time_zone"));
		flight.setDestinationTimeZone(rs.getString("destination_time_zone"));
		flight.setTotalDuration(rs.getDouble("total_travel_duration"));
		flight.setSourceDate(rs.getDate("source_date"));
		flight.setDestinationDate(rs.getDate("destination_date"));
		flight.setSourceTime(rs.getTime("source_time"));
		flight.setDestinationTime(rs.getTime("destination_time"));
		flight.setStatus(rs.getBoolean("status"));
		
		
		return flight;
	}

}

package flight.app.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.Flight;
import flight.app.entities.SearchFlight;
public class FlightDaoImpl implements FlightDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
    
	@Override
	public List<Flight> viewSearchedFlights(SearchFlight searchFlight) {
		// TODO Auto-generated method stub
		//String SEARCH_QUERY="SELECT * FROM flight WHERE source_place =? AND destination_place =? AND ((source_date > ?) OR (source_date = ? AND source_time > CURRENT_TIME)) AND status =?";
		
		String SEARCH_QUERY="SELECT *\r\n"
				+ "FROM flight\r\n"
				+ "WHERE source_place =?\r\n"
				+ "    AND destination_place =?\r\n"
				+ "    and source_date = ?\r\n"
				+ "    AND (? > current_date or (? = current_date AND source_time > CURRENT_TIME))\r\n"
				+ "    AND status = ?;\r\n"
				+ "";
		
		List<Flight> flights=jdbcTemplate.query(SEARCH_QUERY,new FlightRowMapper(),searchFlight.getSourcePlace(), 
				searchFlight.getDestinationPlace(),searchFlight.getTravelDate(),searchFlight.getTravelDate(),searchFlight.getTravelDate(),true);
		return flights;
	}

	@Override
	public List<AirlinesFare> getAirlinesFareOfSearchedFlights(List<Flight> flight) {
		// TODO Auto-generated method stub
		List<AirlinesFare> allAirlinesFare=new ArrayList<AirlinesFare>();
		String SEARCH_QUERY="select * from airlines_fare where id=? and status=?";
		//System.out.println(flight.get(0).getFlightNo());
		for(int i=0;i<flight.size();i++)
		{
			AirlinesFare fare=jdbcTemplate.queryForObject(SEARCH_QUERY,new AirlinesFareRowMapper(),flight.get(i).getId(),true);
			allAirlinesFare.add(fare);
		}
		return allAirlinesFare;
	}

	@Override
	public List<Airlines> getSeatsAvailabilityOfSearchedFlights(List<Flight> flight) {
		// TODO Auto-generated method stub
		List<Airlines> flightSeats=new ArrayList<Airlines>();
		String SEARCH_QUERY="select * from flight_seats_availability where id=? and status=?";
		System.out.println("works");
		for(int i=0;i<flight.size();i++)
		{
			Airlines seats=jdbcTemplate.queryForObject(SEARCH_QUERY, new AirlinesSeatsRowMapper(),flight.get(i).getId(),true);
			System.out.println(seats);
			flightSeats.add(seats);
		}
		
		return flightSeats;
	}

	@Override
	public List<Flight> viewSearchedFlightsWithoutDate(SearchFlight searchFlight) {
		// TODO Auto-generated method stub
		String SEARCH_QUERY="SELECT * FROM flight WHERE source_place = ? AND destination_place = ? AND status = ? AND source_date >= CURRENT_DATE AND (source_date > CURRENT_DATE OR (source_date = CURRENT_DATE AND source_time > CURRENT_TIME))";
		List<Flight> flights=jdbcTemplate.query(SEARCH_QUERY, new FlightRowMapper(),searchFlight.getSourcePlace(),searchFlight.getDestinationPlace(),true);
		return flights;
	}

}

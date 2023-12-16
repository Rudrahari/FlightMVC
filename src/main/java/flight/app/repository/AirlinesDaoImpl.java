package flight.app.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Flight;

public class AirlinesDaoImpl implements AirlinesDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public int insertAirlines(Airlines airlines) {
		
		String INSERTQUERY;
		INSERTQUERY="insert into airlines(airlines,flight_no,flight_model,total_seats,"
				+ "economy_class_seats,first_class_seats,business_class_seats,status) values(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERTQUERY,airlines.getAirlinesName(),airlines.getFlightNo(),
				airlines.getFlightModel(),airlines.getTotalSeats(),airlines.getEconomyClassSeats(),
				airlines.getFirstClassSeats(),airlines.getBusinessClasSeats(),true);
	}
	@Override
	public int updateAirlines(Airlines airlines) {
		// TODO Auto-generated method stub
		String UPDATEQUERY;
		UPDATEQUERY="update airlines set total_seats=?,economy_class_seats=?,first_class_seats=?,business_class_seats=?,flight_no=?,flight_model=? where id=?";
		return jdbcTemplate.update(UPDATEQUERY,airlines.getTotalSeats(),airlines.getEconomyClassSeats(),
				                   airlines.getFirstClassSeats(),airlines.getBusinessClasSeats(),airlines.getFlightNo(),airlines.getFlightModel(),airlines.getId());
	}
	

	@Override
	public int insertAirlinesFare(AirlinesFare airlinesFare) {
		// TODO Auto-generated method stub
		
		String INSERTQUERY;
		
		INSERTQUERY="insert into airlines_fare(airlines,flight_model,flight_no,economy_class_fare,first_class_fare,business_class_fare,status) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERTQUERY,airlinesFare.getAirlines(),
				airlinesFare.getFlightModel(),airlinesFare.getFlightNo(),
				airlinesFare.getEconomyClassFare(),
				airlinesFare.getFirstClassFare(),airlinesFare.getBusinessClassFare(),true);
	}

	@Override
	public int insertFlight(Flight flight) {
		// TODO Auto-generated method stub
		
		String INSERTQUERY;
		INSERTQUERY="insert into flight(airlines,flight_no,flight_model,source_place,destination_place,source_time_zone,destination_time_zone,total_travel_duration,source_date,source_time,destination_date,destination_time,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERTQUERY,flight.getAirlines(),flight.getFlightNo(),flight.getFlightModel(),flight.getSource(),
				flight.getDestination(),flight.getSourceTimeZone(),flight.getDestinationTimeZone(),
				flight.getTotalDuration(),flight.getSourceDate(),flight.getSourceTime(),
				flight.getDestinationDate(),flight.getDestinationTime(),true);
	}

	@Override
	public int updateAirlinesFare(AirlinesFare airlinesFare) {
		// TODO Auto-generated method stub
		String UPDATEQUERY;
		UPDATEQUERY="update airlines_fare set economy_class_fare=?,first_class_fare=?,business_class_fare=? where id=?";
		return jdbcTemplate.update(UPDATEQUERY,airlinesFare.getEconomyClassFare(),airlinesFare.getFirstClassFare(),
				airlinesFare.getBusinessClassFare(),airlinesFare.getId());
	}

	@Override
	public int updateFlight(Flight flight) {
		// TODO Auto-generated method stub
		
		String UPDATEQUERY="update flight set airlines=?,flight_model=?,source_place=?,destination_place=?,source_time_zone=?,destination_time_zone=?,total_travel_duration=?,source_date=?,source_time=?,destination_date=?,destination_time=?,flight_no=? where id=?";
		
		return jdbcTemplate.update(UPDATEQUERY,flight.getAirlines(),flight.getFlightModel(),
				flight.getSource(),flight.getDestination(),flight.getSourceTimeZone(),
				flight.getDestinationTimeZone(),flight.getTotalDuration(),flight.getSourceDate(),
				flight.getSourceTime(),flight.getDestinationDate(),flight.getDestinationTime(),
				flight.getFlightNo(),flight.getId());
	}

	@Override
	public int insertFlightSeatsAvailability(Airlines airlines) {
		// TODO Auto-generated method stub
		String INSERT_QUERY="insert into flight_seats_availability (airlines,flight_no,flight_model,total_seats,economy_class_seats,first_class_seats,business_class_seats,status) values(?,?,?,?,?,?,?,?);";
		return jdbcTemplate.update(INSERT_QUERY,airlines.getAirlinesName(),airlines.getFlightNo(),
				airlines.getFlightModel(),airlines.getTotalSeats(),
				airlines.getEconomyClassSeats(),airlines.getFirstClassSeats(),airlines.getBusinessClasSeats(),true);
	}

	@Override
	public Airlines getFlightSeats(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines where id=? and status=?";
		
		Airlines airlines = jdbcTemplate.queryForObject(GET_QUERY,new AirlinesSeatsRowMapper(),id,true);
		return airlines;
	}

	@Override
	public int updatePublishedFlightFare(String airlines, String flightNo, String flightModel,int id) {
		// TODO Auto-generated method stub
		String UPDATE_QUERY="update airlines_fare set airlines=?,flight_model=?,flight_no=? where id=?";
		return jdbcTemplate.update(UPDATE_QUERY,airlines,flightModel,flightNo,id);
	}

	@Override
	public int updatedPublishedFlightSeats(String airlines, String flightNo, String flightModel,int id) {
		// TODO Auto-generated method stub
		String UPDATE_QUERY="update flight_seats_availability set airlines=?,flight_model=?,flight_no=? where id=?";
		return jdbcTemplate.update(UPDATE_QUERY,airlines,flightModel,flightNo,id);
	}

	@Override
	public List<Flight> getallPublishedFlights() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where status=?";
		List<Flight> allFlights=jdbcTemplate.query(GET_QUERY, new FlightRowMapper(),true);
		return allFlights;
	}

	@Override
	public List<AirlinesFare> getallPublishedFlightsFare() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines_fare where status=?";
		List<AirlinesFare> allFlightsFare=jdbcTemplate.query(GET_QUERY, new AirlinesFareRowMapper(),true);
		return allFlightsFare;
	}

	@Override
	public List<Airlines> getallAirlinesAvailableSeats() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight_seats_availability where status=?";
		List<Airlines> allFlightsAvailableSeats=jdbcTemplate.query(GET_QUERY, new AirlinesSeatsRowMapper(),true);
		return allFlightsAvailableSeats;
	}

	@Override
	public List<Airlines> getAllAirlinesModel() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines where status=?";
		List<Airlines> allModels=jdbcTemplate.query(GET_QUERY, new AirlinesSeatsRowMapper(),true);
		return allModels;
	}

	@Override
	public List<BookingDetails> getAllPassengersList(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from booking_data where flight_id=?";
		List<BookingDetails> obj=jdbcTemplate.query(GET_QUERY, new BookingDetailsRowMapper(),id);
		return obj;
	}

	@Override
	public AirlinesFare getFareOfAFlight(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines_fare where id=?";
		AirlinesFare fare=jdbcTemplate.queryForObject(GET_QUERY, new AirlinesFareRowMapper(),id);
		return fare;
	}

	@Override
	public Flight getSelectedFlightDetails(String flightNo) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where flight_no=?";
		Flight flightDetails=jdbcTemplate.queryForObject(GET_QUERY,new FlightRowMapper(),flightNo);
		return flightDetails;
	}

	@Override
	public int deleteAirlines(int id) {
		// TODO Auto-generated method stub
		String DELETE_QUERY="update airlines set status=? where id=? ";
		return jdbcTemplate.update(DELETE_QUERY,false,id);
	}

	@Override
	public int deletePublishedFlight(int id) {
		// TODO Auto-generated method stub
		String DELETE_QUERY="update flight set status=? where id=?";
		return jdbcTemplate.update(DELETE_QUERY,false,id);
	}

	@Override
	public int deletePublishedFlightFare(int id) {
		// TODO Auto-generated method stub
		String DELETE_QUERY="update airlines_fare set status=? where id=?";
		return jdbcTemplate.update(DELETE_QUERY,false,id);
	}

	@Override
	public int deletePublishedFlightSeats(int id) {
		// TODO Auto-generated method stub
		String DELETE_QUERY="update flight_seats_availability set status=? where id=?";
		return jdbcTemplate.update(DELETE_QUERY,false,id);
	}

	@Override
	public Airlines getFlightSeats(String flightNo) {
		// TODO Auto-generated method stub
         String GET_QUERY="select * from airlines where flight_no=? and status=?";
		
		Airlines airlines = jdbcTemplate.queryForObject(GET_QUERY,new AirlinesSeatsRowMapper(),flightNo,true);
		return airlines;
	}

	@Override
	public Flight getSelectedFlightDetails(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where id=?";
		Flight flightDetails=jdbcTemplate.queryForObject(GET_QUERY,new FlightRowMapper(),id);
		return flightDetails;
	}

	@Override
	public List<Airlines> getAllDeletedAirlinesModel() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines where status=?";
		return jdbcTemplate.query(GET_QUERY,new AirlinesSeatsRowMapper(),false);
	}

	@Override
	public int addAirlinesToService(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="update airlines set status=? where id=? ";
		return jdbcTemplate.update(GET_QUERY,true,id);
	}

	@Override
	public List<Flight> getallDeletedFlights() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where status=?";
		List<Flight> allFlights=jdbcTemplate.query(GET_QUERY, new FlightRowMapper(),false);
		return allFlights;
	}

	@Override
	public List<AirlinesFare> getallDeletedFlightsFare() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines_fare where status=?";
		List<AirlinesFare> allFlightsFare=jdbcTemplate.query(GET_QUERY, new AirlinesFareRowMapper(),false);
		return allFlightsFare;
	}

	@Override
	public List<Airlines> getallDeletedAirlinesAvailableSeats() {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight_seats_availability where status=?";
		List<Airlines> allFlightsAvailableSeats=jdbcTemplate.query(GET_QUERY, new AirlinesSeatsRowMapper(),false);
		return allFlightsAvailableSeats;
	}

	@Override
	public int addFlightToService(int id) {
		// TODO Auto-generated method stub
		String ADD_FLIGHT="update flight set status=? where id=?";
		String ADD_FARE="update airlines_fare set status=? where id=?";
		String ADD_SEATS="update flight_seats_availability set status=? where id=?";
		return ((jdbcTemplate.update(ADD_FLIGHT,true,id) & jdbcTemplate.update(ADD_FARE,true,id)) & jdbcTemplate.update(ADD_SEATS,true,id));
	}
	




}

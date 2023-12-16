package flight.app.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Flight;
import flight.app.entities.FlightAvailability;
import java.sql.Date;
import java.time.LocalDate;

public class BookingDaoImpl implements BookingDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public Flight getSelectedFlight(List<Flight> flights, String flightNo) {
		// TODO Auto-generated method stub
		Flight flight=new Flight();
		for(int i=0;i<flights.size();i++)
		{
			if(flights.get(i).getFlightNo().equals(flightNo))
			{
				flight.setAirlines(flights.get(i).getAirlines());
				flight.setFlightNo(flights.get(i).getFlightNo());
				flight.setFlightModel(flights.get(i).getFlightModel());
				flight.setSource(flights.get(i).getSource());
				flight.setDestination(flights.get(i).getDestination());
				flight.setSourceDate(flights.get(i).getSourceDate());
				flight.setDestinationDate(flights.get(i).getDestinationDate());
				flight.setSourceTimeZone(flights.get(i).getSourceTimeZone());
				flight.setDestinationTimeZone(flights.get(i).getDestinationTimeZone());
				flight.setSourceTime(flights.get(i).getSourceTime());
				flight.setDestinationTime(flights.get(i).getDestinationTime());
				flight.setTotalDuration(flights.get(i).getTotalDuration());
				break;
			}
		}
		System.out.println(flight);
		System.out.println("inside");
		System.out.println(flights.get(0).getAirlines());
		return flight;
	}

	@Override
	public AirlinesFare getSelectedFlightFare(List<AirlinesFare> airlinesFare, String flightNo) {
		// TODO Auto-generated method stub
		AirlinesFare airlineFare=new AirlinesFare();
		for(int i=0;i<airlinesFare.size();i++)
		{
			if(airlinesFare.get(i).getFlightNo().equals(flightNo))
			{
				airlineFare.setAirlines(airlinesFare.get(i).getAirlines());
				airlineFare.setFlightNo(airlinesFare.get(i).getFlightNo());
				airlineFare.setFlightModel(airlinesFare.get(i).getFlightModel());
				airlineFare.setEconomyClassFare(airlinesFare.get(i).getEconomyClassFare());
				airlineFare.setBusinessClassFare(airlinesFare.get(i).getBusinessClassFare());
				airlineFare.setFirstClassFare(airlinesFare.get(i).getFirstClassFare());
				break;
			}
		}
			
		return airlineFare;
	}

	@Override
	public Airlines getSelectedFlightSeats(List<Airlines> airlines, String flightNo) {
		// TODO Auto-generated method stub
		Airlines airline=new Airlines();
		for(int i=0;i<airlines.size();i++)
		{
			if(airlines.get(i).getFlightNo().equals(flightNo))
			{
				airline.setAirlinesName(airlines.get(i).getAirlinesName());
				airline.setFlightNo(airlines.get(i).getFlightNo());
				airline.setFlightModel(airlines.get(i).getFlightModel());
				airline.setTotalSeats(airlines.get(i).getTotalSeats());
				airline.setEconomyClassSeats(airlines.get(i).getEconomyClassSeats());
				airline.setFirstClassSeats(airlines.get(i).getFirstClassSeats());
				airline.setBusinessClasSeats(airlines.get(i).getBusinessClasSeats());
				break;
			}
		}
		return airline;
	}

	@Override
	public int updatePublishedFlightSeatsAvailability(int id, int economySeats,int firstSeats, int businesSeats,
			int totalSeats) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight_seats_availability where id=? and status=?";
		FlightAvailability flight=jdbcTemplate.queryForObject(GET_QUERY, new FlightAvailabilityRowMapper(),id,true);
		int totalSeatsUpdate=flight.getTotalSeats()-totalSeats;
		int economySeatsUpdate=flight.getEconomyClassSeats()-economySeats;
		int firstSeatsUpdate=flight.getFirstClassSeats()-firstSeats;
		int businessSeatsUpdate=flight.getBusinessClassSeats()-businesSeats;
		String UPDATE_QUERY="update flight_seats_availability set total_seats=?,economy_class_seats=?,first_class_seats=?,business_class_seats=? where id=? and status=?";
		return jdbcTemplate.update(UPDATE_QUERY, totalSeatsUpdate,economySeatsUpdate,firstSeatsUpdate,businessSeatsUpdate,id,true);
	}
    
	@Override
	public int updatePublishedFlightSeatsAvailabilityAfterCancellation(int id, int economySeats,int firstSeats, int businesSeats,
			int totalSeats) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight_seats_availability where id=? and status=?";
		FlightAvailability flight=jdbcTemplate.queryForObject(GET_QUERY, new FlightAvailabilityRowMapper(),id,true);
		int totalSeatsUpdate=flight.getTotalSeats()+totalSeats;
		int economySeatsUpdate=flight.getEconomyClassSeats()+economySeats;
		int firstSeatsUpdate=flight.getFirstClassSeats()+firstSeats;
		int businessSeatsUpdate=flight.getBusinessClassSeats()+businesSeats;
		String UPDATE_QUERY="update flight_seats_availability set total_seats=?,economy_class_seats=?,first_class_seats=?,business_class_seats=? where id=? and status=?";
		return jdbcTemplate.update(UPDATE_QUERY, totalSeatsUpdate,economySeatsUpdate,firstSeatsUpdate,businessSeatsUpdate,id,true);
	}
	@Override
	public int insertBookingDetails(BookingDetails bookingDetails) {
		// TODO Auto-generated method stub
		String INSERT_QUERY="insert into booking_data(booking_id,email,flight_id,flight_no,total_seats,economy_class_seats,first_class_seats,business_class_seats,total_fare,economy_class_fare,first_class_fare,business_class_fare,booked_date,cancelled_date,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERT_QUERY,bookingDetails.getBookingId(),bookingDetails.getEmail(),
				bookingDetails.getFlightId(),
				bookingDetails.getFlightNo(),bookingDetails.getTotalSeats(),bookingDetails.getEconomyClassSeats(),
				bookingDetails.getFirstClassSeats(),bookingDetails.getBusinessClassSeats(),
				bookingDetails.getTotalFare(),bookingDetails.getEconomyClassFare(),
				bookingDetails.getFirstClassFare(),
				bookingDetails.getBusinessClassFare(),bookingDetails.getBookedDate(),
				bookingDetails.getCancelledDate(),bookingDetails.isStatus());
	}

	@Override
	public List<BookingDetails> getBookingHistory(String email) {
		// TODO Auto-generated method stub
		//select * from booking_data where email="ruru@ruru.com" order by id desc;
		String GET_QUERY="select * from booking_data where email=? order by id desc";
		List<BookingDetails> bookingHistoryList= jdbcTemplate.query(GET_QUERY, new BookingHistoryRowMapper(),email);
		System.out.println(bookingHistoryList);
		return bookingHistoryList;
	}
	
	@Override
	public List<BookingDetails> getBookedTickets(String email) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from booking_data where email=? and status=? order by id desc";
		List<BookingDetails> bookedTicketList= jdbcTemplate.query(GET_QUERY, new BookingHistoryRowMapper(),email,true);
		System.out.println(bookedTicketList);
		return bookedTicketList;
	}
	

	@Override
	public int cancelFlight(String bookingId) {
		// TODO Auto-generated method stub `cancelled_date`
		Date cancelDate=Date.valueOf(LocalDate.now());
		String UPDATE_QUERY="update booking_data set status=?,cancelled_date=? where booking_id=?";
		return jdbcTemplate.update(UPDATE_QUERY,false,cancelDate,bookingId);
	}

	@Override
	public Flight getFlight(String flightNo) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where flight_no=? and status=?";
		return jdbcTemplate.queryForObject(GET_QUERY,new FlightRowMapper(),flightNo,true);
	}

	@Override
	public BookingDetails getBookingDetails(String bookingId) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from booking_data where booking_id=?";
		return jdbcTemplate.queryForObject(GET_QUERY, new  BookingDetailsRowMapper(),bookingId);
	}

	@Override
	public List<Flight> getFlightBookingHistory(List<BookingDetails> obj) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where id=?";
		System.out.println(obj);
		List<Flight> flights=new ArrayList<Flight>();
		for(int i=0;i<obj.size();i++)
		{
			Flight ob=jdbcTemplate.queryForObject(GET_QUERY,new FlightRowMapper(),obj.get(i).getFlightId());
			System.out.println("----");
			System.out.println(ob);
			System.out.println("------");
			flights.add(ob);
		}
		return flights;
	}

	@Override
	public Flight getSelectedFlight(int id) {
		// TODO Auto-generated method stub
		
		String GET_QUERY="select * from flight where id=? and status=?";
		Flight flight=jdbcTemplate.queryForObject(GET_QUERY, new FlightRowMapper(),id,true);
		return flight;
	}

	@Override
	public AirlinesFare getSelectedFlightFare(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from airlines_fare where id=? and status=?";
		AirlinesFare fare=jdbcTemplate.queryForObject(GET_QUERY, new AirlinesFareRowMapper(),id,true);
		return fare;
	}

	@Override
	public Airlines getSelectedFlightSeats(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight_seats_availability where id=? and status=?";
		Airlines seats=jdbcTemplate.queryForObject(GET_QUERY, new AirlinesSeatsRowMapper(),id,true);
		return seats;
	}

	@Override
	public Flight getFlight(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from flight where id=? and status=?";
		return jdbcTemplate.queryForObject(GET_QUERY,new FlightRowMapper(),id,true);
	}

	@Override
	public List<BookingDetails> getAllBookedTicketsForCancellation(String email) {
		// TODO Auto-generated method stub
		String GET_QUERY="SELECT bd.* FROM booking_data bd JOIN flight f ON bd.flight_id = f.id WHERE f.source_date > NOW() AND email=? and bd.status = ?";
		List<BookingDetails> allTickets=jdbcTemplate.query(GET_QUERY, new BookingDetailsRowMapper(),email,true);
		return allTickets;
	}


	



}

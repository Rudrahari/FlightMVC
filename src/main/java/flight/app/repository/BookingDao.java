package flight.app.repository;

import java.util.List;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Flight;

public interface BookingDao {

	Flight getSelectedFlight(List<Flight> flights,String flightNo);
	AirlinesFare getSelectedFlightFare(List<AirlinesFare> airlinesFare, String flightNo);
	Airlines getSelectedFlightSeats(List<Airlines> airines ,String flightNo);
	
	Flight getSelectedFlight(int id);
	AirlinesFare getSelectedFlightFare(int id);
	Airlines getSelectedFlightSeats(int id);
	
	int updatePublishedFlightSeatsAvailability(int id,int economySeats,int firstSeats,int businesSeats,int totalSeats);
	int insertBookingDetails(BookingDetails bookingDetails);
	List<BookingDetails> getBookingHistory(String email);
	int cancelFlight(String bookingId);
	List<BookingDetails> getBookedTickets(String email);
	List<BookingDetails> getAllBookedTicketsForCancellation(String email);
	
	Flight getFlight(String flightNo);
	Flight getFlight(int id);
	BookingDetails getBookingDetails(String bookingId);
	int updatePublishedFlightSeatsAvailabilityAfterCancellation(int id, int economySeats, int firstSeats,
			int businesSeats, int totalSeats);
	List<Flight> getFlightBookingHistory(List<BookingDetails> obj);
}

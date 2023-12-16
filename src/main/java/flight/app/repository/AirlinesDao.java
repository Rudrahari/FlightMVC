package flight.app.repository;

import java.util.List;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Flight;
import flight.app.entities.FlightAvailability;

public interface AirlinesDao {

	int insertAirlines(Airlines airlines);
	int updateAirlines(Airlines airlines);
	int deleteAirlines(int id);
	int insertAirlinesFare(AirlinesFare airlinesFare);
	int updateAirlinesFare(AirlinesFare airlinesFare);
	int insertFlight(Flight flight);
	int updateFlight(Flight flight);
	int updatePublishedFlightFare(String airlines,String flightNo,String flightModel,int id);
	int updatedPublishedFlightSeats(String airlines,String flightNo,String flightModel,int id);
	int insertFlightSeatsAvailability(Airlines airlines);
	Airlines getFlightSeats(int id);
	Airlines getFlightSeats(String flightNo);
	List<Flight> getallPublishedFlights();
	List<AirlinesFare>  getallPublishedFlightsFare();
	List<Airlines> getallAirlinesAvailableSeats();
	List<Airlines> getAllAirlinesModel();
	List<Airlines> getAllDeletedAirlinesModel();
	
	List<BookingDetails> getAllPassengersList(int id);
	AirlinesFare getFareOfAFlight(int id);
	Flight getSelectedFlightDetails(String flightNo);
	Flight getSelectedFlightDetails(int id);
	
	int deletePublishedFlight(int id);
	int deletePublishedFlightFare(int id);
	int deletePublishedFlightSeats(int id);
	int addAirlinesToService(int id);
	int addFlightToService(int id);
	
	List<Flight> getallDeletedFlights();
	List<AirlinesFare>  getallDeletedFlightsFare();
	List<Airlines> getallDeletedAirlinesAvailableSeats();
}
package flight.app.repository;


import java.util.List;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.Flight;
import flight.app.entities.SearchFlight;

public interface FlightDao {


    List<Flight> viewSearchedFlights(SearchFlight searchFlight);
    List<Flight> viewSearchedFlightsWithoutDate(SearchFlight searchFlight);
    List<AirlinesFare> getAirlinesFareOfSearchedFlights(List<Flight> flight);
    List<Airlines> getSeatsAvailabilityOfSearchedFlights(List<Flight> flight);
    
}

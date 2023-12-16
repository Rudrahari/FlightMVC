package flight.app.controller;

import java.sql.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.Flight;
import flight.app.entities.SearchFlight;
import flight.app.repository.FlightDaoImpl;

@Controller
@RequestMapping("/user")
public class FlightController {

	@Autowired
	FlightDaoImpl obj;
    @RequestMapping(value={"flight/searchFlights","searchFlights"})	
    public String getSearchFlightsPage()
    {
    	return "search_flights";
    }
    
    @GetMapping("flight/home")
    public String getUserDashboard()
    {
    	return "user_dashboard";
    }
    
    @RequestMapping(value={"flight/flightsList","flightsList"})
    public String getFlightsListPage(
    		@RequestParam("source") String source ,
    		@RequestParam("destination") String destination,
    		@RequestParam("travelDate") String travelDate,
    		Model model,HttpServletRequest request)
    {
    	 HttpSession session=request.getSession();
      
        	 SearchFlight searchFlights=new SearchFlight(source, destination);
        	  List<Flight> viewSearchFlightsWithoutDate=obj.viewSearchedFlightsWithoutDate(searchFlights);
        	  List<AirlinesFare> viewFlightFareWithoutDate=obj.getAirlinesFareOfSearchedFlights(viewSearchFlightsWithoutDate);
        	  List<Airlines> viewFlightSeatsAvailabilityWithoutDate=obj.getSeatsAvailabilityOfSearchedFlights(viewSearchFlightsWithoutDate);
        	  session.setAttribute("displaySeatsAvailable", viewFlightSeatsAvailabilityWithoutDate);
              session.setAttribute("displayFlightsFare", viewFlightFareWithoutDate);
              session.setAttribute("displayFlights", viewSearchFlightsWithoutDate);
//         }
//    	 if(travelDate!=null || travelDate!="")
//    	 {
//    	 Date dateOfTravel=Date.valueOf(travelDate);
//    	 
//    	  SearchFlight searchFlights=new SearchFlight(source,destination,dateOfTravel);
//    	  List<Flight> viewSearchFlighs=obj.viewSearchedFlights(searchFlights);
//         List<AirlinesFare> viewFlightFare=obj.getAirlinesFareOfSearchedFlights(viewSearchFlighs);
//         
//         List<Airlines> viewFlightSeatsAvailability=obj.getSeatsAvailabilityOfSearchedFlights(viewSearchFlighs);
//         session.setAttribute("displaySeatsAvailable", viewFlightSeatsAvailability);
//         session.setAttribute("displayFlightsFare", viewFlightFare);
//         session.setAttribute("displayFlights", viewSearchFlighs);
        
    	
       
        
//    	 model.addAttribute("displayFlights",viewSearchFlighs);
//    	 model.addAttribute("displayFlightsFare",viewFlightFare);
//    	 model.addAttribute("displaySeatsAvailable",viewFlightSeatsAvailability);
    	 return "view_flights";
    }
    
  
    
	
}

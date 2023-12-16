package flight.app.controller;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import flight.app.entities.Admin;
import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Flight;
import flight.app.exceptionHandler.AdminSessionExpired;
import flight.app.repository.AirlinesDaoImpl;

@Controller
@RequestMapping("admin")
public class AirlinesController {
    
	@Autowired
	AirlinesDaoImpl  obj;
	
	@GetMapping(value={"/registration","airlines/registration"})
	public String getAirlinesRegisterUserPage(HttpServletRequest request) throws AdminSessionExpired
	{
		HttpSession session=request.getSession();
		 Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  }
		return "register_airlines";
	}
	
	@GetMapping(value={"/addAirlines","airlines/addAirlines"})
	public String handleFormData(
			@RequestParam("airlinesName") String airlinesName,
			@RequestParam("flightNo") String flightNo,
			@RequestParam("flightModel") String flightModel,
			@RequestParam("totalSeats") int totalSeats,
			@RequestParam("economyClassSeats") int economyClassSeats,
			@RequestParam("firstClassSeats") int firstClassSeats,
			@RequestParam("businessClasSeats") int businessClasSeats,
			Model model
			)
	{
		
		Airlines airlines=new Airlines(airlinesName,flightModel,flightNo,totalSeats,economyClassSeats,businessClasSeats,firstClassSeats,true);
		System.out.println(airlines);
		model.addAttribute("headermessage","Airlines Added ");
		model.addAttribute("message","Airlines Added successfuly");
		return obj.insertAirlines(airlines)==1?"success":"failure";
	}
	
	@GetMapping(value={"/updateAirlines","airlines/updateAirlines"})
	public String getUpdateAirinesPage(
			@RequestParam("id") String ID,
			HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		int id=Integer.valueOf(ID);
		Airlines updateAirlinesModelSeats=obj.getFlightSeats(id);
		session.setAttribute("updateAirlinesModelSeats", updateAirlinesModelSeats);
		return "update_airlines_seats";
	}
	
	@GetMapping(value={"/deleteAirlines","airlines/deleteAirlines"})
	public String deleteAirlinesModel(@RequestParam("id") String ID,HttpServletRequest request) throws AdminSessionExpired
	{
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("adminProfile");
		if(admin==null)
		{
			throw new AdminSessionExpired();
		}
		int id=Integer.valueOf(ID);
		int result=obj.deleteAirlines(id);
		if(result==1)
		{
			if(admin.isRoot())
			{
				return "root_admin_dashboard";
			}
			else
			{
				return "admin_dashboard";
			}
		}
		return "failure";
	}
	@GetMapping(value={"/updateAirlinesSeats","airlines/updateAirlinesSeats"})
	public String updateAirlinesSeatsHandleFormData(
			@RequestParam("airlinesName") String airlinesName,
			@RequestParam("flightNo") String flightNo,
			@RequestParam("flightModel") String flightModel,
			@RequestParam("totalSeats") int totalSeats,
			@RequestParam("economyClassSeats") int economyClassSeats,
			@RequestParam("firstClassSeats") int firstClassSeats,
			@RequestParam("businessClassSeats") int businessClasSeats,
			@RequestParam("id") String ID,
			Model model
			)
	{
		int id=Integer.valueOf(ID);
		Airlines airlines=new Airlines(id,airlinesName,flightNo,flightModel,totalSeats,economyClassSeats,businessClasSeats,firstClassSeats,true);
		 model.addAttribute("headermessage", "New Flight Seats");
		  model.addAttribute("message", "New Flight Seats Updated Successfully");
		System.out.println(airlines);
		return obj.updateAirlines(airlines)==1?"success":"failure";
	}
	@GetMapping(value={"/flights","airlines/flights"})
	public String getFlightsPublishPage(HttpServletRequest request) throws AdminSessionExpired
	{
		List<Airlines> allAirlines=obj.getAllAirlinesModel();

		System.out.println(allAirlines);
		HttpSession session=request.getSession();
		session.setAttribute("allAirlines", allAirlines);
		 Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  }
		return "publish_flights";
	}
	@GetMapping(value={"/publishFlight","airlines/publishFlight"})
	public String handlePublishFormData(
			@RequestParam("airlinesName") String airlinesName,
			@RequestParam("flightNo") String flightNo,
			@RequestParam("flightModel") String flightModel,
			@RequestParam("source") String source,
			@RequestParam("sourceTimeZone") String sourceTimeZone,
			@RequestParam("destination") String destination,
			@RequestParam("destinationTimeZone") String destinationTimeZone,
			@RequestParam("totalDuration") double totalDuration,
			@RequestParam("sourceDate") String soDate,
			@RequestParam("sourceTime") String soTime,
			@RequestParam("destinationDate") String deDate,
			@RequestParam("destinationTime") String deTime,
			@RequestParam("economyClassFare") double economyClassFare,
			@RequestParam("firstClassFare") double firstClassFare,
			@RequestParam("businessClassFare") double businessClassFare,
			Model model
			)
	{
		//Maybe try creating time class 
	   System.out.println(soTime);
	   System.out.println(deTime);
	   String tempSoTime=soTime+":00";
	   String tempDeTime=deTime+":00";
	   Date sourceDate = Date.valueOf(soDate);
	   Date destinationDate = Date.valueOf(deDate);
	   Time sourceTime=Time.valueOf(tempSoTime);
	   Time destinationTime=Time.valueOf(tempDeTime);
	   Flight flight=new Flight(airlinesName, flightNo,flightModel, source, destination, sourceTimeZone, destinationTimeZone, totalDuration, sourceDate, sourceTime, destinationDate, destinationTime,true);
	   AirlinesFare airlinesFare=new AirlinesFare(airlinesName, flightModel, flightNo, economyClassFare, firstClassFare, businessClassFare,true);
	   Airlines airlines=obj.getFlightSeats(flightNo);
	   System.out.println(flight);
	   System.out.println(airlinesFare);
	   System.out.println(airlines);
	   
	   model.addAttribute("headermessage", "New Flight Published");
	  model.addAttribute("message", "New Flight Published Successfully");
	   return (obj.insertAirlinesFare(airlinesFare) & obj.insertFlight(flight) & obj.insertFlightSeatsAvailability(airlines))==1?"success":"failure";
	}
	@GetMapping(value={"/updateFlights","airlines/updateFlights"})
	public String getUpdateFlightsPublishPage(@RequestParam("id") String ID,HttpServletRequest request)
	{
		int id=Integer.valueOf(ID);
		HttpSession session=request.getSession();
		Flight selectedFlightDetails=obj.getSelectedFlightDetails(id);
		session.setAttribute("selectedFlightDetails", selectedFlightDetails);
		return "update_published_flights";
	}
	//make sure to give id in sql query so that u can update all the data's later.
	@GetMapping(value={"/updatePublishFlight","airlines/updatePublishFlight"})
	public String handleUpdatePublishFormData(
			@RequestParam("airlinesName") String airlinesName,
			@RequestParam("flightNo") String flightNo,
			@RequestParam("flightModel") String flightModel,
			@RequestParam("source") String source,
			@RequestParam("sourceTimeZone") String sourceTimeZone,
			@RequestParam("destination") String destination,
			@RequestParam("destinationTimeZone") String destinationTimeZone,
			@RequestParam("totalDuration") double totalDuration,
			@RequestParam("sourceDate") String soDate,
			@RequestParam("sourceTime") String soTime,
			@RequestParam("destinationDate") String deDate,
			@RequestParam("destinationTime") String deTime,
			@RequestParam("id") String ID,
			Model model
			)
	{
		
		String Id = ID.replaceAll("/", "");
		System.out.println(Id);
		int id=Integer.valueOf(Id);
		 System.out.println(soTime);
		   System.out.println(deTime);
		   String tempSoTime=soTime;
		   String tempDeTime=deTime;
		   Date sourceDate = Date.valueOf(soDate);
		   Date destinationDate = Date.valueOf(deDate);
		   System.out.println(soTime);
		   System.out.println("-----------");
		   System.out.println(deTime);
		   Time sourceTime=Time.valueOf(tempSoTime);
		   Time destinationTime=Time.valueOf(tempDeTime);
		   Flight flight=new Flight(id,airlinesName, flightNo,flightModel, source, destination, sourceTimeZone, destinationTimeZone, totalDuration, sourceDate, sourceTime, destinationDate, destinationTime,true);
		   model.addAttribute("headermessage", "New Flight Details ");
			  model.addAttribute("message", "New Flight Details Updated Successfully");
		return (obj.updateFlight(flight)
				& obj.updatedPublishedFlightSeats(airlinesName, flightNo, flightModel,id)
				& obj.updatePublishedFlightFare(airlinesName, flightNo, flightModel,id))==1?"success":"failure";
	}
	
	@GetMapping(value={"/deleteFlights","airlines/deleteFlights"})
	public String deletePublishedFlights(@RequestParam("id") int id,HttpServletRequest request) throws AdminSessionExpired
	{
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("adminProfile");
		if(admin==null)
		{
			throw new AdminSessionExpired();
		}
		int result=((obj.deletePublishedFlight(id))&(obj.deletePublishedFlightFare(id))&(obj.deletePublishedFlightSeats(id)));
		if(result==1)
		{
			if(admin.isRoot())
			{
				return "root_admin_dashboard";
			}
			else
			{
				return "admin_dashboard";
			}
		}
		
		return "failure";
	}
	
	@GetMapping("/displayDeletedFlights")
	public String getDeletedFlightsPage(HttpServletRequest request) throws AdminSessionExpired
	{
		HttpSession session=request.getSession();
		  Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  }
		  List<Flight> allDeletedFlights=obj.getallDeletedFlights();
		  List<AirlinesFare> allDeletedFlightsFare=obj.getallDeletedFlightsFare();
		  List<Airlines> allDeletedFlightsSeats=obj.getallDeletedAirlinesAvailableSeats();
		  System.out.println("Checking deletion");
		  System.out.println(allDeletedFlights);
		  System.out.println(allDeletedFlightsFare);
		  System.out.println(allDeletedFlightsSeats);
		  session.setAttribute("deletedFlightsSeats", allDeletedFlightsSeats);
		  session.setAttribute("deletedFlight", allDeletedFlights);
		  session.setAttribute("deletedFlightsFare", allDeletedFlightsFare);
		
		return "deleted_flights";
	}
	
	@GetMapping("/addFlightService")
	public String addFlightToServiceLine(@RequestParam("id") int id)
	{
		int result=obj.addFlightToService(id);
		return result==1?"admin_dashboard":"failure";
	}
	@GetMapping(value={"/flightFare","airlines/flightFare"})
	public String getUpdateFlightFarePage(@RequestParam("id") String ID,HttpServletRequest request)
	{
		int id=Integer.valueOf(ID);
		HttpSession session=request.getSession();
		AirlinesFare airlinesFare=obj.getFareOfAFlight(id);
		session.setAttribute("selectdAirlinesFare", airlinesFare);
		return "update_flight_fare";
	}
	
	@GetMapping(value={"/updateFlightFare","airlines/updateFlightFare"})
	public String updateFlightFare(
			@RequestParam("id") String ID,
			@RequestParam("economyClassFare") double economyClassFare,
			@RequestParam("firstClassFare") double firstClassFare,
			@RequestParam("businessClassFare") double businessClassFare,
			Model model)
	{
		int id=Integer.valueOf(ID);
		AirlinesFare airlinesFare=new AirlinesFare();
		airlinesFare.setId(id);
		airlinesFare.setEconomyClassFare(economyClassFare);
		airlinesFare.setFirstClassFare(firstClassFare);
		airlinesFare.setBusinessClassFare(businessClassFare);
		 model.addAttribute("headermessage", "New Flight Fares ");
		  model.addAttribute("message", "New Flight  Fare Published Successfully");
		return obj.updateAirlinesFare(airlinesFare)==1?"success":"failure";
	}

	  @RequestMapping(value={"/displayPublishedFlights","airlines/displayPublishedFlights"})
	    public String getPublishedFlightsPage(HttpServletRequest request) throws AdminSessionExpired
	    {
		  HttpSession session=request.getSession();
		  Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  }
		  List<Flight> allPublishedFlights=obj.getallPublishedFlights();
		  List<AirlinesFare> allPublishedFlightsFare=obj.getallPublishedFlightsFare();
		  List<Airlines> allPublishedFlightsSeats=obj.getallAirlinesAvailableSeats();
		  session.setAttribute("publishedFlightsSeats", allPublishedFlightsSeats);
		  session.setAttribute("publishedFlights", allPublishedFlights);
		  session.setAttribute("publishedFlightsFare", allPublishedFlightsFare);
	      return "view_published_flights";
	    }
	
	  @RequestMapping(value={"/getAllPublishedAirlinesmodel","airlines/getAllPublishedAirlinesmodel"})
      public String getPublishedModelPage(HttpServletRequest request) throws AdminSessionExpired
      {
		  HttpSession session=request.getSession();
		  Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  }
		  List<Airlines> allAirlinesModel=obj.getAllAirlinesModel();
		  System.out.println(allAirlinesModel);
		  session.setAttribute("allAirlinesModel", allAirlinesModel);
		return "view_all_airlines_model";
      }
	  
     @RequestMapping("/getAllDeletedAirlinesmodel")
     public String getDeletedModelPage(HttpServletRequest request) throws AdminSessionExpired
     {
    	 HttpSession session=request.getSession();
		  Admin admin=(Admin) session.getAttribute("adminProfile");
		  if(admin==null)
		  {
			  throw new AdminSessionExpired();
		  } 
		  List<Airlines> allDeletedAirlinesModel=obj.getAllDeletedAirlinesModel();
		  session.setAttribute("allDeletedAirlinesModel", allDeletedAirlinesModel);
		  System.out.println(allDeletedAirlinesModel);
    	 return "revive_airlines_model";
     }
	  
     @RequestMapping("/addAirlinesToService")
     public String addAirlinesToService(@RequestParam("id") int id,HttpServletRequest request)
     {
    	 int result=obj.addAirlinesToService(id);
    	 return result==1?"root_admin_dashboard":"failure";
     }
     
	  @RequestMapping(value={"getPassengersList","airlines/getPassengersList"})
	  public String getAllPassengersList(@RequestParam("id") String ID,HttpServletRequest request)
	  {
		  int id=Integer.valueOf(ID);
		  HttpSession session=request.getSession();
		  List<BookingDetails> allPassengersList=obj.getAllPassengersList(id);
		  System.out.println(allPassengersList);
		  session.setAttribute("allPassengersList", allPassengersList);
		  return "view_all_flight_passengers";
	  }
}

package flight.app.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import flight.app.entities.Admin;
import flight.app.entities.Airlines;
import flight.app.entities.AirlinesFare;
import flight.app.entities.BookingDetails;
import flight.app.entities.Card;
import flight.app.entities.Flight;
import flight.app.entities.User;
import flight.app.exceptionHandler.AdminSessionExpired;
import flight.app.exceptionHandler.UserSessionExpired;
import flight.app.repository.BookingDaoImpl;
import flight.app.repository.UserDaoImpl;
import flight.app.utilities.Booking;

@Controller
@RequestMapping("user")
public class BookingController {

	@Autowired
	BookingDaoImpl obj;
	
	@Autowired
	UserDaoImpl obj1;

	@GetMapping(value = { "flight/book", "/book" })
	public String getFlightBookingPage(@RequestParam("id") String ID, HttpServletRequest request) {
		int id=Integer.valueOf(ID);
		HttpSession session = request.getSession();
		List<Flight> displayFlights = (List<Flight>) session.getAttribute("displayFlights");
		List<AirlinesFare> displayFlightsFare = (List<AirlinesFare>) session.getAttribute("displayFlightsFare");
		List<Airlines> displaySeatsAvailable = (List<Airlines>) session.getAttribute("displaySeatsAvailable");
		System.out.println("----------------------");
		System.out.println(displayFlights);
		//Flight displayFlight = obj.getSelectedFlight(displayFlights, flightNo);
		Flight displayFlight = obj.getSelectedFlight(id);
		System.out.println("------------------------");
		System.out.println(displayFlight);
		//AirlinesFare displayFlightFare = obj.getSelectedFlightFare(displayFlightsFare, flightNo);
		AirlinesFare displayFlightFare = obj.getSelectedFlightFare(id);
		//Airlines displayFlightSeatsAvailable = obj.getSelectedFlightSeats(displaySeatsAvailable, flightNo);
		Airlines displayFlightSeatsAvailable = obj.getSelectedFlightSeats(id);

		session.setAttribute("displayFlight", displayFlight);
		session.setAttribute("displayFlightFare", displayFlightFare);
		session.setAttribute("displaySeatsAvailables", displayFlightSeatsAvailable);

		return "book_flight_tickets";
	}
	
	@GetMapping(value={"/paymentsPage","flight/paymentsPage"})
	public String getPaymentsPage(@RequestParam("totalAirFare") String totalAirFare,
			@RequestParam("first") String firstClass,
			@RequestParam("economy") String economyClass,
			@RequestParam("business") String businessClass,
			@RequestParam("totalSeats") String total,
	 HttpServletRequest request) throws UserSessionExpired
	{
		
		HttpSession session=request.getSession();
		Flight displayFlight=(Flight) session.getAttribute("displayFlight");
		AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
		Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailables");
		User userProfile=(User) session.getAttribute("userProfile");
		
		  if(userProfile==null)
		  {
			  throw new UserSessionExpired();
		  }
		Card cardforPayments=obj1.getCard(userProfile.getId());
		session.setAttribute("cardforPayments", cardforPayments);
		int firstClassSeats=0;
		int economyClassSeats=0;
		int businessClassSeats=0;
		int totalSeats=Integer.valueOf(total);
		double totalFare=Double.parseDouble(totalAirFare);
		if(firstClass.isEmpty()==false)
		{
	       firstClassSeats=Integer.valueOf(firstClass);
		}
		if(economyClass.isEmpty()==false)
		{
	    economyClassSeats=Integer.valueOf(economyClass);
		}
		if(businessClass.isEmpty()==false)
		{
	     businessClassSeats=Integer.valueOf(businessClass);
		}
		System.out.println(economyClassSeats);
		System.out.println(firstClassSeats);
		System.out.println(businessClassSeats);
		System.out.println(totalSeats);
		System.out.println(totalAirFare);
		

		String bookerEmail=userProfile.getEmail();
		int id=displayFlight.getId();
		String flightNo=displayFlight.getFlightNo();
		String bookingId=flightNo+"-"+Booking.generateBookingId();
		double economyClassFare=displayFlightFare.getEconomyClassFare();
		double firstClassFare=displayFlightFare.getFirstClassFare();
		double businessClassFare=displayFlightFare.getBusinessClassFare();
		
		Date bookedDate=Date.valueOf(LocalDate.now());
	    //add booking 
		BookingDetails bookingDetails=new BookingDetails(bookingId,bookerEmail,id, flightNo, totalSeats, economyClassSeats, firstClassSeats, businessClassSeats,totalFare, economyClassFare, firstClassFare, businessClassFare, bookedDate, null, true);
		session.setAttribute("flightTicket", bookingDetails);
		System.out.println(bookingDetails);
		if(cardforPayments.isStatus())
		{
			return "payment_page_with_card";
		}
		return "payment_page";
	}
	

	@GetMapping(value={"/generateBookingTickets","flight/generateBookingTickets"})
	public String handleBookingData(
	 HttpServletRequest request)
{
		HttpSession session=request.getSession();
		Flight displayFlight=(Flight) session.getAttribute("displayFlight");
		AirlinesFare displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
		Airlines displaySeatsAvailable=(Airlines) session.getAttribute("displaySeatsAvailables");
		User userProfile=(User) session.getAttribute("userProfile");
		System.out.println(displayFlight);
//		System.out.println("------------");
//		  System.out.println(userProfile);
//		int firstClassSeats=0;
//		int economyClassSeats=0;
//		int businessClassSeats=0;
//		int totalSeats=Integer.valueOf(total);
//		double totalFare=Double.parseDouble(totalAirFare);
//		if(firstClass.isEmpty()==false)
//		{
//	       firstClassSeats=Integer.valueOf(firstClass);
//		}
//		if(economyClass.isEmpty()==false)
//		{
//	    economyClassSeats=Integer.valueOf(economyClass);
//		}
//		if(businessClass.isEmpty()==false)
//		{
//	     businessClassSeats=Integer.valueOf(businessClass);
//		}
//		System.out.println(economyClassSeats);
//		System.out.println(firstClassSeats);
//		System.out.println(businessClassSeats);
//		System.out.println(totalSeats);
//		System.out.println(totalAirFare);
		
	//	`id`, `booking_id`, `email`, `flight_no`, `total_seats`, `economy_class_seats`, `first_class_seats`, `business_class_seats`, `economy_class_fare`, `first_class_fare`, `business_class_fare`, `booked_date`, `cancelled_date`, `status`
    
//		String bookerEmail=userProfile.getEmail();
		int id=displayFlight.getId();
//		String flightNo=displayFlight.getFlightNo();
//		String bookingId=flightNo+"-"+Booking.generateBookingId();
//		double economyClassFare=displayFlightFare.getEconomyClassFare();
//		double firstClassFare=displayFlightFare.getFirstClassFare();
//		double businessClassFare=displayFlightFare.getBusinessClassFare();
//		
//		Date bookedDate=Date.valueOf(LocalDate.now());
	    //add booking 
		BookingDetails bookingDetails=(BookingDetails) session.getAttribute("flightTicket");
		System.out.println(bookingDetails);
		//session.setAttribute("flightTicket", bookingDetails);
		int result=(obj.updatePublishedFlightSeatsAvailability(id, bookingDetails.getEconomyClassSeats(),bookingDetails.getFirstClassSeats(),
				bookingDetails.getBusinessClassSeats(),bookingDetails.getTotalSeats()))
				&(obj.insertBookingDetails(bookingDetails));
		return result==1?"view_flight_ticket":"failure";
	}

	/*
	 * @GetMapping(value={"/generateBookingTickets","flight/generateBookingTickets"}
	 * ) public String handleBookingData(@RequestParam("totalAirFare") String
	 * totalAirFare,
	 * 
	 * @RequestParam("first") String firstClass,
	 * 
	 * @RequestParam("economy") String economyClass,
	 * 
	 * @RequestParam("business") String businessClass,
	 * 
	 * @RequestParam("totalSeats") String total, HttpServletRequest request) {
	 * HttpSession session=request.getSession(); Flight displayFlight=(Flight)
	 * session.getAttribute("displayFlight"); AirlinesFare
	 * displayFlightFare=(AirlinesFare) session.getAttribute("displayFlightFare");
	 * Airlines displaySeatsAvailable=(Airlines)
	 * session.getAttribute("displaySeatsAvailable"); User userProfile=(User)
	 * session.getAttribute("userProfile"); System.out.println("------------");
	 * System.out.println(userProfile); int firstClassSeats=0; int
	 * economyClassSeats=0; int businessClassSeats=0; int
	 * totalSeats=Integer.valueOf(total); double
	 * totalFare=Double.parseDouble(totalAirFare); if(firstClass.isEmpty()==false) {
	 * firstClassSeats=Integer.valueOf(firstClass); }
	 * if(economyClass.isEmpty()==false) {
	 * economyClassSeats=Integer.valueOf(economyClass); }
	 * if(businessClass.isEmpty()==false) {
	 * businessClassSeats=Integer.valueOf(businessClass); }
	 * System.out.println(economyClassSeats); System.out.println(firstClassSeats);
	 * System.out.println(businessClassSeats); System.out.println(totalSeats);
	 * System.out.println(totalAirFare);
	 * 
	 * // `id`, `booking_id`, `email`, `flight_no`, `total_seats`,
	 * `economy_class_seats`, `first_class_seats`, `business_class_seats`,
	 * `economy_class_fare`, `first_class_fare`, `business_class_fare`,
	 * `booked_date`, `cancelled_date`, `status`
	 * 
	 * String bookerEmail=userProfile.getEmail(); int id=displayFlight.getId();
	 * String flightNo=displayFlight.getFlightNo(); String
	 * bookingId=flightNo+"-"+Booking.generateBookingId(); double
	 * economyClassFare=displayFlightFare.getEconomyClassFare(); double
	 * firstClassFare=displayFlightFare.getFirstClassFare(); double
	 * businessClassFare=displayFlightFare.getBusinessClassFare();
	 * 
	 * Date bookedDate=Date.valueOf(LocalDate.now()); //add booking BookingDetails
	 * bookingDetails=new BookingDetails(bookingId,bookerEmail,id, flightNo,
	 * totalSeats, economyClassSeats, firstClassSeats, businessClassSeats,totalFare,
	 * economyClassFare, firstClassFare, businessClassFare, bookedDate, null, true);
	 * session.setAttribute("flightTicket", bookingDetails); int
	 * result=(obj.updatePublishedFlightSeatsAvailability(id,
	 * economyClassSeats,firstClassSeats, businessClassSeats,totalSeats))
	 * &(obj.insertBookingDetails(bookingDetails)); return
	 * result==1?"view_flight_ticket":"failure"; }
	 */
	
	@GetMapping(value={"flight/bookingHistory","/bookingHistory"})
	public String getBookingHistoryPage( HttpServletRequest request) throws UserSessionExpired
	{   HttpSession session=request.getSession();
		User userProfile=(User) session.getAttribute("userProfile");
		if(userProfile==null)
		{
			throw new UserSessionExpired();
		}
		List<BookingDetails> bookingHistoryData=obj.getBookingHistory(userProfile.getEmail());
		List<Flight> bookingFlightHistoryData=obj.getFlightBookingHistory(bookingHistoryData);
		System.out.println(bookingHistoryData);
		System.out.println(bookingFlightHistoryData);
		session.setAttribute("bookingHistoryList", bookingHistoryData);
		session.setAttribute("bookingFlightHistoryList", bookingFlightHistoryData);
		return "booking_history";
	}
	
	@GetMapping(value= {"flight/cancelFlightTickets","cancelFlightTickets"})
	public String getCancelFlightTicketsPage( HttpServletRequest request) throws UserSessionExpired
	{
		HttpSession session=request.getSession();
		User userProfile=(User) session.getAttribute("userProfile");
		if(userProfile==null)
		{
			throw new UserSessionExpired();
		}
		List<BookingDetails> bookingHistoryData=obj.getAllBookedTicketsForCancellation(userProfile.getEmail());
		List<Flight> bookedFlightsForCancellation=obj.getFlightBookingHistory(bookingHistoryData);
		System.out.println(bookingHistoryData);
		System.out.println(bookedFlightsForCancellation);
		session.setAttribute("bookedTicketsData", bookingHistoryData);
		session.setAttribute("bookedFlightsForCancellation", bookedFlightsForCancellation);
		return "cancel_flight_tickets";
	}
	
	@GetMapping(value= {"viewBookedFlightTickets","flight/viewBookedFlightTickets"})
	public String getBookedFlightTicketsPage(HttpServletRequest request) throws UserSessionExpired
	{
		HttpSession session=request.getSession();
		User userProfile=(User) session.getAttribute("userProfile");
		if(userProfile==null)
		{
			throw new UserSessionExpired();
		}
		List<BookingDetails> bookedTickets=obj.getBookedTickets(userProfile.getEmail());
		List<Flight> bookedFlightsData=obj.getFlightBookingHistory(bookedTickets);
		System.out.println(bookedTickets);
		System.out.println(bookedFlightsData);
		session.setAttribute("bookedTickets", bookedTickets);
		session.setAttribute("bookedFlightsData", bookedFlightsData);
		return "booked_flight_tickets";
	}
	@GetMapping(value={"cancelTicket","flight/cancelTicket"})
	public String cancelFlightTicket(@RequestParam("bookingId") String bookingId,
			@RequestParam("id") String ID,
			@RequestParam("totalSeats") String total,
			@RequestParam("economy") String economyClass,
			@RequestParam("first") String firstClass,
			@RequestParam("business") String businessClass)
	{
		int id=Integer.valueOf(ID);
		int firstClassSeats=0;
		int economyClassSeats=0;
		int businessClassSeats=0;
		int totalSeats=Integer.valueOf(total);
		if(firstClass.isEmpty()==false)
		{
	       firstClassSeats=Integer.valueOf(firstClass);
		}
		if(economyClass.isEmpty()==false)
		{
	    economyClassSeats=Integer.valueOf(economyClass);
		}
		if(businessClass.isEmpty()==false)
		{
	     businessClassSeats=Integer.valueOf(businessClass);
		}
		int result=obj.cancelFlight(bookingId) & obj.updatePublishedFlightSeatsAvailabilityAfterCancellation(id, firstClassSeats, economyClassSeats, businessClassSeats, totalSeats);
		return result==1?"user_dashboard":"failure";
	}
	
	@GetMapping(value={"viewTicket","flight/viewTicket"})
	public String viewFlightTicket(@RequestParam("bookingId") String bookingId,@RequestParam("id") String ID,
			HttpServletRequest request)
	{
		int id=Integer.valueOf(ID);
		HttpSession session=request.getSession();
		Flight flight=obj.getFlight(id);
		System.out.println(flight);
		System.out.println(bookingId);
		BookingDetails bookingDetails=obj.getBookingDetails(bookingId);
		System.out.println("------------------");
		System.out.println(bookingDetails);
		session.setAttribute("bookedTicket", bookingDetails);
		session.setAttribute("bookedFlight", flight);
		return "view_booked_flight_ticket";
	}
}

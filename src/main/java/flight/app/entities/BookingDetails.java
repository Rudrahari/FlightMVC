package flight.app.entities;

import java.sql.Date;

public class BookingDetails {

	// create a list of people who have booked for a flight
	//(Booked table contains all the users who have booked for the flight in the application.
	//create a unique id to differentiate flights  
	
	
	//create table for airlines fare
	//create table to maintain airlines seat availability
	//create flight table
	
	
	// get all the values from the form , distribute it to different tables sucha as airlinesfare, airlinesschedule, flight;
	//`id`, `booking_id`, `email`, `flight_no`, `total_seats`, `economy_class_seats`, `first_class_seats`, `business_class_seats`, `economy_class_fare`, `first_class_fare`, `business_class_fare`, `booked_date`, `cancelled_date`, `status`
	private int id;
	private String bookingId;
	private String email;
	private int flightId;
	private String flightNo;
	private int totalSeats;
	private int economyClassSeats;
	private int firstClassSeats;
	private int businessClassSeats;
	private double totalFare;
	private double economyClassFare;
	private double firstClassFare;
	private double businessClassFare;
	private Date bookedDate;
	private Date cancelledDate;
	private boolean status;
	public BookingDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookingDetails(String bookingId, String email, int flightId, String flightNo, int totalSeats,
			int economyClassSeats, int firstClassSeats, int businessClassSeats, double totalFare,
			double economyClassFare, double firstClassFare, double businessClassFare, Date bookedDate,
			Date cancelledDate, boolean status) {
		super();
		this.bookingId = bookingId;
		this.email = email;
		this.flightId = flightId;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.firstClassSeats = firstClassSeats;
		this.businessClassSeats = businessClassSeats;
		this.totalFare = totalFare;
		this.economyClassFare = economyClassFare;
		this.firstClassFare = firstClassFare;
		this.businessClassFare = businessClassFare;
		this.bookedDate = bookedDate;
		this.cancelledDate = cancelledDate;
		this.status = status;
	}
	public BookingDetails(int id, String bookingId, String email, int flightId, String flightNo, int totalSeats,
			int economyClassSeats, int firstClassSeats, int businessClassSeats, double totalFare,
			double economyClassFare, double firstClassFare, double businessClassFare, Date bookedDate,
			Date cancelledDate, boolean status) {
		super();
		this.id = id;
		this.bookingId = bookingId;
		this.email = email;
		this.flightId = flightId;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.firstClassSeats = firstClassSeats;
		this.businessClassSeats = businessClassSeats;
		this.totalFare = totalFare;
		this.economyClassFare = economyClassFare;
		this.firstClassFare = firstClassFare;
		this.businessClassFare = businessClassFare;
		this.bookedDate = bookedDate;
		this.cancelledDate = cancelledDate;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public int getEconomyClassSeats() {
		return economyClassSeats;
	}
	public void setEconomyClassSeats(int economyClassSeats) {
		this.economyClassSeats = economyClassSeats;
	}
	public int getFirstClassSeats() {
		return firstClassSeats;
	}
	public void setFirstClassSeats(int firstClassSeats) {
		this.firstClassSeats = firstClassSeats;
	}
	public int getBusinessClassSeats() {
		return businessClassSeats;
	}
	public void setBusinessClassSeats(int businessClassSeats) {
		this.businessClassSeats = businessClassSeats;
	}
	public double getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(double totalFare) {
		this.totalFare = totalFare;
	}
	public double getEconomyClassFare() {
		return economyClassFare;
	}
	public void setEconomyClassFare(double economyClassFare) {
		this.economyClassFare = economyClassFare;
	}
	public double getFirstClassFare() {
		return firstClassFare;
	}
	public void setFirstClassFare(double firstClassFare) {
		this.firstClassFare = firstClassFare;
	}
	public double getBusinessClassFare() {
		return businessClassFare;
	}
	public void setBusinessClassFare(double businessClassFare) {
		this.businessClassFare = businessClassFare;
	}
	public Date getBookedDate() {
		return bookedDate;
	}
	public void setBookedDate(Date bookedDate) {
		this.bookedDate = bookedDate;
	}
	public Date getCancelledDate() {
		return cancelledDate;
	}
	public void setCancelledDate(Date cancelledDate) {
		this.cancelledDate = cancelledDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BookingDetails [id=" + id + ", bookingId=" + bookingId + ", email=" + email + ", flightId=" + flightId
				+ ", flightNo=" + flightNo + ", totalSeats=" + totalSeats + ", economyClassSeats=" + economyClassSeats
				+ ", firstClassSeats=" + firstClassSeats + ", businessClassSeats=" + businessClassSeats + ", totalFare="
				+ totalFare + ", economyClassFare=" + economyClassFare + ", firstClassFare=" + firstClassFare
				+ ", businessClassFare=" + businessClassFare + ", bookedDate=" + bookedDate + ", cancelledDate="
				+ cancelledDate + ", status=" + status + "]";
	}
     
	
	
}

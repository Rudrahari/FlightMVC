package flight.app.entities;

public class FlightAvailability {

	private int id;
	private String airlines;
	private String flightModel;
	private String flightNo;
	private int totalSeats;
	private int economyClassSeats;
	private int firstClassSeats;
	private int businessClassSeats;
	private int status;
	public FlightAvailability() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FlightAvailability(int id, String airlines, String flightModel, String flightNo, int totalSeats,
			int economyClassSeats, int firstClassSeats, int businessClassSeats, int status) {
		super();
		this.id = id;
		this.airlines = airlines;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.firstClassSeats = firstClassSeats;
		this.businessClassSeats = businessClassSeats;
		this.status = status;
	}

	public FlightAvailability(String airlines, String flightModel, String flightNo, int totalSeats,
			int economyClassSeats, int firstClassSeats, int businessClassSeats, int status) {
		super();
		this.airlines = airlines;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.firstClassSeats = firstClassSeats;
		this.businessClassSeats = businessClassSeats;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAirlines() {
		return airlines;
	}
	public void setAirlines(String airlines) {
		this.airlines = airlines;
	}
	public String getFlightModel() {
		return flightModel;
	}
	public void setFlightModel(String flightModel) {
		this.flightModel = flightModel;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "FlightAvailability [id=" + id + ", airlines=" + airlines + ", flightModel=" + flightModel
				+ ", flightNo=" + flightNo + ", totalSeats=" + totalSeats + ", economyClassSeats=" + economyClassSeats
				+ ", firstClassSeats=" + firstClassSeats + ", businessClassSeats=" + businessClassSeats + ", status="
				+ status + "]";
	}
	
	
	
}

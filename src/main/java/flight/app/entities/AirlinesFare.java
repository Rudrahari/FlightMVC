package flight.app.entities;

public class AirlinesFare {
	
	private int id;
	private String airlines;
	private String flightModel;
	private String flightNo;
	private double economyClassFare;
	private double firstClassFare;
	private double businessClassFare;
	private boolean status;
	public AirlinesFare() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AirlinesFare(int id, String airlines, String flightModel, String flightNo, double economyClassFare,
			double firstClassFare, double businessClassFare, boolean status) {
		super();
		this.id = id;
		this.airlines = airlines;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.economyClassFare = economyClassFare;
		this.firstClassFare = firstClassFare;
		this.businessClassFare = businessClassFare;
		this.status = status;
	}

	public AirlinesFare(String airlines, String flightModel, String flightNo, double economyClassFare,
			double firstClassFare, double businessClassFare, boolean status) {
		super();
		this.airlines = airlines;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.economyClassFare = economyClassFare;
		this.firstClassFare = firstClassFare;
		this.businessClassFare = businessClassFare;
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
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AirlinesFare [id=" + id + ", airlines=" + airlines + ", flightModel=" + flightModel + ", flightNo="
				+ flightNo + ", economyClassFare=" + economyClassFare + ", firstClassFare=" + firstClassFare
				+ ", businessClassFare=" + businessClassFare + ", status=" + status + "]";
	}
	
	
	

}

package flight.app.entities;

public class Airlines {

	private int id;
	private String airlinesName;
	private String flightModel;
	private String flightNo;
	private int totalSeats;
	private int economyClassSeats;
	private int businessClasSeats;
	private int firstClassSeats;
	private boolean status;
	public Airlines() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Airlines(int id, String airlinesName, String flightModel, String flightNo, int totalSeats,
			int economyClassSeats, int businessClasSeats, int firstClassSeats, boolean status) {
		super();
		this.id = id;
		this.airlinesName = airlinesName;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.businessClasSeats = businessClasSeats;
		this.firstClassSeats = firstClassSeats;
		this.status = status;
	}

	public Airlines(String airlinesName, String flightModel, String flightNo, int totalSeats, int economyClassSeats,
			int businessClasSeats, int firstClassSeats, boolean status) {
		super();
		this.airlinesName = airlinesName;
		this.flightModel = flightModel;
		this.flightNo = flightNo;
		this.totalSeats = totalSeats;
		this.economyClassSeats = economyClassSeats;
		this.businessClasSeats = businessClasSeats;
		this.firstClassSeats = firstClassSeats;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAirlinesName() {
		return airlinesName;
	}
	public void setAirlinesName(String airlinesName) {
		this.airlinesName = airlinesName;
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
	public int getBusinessClasSeats() {
		return businessClasSeats;
	}
	public void setBusinessClasSeats(int businessClasSeats) {
		this.businessClasSeats = businessClasSeats;
	}
	public int getFirstClassSeats() {
		return firstClassSeats;
	}
	public void setFirstClassSeats(int firstClassSeats) {
		this.firstClassSeats = firstClassSeats;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Airlines [id=" + id + ", airlinesName=" + airlinesName + ", flightModel=" + flightModel + ", flightNo="
				+ flightNo + ", totalSeats=" + totalSeats + ", economyClassSeats=" + economyClassSeats
				+ ", businessClasSeats=" + businessClasSeats + ", firstClassSeats=" + firstClassSeats + ", status="
				+ status + "]";
	}
	
}

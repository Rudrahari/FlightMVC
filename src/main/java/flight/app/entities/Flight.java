package flight.app.entities;

import java.sql.Date;
import java.sql.Time;

public class Flight {

	private int id;
	private String airlines;
	private String flightNo;
	private String flightModel;
	private String source;
	private String destination;
	private String sourceTimeZone;
	private String destinationTimeZone;
	private double totalDuration;
	private Date sourceDate;
	private Time sourceTime;
	private Date destinationDate;
	private Time destinationTime;
	private boolean status;
	public Flight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Flight(int id, String airlines, String flightNo, String flightModel, String source, String destination,
			String sourceTimeZone, String destinationTimeZone, double totalDuration, Date sourceDate, Time sourceTime,
			Date destinationDate, Time destinationTime, boolean status) {
		super();
		this.id = id;
		this.airlines = airlines;
		this.flightNo = flightNo;
		this.flightModel = flightModel;
		this.source = source;
		this.destination = destination;
		this.sourceTimeZone = sourceTimeZone;
		this.destinationTimeZone = destinationTimeZone;
		this.totalDuration = totalDuration;
		this.sourceDate = sourceDate;
		this.sourceTime = sourceTime;
		this.destinationDate = destinationDate;
		this.destinationTime = destinationTime;
		this.status = status;
	}

	public Flight(String airlines, String flightNo, String flightModel, String source, String destination,
			String sourceTimeZone, String destinationTimeZone, double totalDuration, Date sourceDate, Time sourceTime,
			Date destinationDate, Time destinationTime, boolean status) {
		super();
		this.airlines = airlines;
		this.flightNo = flightNo;
		this.flightModel = flightModel;
		this.source = source;
		this.destination = destination;
		this.sourceTimeZone = sourceTimeZone;
		this.destinationTimeZone = destinationTimeZone;
		this.totalDuration = totalDuration;
		this.sourceDate = sourceDate;
		this.sourceTime = sourceTime;
		this.destinationDate = destinationDate;
		this.destinationTime = destinationTime;
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
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public String getFlightModel() {
		return flightModel;
	}
	public void setFlightModel(String flightModel) {
		this.flightModel = flightModel;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getSourceTimeZone() {
		return sourceTimeZone;
	}
	public void setSourceTimeZone(String sourceTimeZone) {
		this.sourceTimeZone = sourceTimeZone;
	}
	public String getDestinationTimeZone() {
		return destinationTimeZone;
	}
	public void setDestinationTimeZone(String destinationTimeZone) {
		this.destinationTimeZone = destinationTimeZone;
	}
	public double getTotalDuration() {
		return totalDuration;
	}
	public void setTotalDuration(double totalDuration) {
		this.totalDuration = totalDuration;
	}
	public Date getSourceDate() {
		return sourceDate;
	}
	public void setSourceDate(Date sourceDate) {
		this.sourceDate = sourceDate;
	}
	public Time getSourceTime() {
		return sourceTime;
	}
	public void setSourceTime(Time sourceTime) {
		this.sourceTime = sourceTime;
	}
	public Date getDestinationDate() {
		return destinationDate;
	}
	public void setDestinationDate(Date destinationDate) {
		this.destinationDate = destinationDate;
	}
	public Time getDestinationTime() {
		return destinationTime;
	}
	public void setDestinationTime(Time destinationTime) {
		this.destinationTime = destinationTime;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Flight [id=" + id + ", airlines=" + airlines + ", flightNo=" + flightNo + ", flightModel=" + flightModel
				+ ", source=" + source + ", destination=" + destination + ", sourceTimeZone=" + sourceTimeZone
				+ ", destinationTimeZone=" + destinationTimeZone + ", totalDuration=" + totalDuration + ", sourceDate="
				+ sourceDate + ", sourceTime=" + sourceTime + ", destinationDate=" + destinationDate
				+ ", destinationTime=" + destinationTime + ", status=" + status + "]";
	}
	
	
	
	
}

package flight.app.entities;

import java.sql.Date;

public class SearchFlight {

	private String sourcePlace;
	private String destinationPlace;
	private Date travelDate;
	public SearchFlight() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchFlight(String sourcePlace, String destinationPlace, Date travelDate) {
		super();
		this.sourcePlace = sourcePlace;
		this.destinationPlace = destinationPlace;
		this.travelDate = travelDate;
	}
	
	public SearchFlight(String sourcePlace, String destinationPlace) {
		super();
		this.sourcePlace = sourcePlace;
		this.destinationPlace = destinationPlace;
	}
	public String getSourcePlace() {
		return sourcePlace;
	}
	public void setSourcePlace(String sourcePlace) {
		this.sourcePlace = sourcePlace;
	}
	public String getDestinationPlace() {
		return destinationPlace;
	}
	public void setDestinationPlace(String destinationPlace) {
		this.destinationPlace = destinationPlace;
	}
	public Date getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(Date travelDate) {
		this.travelDate = travelDate;
	}
	@Override
	public String toString() {
		return "SearchFlight [sourcePlace=" + sourcePlace + ", destinationPlace=" + destinationPlace + ", travelDate="
				+ travelDate + "]";
	}
	
}

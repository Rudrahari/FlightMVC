package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.BookingDetails;

public class BookingHistoryRowMapper implements RowMapper<BookingDetails> {

	
	//`id`, `booking_id`, `email`, `flight_no`, `total_seats`, `economy_class_seats`, `first_class_seats`, `business_class_seats`, `total_fare`, `economy_class_fare`, `first_class_fare`, `business_class_fare`, `booked_date`, `cancelled_date`, `status`
	
	@Override
	public BookingDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		BookingDetails obj=new BookingDetails();
		obj.setId(rs.getInt("id"));
		obj.setBookingId(rs.getString("booking_id"));
		obj.setEmail(rs.getString("email"));
		obj.setFlightId(rs.getInt("flight_id"));
		obj.setFlightNo(rs.getString("flight_no"));
		obj.setTotalSeats(rs.getInt("total_seats"));
		obj.setTotalFare(rs.getDouble("total_fare"));
		obj.setEconomyClassSeats(rs.getInt("economy_class_seats"));
		obj.setBusinessClassSeats(rs.getInt("business_class_seats"));
		obj.setFirstClassSeats(rs.getInt("first_class_seats"));
		obj.setEconomyClassFare(rs.getDouble("economy_class_fare"));
		obj.setFirstClassFare(rs.getDouble("first_class_fare"));
		obj.setBusinessClassFare(rs.getDouble("business_class_fare"));
		obj.setBookedDate(rs.getDate("booked_date"));
		obj.setCancelledDate(rs.getDate("cancelled_date"));
		obj.setStatus(rs.getBoolean("status"));
		return obj;
	}



}

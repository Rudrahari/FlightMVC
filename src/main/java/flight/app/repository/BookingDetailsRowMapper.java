package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.BookingDetails;

//`id`, `booking_id`, `email`, `flight_no`, `total_seats`, `economy_class_seats`, `first_class_seats`, `business_class_seats`, `total_fare`, `economy_class_fare`, `first_class_fare`, `business_class_fare`, `booked_date`, `cancelled_date`, `status`
public class BookingDetailsRowMapper implements RowMapper<BookingDetails> {

	@Override
	public BookingDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		BookingDetails bookingDetails=new BookingDetails();
		bookingDetails.setId(rs.getInt("id"));
		bookingDetails.setBookingId(rs.getString("booking_id"));
		bookingDetails.setEmail(rs.getString("email"));
		bookingDetails.setFlightId(rs.getInt("flight_id"));
		bookingDetails.setFlightNo(rs.getString("flight_no"));
		bookingDetails.setTotalSeats(rs.getInt("total_seats"));
		bookingDetails.setEconomyClassSeats(rs.getInt("economy_class_seats"));
		bookingDetails.setBusinessClassSeats(rs.getInt("business_class_seats"));
		bookingDetails.setFirstClassSeats(rs.getInt("first_class_seats"));
		bookingDetails.setTotalFare(rs.getDouble("total_fare"));
		bookingDetails.setEconomyClassFare(rs.getDouble("economy_class_fare"));
		bookingDetails.setBusinessClassFare(rs.getDouble("business_class_fare"));
		bookingDetails.setFirstClassFare(rs.getDouble("first_class_fare"));
		bookingDetails.setBookedDate(rs.getDate("booked_date"));
		bookingDetails.setCancelledDate(rs.getDate("cancelled_date"));
		bookingDetails.setStatus(rs.getBoolean("status"));
		
		return bookingDetails;
	}

}

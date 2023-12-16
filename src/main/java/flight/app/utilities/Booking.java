package flight.app.utilities;

import java.util.Random;

public class Booking {
	 public static String generateBookingId() {
		 String randomString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	        StringBuilder salt = new StringBuilder();
	        Random rnd = new Random();
	        while (salt.length() < 6) { 
	            int index = (int) (rnd.nextFloat() * randomString.length());
	            salt.append(randomString.charAt(index));
	        }
	        String saltStr = salt.toString();
	        return saltStr;
	    }

}

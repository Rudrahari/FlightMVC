package flight.app.utilities;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.SecureRandom;

public class Password {
	
	 public static String generateSalt() {
	        SecureRandom random = new SecureRandom();
	        byte[] saltBytes = new byte[16];
	        random.nextBytes(saltBytes);
	        return Base64.getEncoder().encodeToString(saltBytes);
	    }
	 public static String generateHash(String password, String salt) {
	        int iterations = 10000; 
	        int keyLength = 256;    

	        KeySpec spec = new PBEKeySpec(password.toCharArray(), Base64.getDecoder().decode(salt), iterations, keyLength);
	        try {
	            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
	            byte[] hash = factory.generateSecret(spec).getEncoded();
	            return Base64.getEncoder().encodeToString(hash);
	        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	 

}

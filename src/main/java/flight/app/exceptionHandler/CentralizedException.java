package flight.app.exceptionHandler;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CentralizedException {
	
	@ExceptionHandler(value=UserInvalidCredentialsException.class)
	public String UserInvalidCredentialsExceptionHandler(Model model)
	{
		model.addAttribute("message", "Invalid Credentials for User");
		return "login_user";
	}
	
	@ExceptionHandler(value=AdminInvalidCredentialsException.class)
	public String AdminInvalidCredentialsExceptionHandler(Model model)
	{
		model.addAttribute("message", "Invalid Credentials for Admin");
		return "login_admin";
	}
	
	@ExceptionHandler(value=UserSessionExpired.class)
	public String UserSessionExceptionHandler(Model model)
	{
		model.addAttribute("message", "User Session Expired, Login Again to Continue");
		return "login_user";
	}
	
	@ExceptionHandler(value=AdminSessionExpired.class)
	public String AdminSessionExceptionHandler(Model model)
	{
		model.addAttribute("message", "Admin Session Expired, Login Again to Continue");
		return "login_admin";
	}
	
	
	@ExceptionHandler(value=InvalidAdminEmail.class)
	public String InvalidAdminEmailExceptionHandler(Model model)
	{
		model.addAttribute("message","Already an Admin available with the given mail,login or provide different email");
		return "register_admin";
	}
	
	@ExceptionHandler(value=InvalidUserEmail.class)
	public String InvalidUsermailExceptionHandler(Model model)
	{
		model.addAttribute("message","Already an User available with the given mail,login or provide different email");
		return "register_user";
	}
	
    @ExceptionHandler(DataIntegrityViolationException.class)
    public String handleDataIntegrityViolationException(DataIntegrityViolationException ex, Model model) {
    	model.addAttribute("headermessage", "Unable to Register");
        model.addAttribute("message", "Not able to register as Data is already found on database. ");
        return "invalidemail";
    }

}

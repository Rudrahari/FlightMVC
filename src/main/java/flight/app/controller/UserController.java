package flight.app.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import flight.app.entities.Admin;
import flight.app.entities.Card;
import flight.app.entities.User;
import flight.app.exceptionHandler.AdminSessionExpired;
import flight.app.exceptionHandler.UserInvalidCredentialsException;
import flight.app.exceptionHandler.UserSessionExpired;
import flight.app.repository.UserDaoImpl;
import flight.app.utilities.Password;
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserDaoImpl obj;
	
	@GetMapping("")
	public String getUserPage() {
		return "user";
	}
	@GetMapping("/userRegistration")
	public String getRegisterUserPage() {
		return "register_user";
	}
	@GetMapping("/userLogin")
	public String getLoginUserPage() {
		return "login_user";
	}
	@GetMapping("/addUserData")
	public String handleFormData(
			
			@RequestParam("full_name") String fullName,
			@RequestParam("email") String email,
			@RequestParam("mobile") String mobile,
			@RequestParam("date_of_birth") String dateOfBirth,
			@RequestParam("gender") String gender,
			@RequestParam("password") String password,
			Model model
			) {
		
		Date dob = Date.valueOf(dateOfBirth);
		
		String passwordSalt=Password.generateSalt();
		String passwordHash=Password.generateHash(password, passwordSalt);
		
	
		User user=new User(fullName, email, mobile, dob, gender, passwordSalt, passwordHash);
		
		System.out.println(user);
		model.addAttribute("message", "Registration Success");
		return (obj.insertUser(user)&obj.insertDefaultCardDetails())==1?"success_register_user":"failure";
	}
	@GetMapping(value={"/addCard","flight/addCard"})
	public String getAddCardDetailsPage()
	{
		 return "add_card";
	}
	@GetMapping(value={"/addUserCardDetails","flight/addUserCardDetails"})
	public String updateCardDetails(@ModelAttribute Card card,HttpServletRequest request,Model model) throws UserSessionExpired
	{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userProfile");
		  if(user==null)
		  {
			  throw new UserSessionExpired();
		  }
		card.setStatus(true);
		card.setId(user.getId());
		System.out.println(card);
		int result=obj.updateCardDetails(card);
		model.addAttribute("headermessage","Card Details Added");
		model.addAttribute("message","User Card Details Added Successfully");
		return result==1?"success":"failure";
	}
	@GetMapping(value={"/home"})
	public String getDashboardPage()
	{
		return "user_dashboard";
	}
	@GetMapping(value={"/editCard","user/editCard"})
	public String getEditCardDetailsPage(HttpServletRequest request) throws UserSessionExpired
	{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userProfile");
		  if(user==null)
		  {
			  throw new UserSessionExpired();
		  }
		
		Card updatedCard=obj.getCard(user.getId());
		session.setAttribute("cardDetails", updatedCard);
		return "edit_card";
	}
	
	@GetMapping(value={"/deleteCard","user/deleteCard"})
	public String getDeleteCard(@RequestParam("id") int id,Model model)
	{
		model.addAttribute("headermessage","Card Deleted");
		model.addAttribute("message","User Card Details Deleted Successfully");
		System.out.println(id);
		int result=obj.deleteCardDetails(id);
		return result==1?"success":"failure";
	}
	@GetMapping(value={"/editUserCardDetails","user/editUserCardDetails"})
	public String editCardDetails(@ModelAttribute Card card,HttpServletRequest request,Model model)
	{
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("userProfile");
		card.setStatus(true);
		card.setId(user.getId());
		System.out.println(card);
		model.addAttribute("headermessage", "User Card Details");
		model.addAttribute("message", "User Card Details Updated Successfully" );
 	int result=obj.updateCardDetails(card);
 		return result==1?"success":"failure";
	}
	@GetMapping("/loginUser")
	public String validateUser(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request) throws UserInvalidCredentialsException
	{
		HttpSession session=request.getSession();
		User user;
		Card card;
		try
		{
		user=obj.validateUser(email);
		card=obj.getCard(user.getId());
	}
	catch(EmptyResultDataAccessException e)
		{
		throw new UserInvalidCredentialsException();
		}
		//System.out.println(user.getPasswordSalt());
	   // System.out.println(oldHash);
		System.out.println(user);
		String newHash=Password.generateHash(password,user.getPasswordSalt());
	    String oldHash=user.getPasswordHash();
	    
	    
	    if(oldHash.equals(newHash))
	    {
	    	session.setAttribute("userProfile", user);
	    	session.setAttribute("cardInfo", card);
	    	return "user_dashboard";
	    }
	    else
	    {
	    	throw new UserInvalidCredentialsException();
	    	//return "failure";
	    }
	}

	@GetMapping(value={"userProfilePage","user/userProfilePage","flight/userProfilePage"})
	public String getProfilePage(HttpSession session,Model model) throws UserSessionExpired
	{
		User userProfile=(User) session.getAttribute("userProfile");
		
		
		if(userProfile!=null)
		{
			User user=obj.getUser(userProfile.getId());
		  Card card=obj.getCard(userProfile.getId());
		  session.setAttribute("updatedCard", card);
		  session.setAttribute("updatedUser", user);
			System.out.println(userProfile);
			
		   return "user_profile_page";
		}
		else
		{
			throw new UserSessionExpired();
			//return "login_user";
		}
		
	}
	
	@GetMapping(value={"/updateProfilePage","user/updateProfilePage","flight/updateProfilePage"})
	public String getUpdateUserProfilePage(@RequestParam("email") String email,Model model)
	{
		User user=obj.getUser(email);
		System.out.println(user);
		model.addAttribute("userInfo",user);
		return "update_user_profile";
	}
	
	@GetMapping(value={"/updateProfile","flight/updateProfile"})
	public String updateUserProfile(@ModelAttribute User user,Model model)
	{
		model.addAttribute("headermessage","User Profile Updation");
		model.addAttribute("message","User Profile details updated Successfully");
		System.out.println(user);
		int result=obj.updateUser(user);
		
		return result==1?"success":"failure";
	}
	
	@GetMapping(value={"/logout","flight/logout"})
	public String Userlogout(HttpSession session, Model model) {

		session.invalidate();
		return "login_user";

	}
	
	
	
}

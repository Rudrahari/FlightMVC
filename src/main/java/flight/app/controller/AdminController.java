package flight.app.controller;


import java.sql.Date;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import flight.app.entities.Admin;
import flight.app.exceptionHandler.AdminInvalidCredentialsException;
import flight.app.exceptionHandler.AdminSessionExpired;
import flight.app.repository.AdminDaoImpl;
import flight.app.utilities.Password;

@Controller
public class AdminController {

	@Autowired
	AdminDaoImpl obj;
	

	@GetMapping("/")
	public String getWelcomePage() {
		return "welcome";
	}
	@GetMapping("/admin")
	public String getAdminPage() {
		return "admin";
	}
	@GetMapping(value={"/adminRegister","admin/adminRegister"})
	public String getRegistrerAdminPage() {
		return "register_admin";
	}
	@GetMapping(value={"/adminLogin","admin/adminLogin"})
	public String getLoginAdminPage() {
		return "login_admin";
	}
	@GetMapping(value={"displayAdmins","admin/displayAdmins"})
	public String getviewAdminsListPage(Model model,HttpServletRequest request) throws AdminSessionExpired
	{
		HttpSession session=request.getSession();
		Admin adminProfile=(Admin) session.getAttribute("adminProfile");
		if(adminProfile!=null)
		{
			List<Admin> adminsList=obj.getAllAdmins();
			model.addAttribute("displayAdminsList", adminsList);
			return "view_admin_list";
		}
		else
		{
			throw new AdminSessionExpired();
		}
		
	}
	@GetMapping(value={"/revokeAccess","admin/revokeAccess"})
	public String revokeAdminAccess(
			@RequestParam("email") String email)
	{
		System.out.println(email);
		int result=obj.revokeAdmin(email);
		if(result==1)
		{
		return "redirect:/displayAdmins";
		}
		else
		{
			
			return "failure";
		}
	}
	@GetMapping("admin/home")
	public String getAdminDashboard(HttpServletRequest request) throws AdminSessionExpired
	{ 
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("adminProfile");
		if(admin==null)
		{
			throw new AdminSessionExpired();
		}
		if(admin.isRoot())
		{
			return "root_admin_dashboard";
		}
		
		return "admin_dashboard";
	}
	@GetMapping(value={"/grantAccess","/admin/grantAccess"})
	public String grantAdminAccess(
			@RequestParam("email") String email)
	{
		int result=obj.grantAdmin(email);
		if(result==1)
		{
			return "redirect:/displayAdmins";
		}
		else
		{
			return "failure";
		}
	}

	@GetMapping(value={"/addAdmin","admin/addAdmin"})
	public String handleFormData(
			
			@RequestParam("full_name") String fullName,
			@RequestParam("email") String email,
			@RequestParam("mobile") String mobile,
			@RequestParam("date_of_birth") String dateOfBirth,
			@RequestParam("gender") String gender,
			@RequestParam("password") String password,
			Model model
			)  {
		
		Date dob = Date.valueOf(dateOfBirth);
		
		String passwordSalt=Password.generateSalt();
		String passwordHash=Password.generateHash(password, passwordSalt);
		
		Admin admin=new Admin(fullName, email, mobile, dob, gender, passwordSalt, passwordHash,false,false);
		
		System.out.println(admin);
		
		model.addAttribute("message", "Registration Success");
	    int result=0;
	    System.out.println("here");
	    
	    result=obj.insertAdmin(admin);
	    System.out.println("here");
		return result==1?"success_register_admin":"failure";
	}
	
	
	
	@GetMapping(value={"admin/loginAdmin","/loginAdmin","admin/admin/loginAdmin"})  
	public String validateUser(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request,
			Model model) throws AdminInvalidCredentialsException
	{
		HttpSession session=request.getSession();
		Admin admin;
		try {
	     admin=obj.validateAdmin(email);
		}
		catch(EmptyResultDataAccessException e)
		{
			throw new AdminInvalidCredentialsException();
		}
		
	   // System.out.println(oldHash);
		String newHash=Password.generateHash(password,admin.getPasswordSalt());
	    String oldHash=admin.getPasswordHash();
	    
	  //  System.out.println(newHash);
	    System.out.println(admin.getPasswordSalt());
	    System.out.println(oldHash);
	    
	    if(oldHash.equals(newHash))
	    {
	    	session.setAttribute("adminProfile", admin);
	    	if(obj.isRootAdmin(email))
	    	{
	    		return "root_admin_dashboard";
	    	}
	    	if(obj.isAdminApproved(email))
	    	{
	    	return "admin_dashboard";
	    	}
	    	else
	    	{
	    		System.out.println("unapproved admin");
	    		model.addAttribute("message","Access is Revoked");
	    		return "login_admin";
	    	}
	    }
	    else
	    {
	    	System.out.println("It was here");
	    	throw new AdminInvalidCredentialsException();
	    	//model.addAttribute("message","Invalid Login Credentials");
	    	//return "login_admin";
	    }
	}
	
	@GetMapping(value={"admin/adminProfilePage","/adminProfilePage"})
	public String getProfilePage(HttpSession session,Model model) throws AdminSessionExpired
	{
	    //fetch the admin details again to show changes in the profile page.
		Admin adminProfile=(Admin) session.getAttribute("adminProfile");
		
		if (adminProfile!=null)
		{ Admin admin=obj.getUpdatedAdmin(adminProfile.getId());
		
		session.setAttribute("updatedAdmin", admin);
			System.out.println(adminProfile);
			
		return "admin_profile_page";
		}
		else
		{
			throw new AdminSessionExpired();
		  //  return "login_admin";
		}
	}
	@GetMapping(value={"admin/updateProfilePage","/updateProfilePage"})
	public String getUpdateProfilePage(@RequestParam("email") String email,Model model)
	{
		Admin admin=obj.getAdmin(email);
		System.out.println(admin);
		model.addAttribute("adminInfo",admin);
		return "update_admin_profile";
	}
	@GetMapping(value={"admin/updateProfile","/updateProfile"})
	public String updateAdminProfile(@ModelAttribute Admin admin)
	{
		System.out.println(admin);
		int result=obj.updateAdmin(admin);
		
		return result==1?"redirect:/adminProfilePage":"failure";
	}
	@GetMapping(value={"/logout","admin/logout","airlines/logout","admin/admin/logout"})
	public String Adminlogout(HttpSession session, Model model) {

		session.invalidate();
		return "login_admin";

	}
	
	
	
	
	
	
}

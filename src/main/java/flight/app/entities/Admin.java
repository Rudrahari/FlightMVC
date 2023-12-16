package flight.app.entities;

import java.sql.Date;

public class Admin {

	private int id;
	private  String fullName;
	private  String email;
	private  String mobile;
	private  Date  dob;
	private  String gender;
	private String passwordSalt;
	private String passwordHash;
	private boolean isActive;
	private boolean isRoot;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin( String fullName, String email, String mobile, Date dob, String gender, String passwordSalt,
			String passwordHash, boolean isActive, boolean isRoot) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.gender = gender;
		this.passwordSalt = passwordSalt;
		this.passwordHash = passwordHash;
		this.isActive = isActive;
		this.isRoot = isRoot;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPasswordSalt() {
		return passwordSalt;
	}
	public void setPasswordSalt(String passwordSalt) {
		this.passwordSalt = passwordSalt;
	}
	public String getPasswordHash() {
		return passwordHash;
	}
	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public boolean isRoot() {
		return isRoot;
	}
	public void setRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}
	public String getAccess()
	{
		if(isActive())
		{
			return "Granted";
		}
		else
		{
			return "Revoked";
		}
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", fullName=" + fullName + ", email=" + email + ", mobile=" + mobile + ", dob=" + dob
				+ ", gender=" + gender + ", passwordSalt=" + passwordSalt + ", passwordHash=" + passwordHash
				+ ", isActive=" + isActive + ", isRoot=" + isRoot + "]";
	}
	
	
	
}

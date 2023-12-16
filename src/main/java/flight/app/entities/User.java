package flight.app.entities;

import java.sql.Date;

public class User {

	private int id;
	private  String fullName;
	private  String email;
	private  String mobile;
	private  Date dob;
	private  String gender;
	private String passwordSalt;
	private String passwordHash;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String fullName, String email, String mobile, Date dob, String gender, String passwordSalt,
			String passwordHash) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.dob = dob;
		this.gender = gender;
		this.passwordSalt = passwordSalt;
		this.passwordHash = passwordHash;
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
	@Override
	public String toString() {
		return "User [id=" + id + ", fullName=" + fullName + ", email=" + email + ", mobile=" + mobile + ", dob=" + dob
				+ ", gender=" + gender + ", passwordSalt=" + passwordSalt + ", passwordHash=" + passwordHash + "]";
	}
	
	
}

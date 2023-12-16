package flight.app.repository;

import java.util.List;

import flight.app.entities.Admin;

public interface AdminDao {
	int insertAdmin(Admin admin);
	int updateAdmin(Admin admin);
	Admin validateAdmin(String email);
	boolean isAdminApproved(String email);
	boolean isRootAdmin(String email);
	List<Admin> getAllAdmins();
	int revokeAdmin(String email);
	int grantAdmin(String email);
	Admin getAdmin(String email);
	
	Admin getUpdatedAdmin(int id);
}

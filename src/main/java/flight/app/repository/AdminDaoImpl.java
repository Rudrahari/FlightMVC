package flight.app.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import flight.app.entities.Admin;


public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int insertAdmin(Admin admin) {
		String INSERTQUERY;
		INSERTQUERY="insert into admin(full_name,email,mobile,dob,gender,password_salt,password_hash,is_root,is_active) values(?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(INSERTQUERY,admin.getFullName(),admin.getEmail(),
				admin.getMobile(),admin.getDob(),admin.getGender(),admin.getPasswordSalt(),admin.getPasswordHash()
				,admin.isRoot(),admin.isActive());
	}

	@Override
	public Admin validateAdmin(String email) {
		// TODO Auto-generated method stub
		String GET_PASSWORD="select * from admin where email=?";
		
		return jdbcTemplate.queryForObject(GET_PASSWORD, new AdminRowMapper(),email);
	}

	@Override
	public boolean isAdminApproved(String email) {
		// TODO Auto-generated method stub
		String GET_STATUS="select * from admin where email=?";
		
		Admin ad=jdbcTemplate.queryForObject(GET_STATUS, new AdminRowMapper(),email);
		return ad.isActive();
	}

	@Override
	public boolean isRootAdmin(String email) {
		// TODO Auto-generated method stub
        String GET_STATUS="select * from admin where email=?";
		
		Admin ad=jdbcTemplate.queryForObject(GET_STATUS, new AdminRowMapper(),email);
		return ad.isRoot();
	}

	@Override
	public List<Admin> getAllAdmins() {
		// TODO Auto-generated method stub
		String GET_ADMINS="select * from admin where is_root=?";
		List<Admin> adminList=jdbcTemplate.query(GET_ADMINS, new AdminRowMapper(), false);
		return adminList;
	}

	@Override
	public int revokeAdmin(String email) {
		// TODO Auto-generated method stub
		String REVOKE="update admin set is_active=? where email=?";
		System.out.println(email);
		return jdbcTemplate.update(REVOKE,false,email);
	}

	@Override
	public int grantAdmin(String email) {
		// TODO Auto-generated method stub
		String GRANT="update admin set is_active=? where email=?";
		return jdbcTemplate.update(GRANT,true,email);
	}

	@Override
	public Admin getAdmin(String email) {
		// TODO Auto-generated method stub
		String GET_ADMIN="select * from admin where email=?";
		Admin admin=jdbcTemplate.queryForObject(GET_ADMIN,new AdminRowMapper(),email);
		return admin;
	}

	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		String UPDATE_QUERY="update admin set full_name=?,email=?,mobile=?,dob=?,gender=? where id=?";
		return jdbcTemplate.update(UPDATE_QUERY,admin.getFullName(),admin.getEmail(),
				admin.getMobile(),admin.getDob(),admin.getGender(),admin.getId());
	}

	@Override
	public Admin getUpdatedAdmin(int id) {
		// TODO Auto-generated method stub
		String GET_QUERY="select * from admin where id=?";
		return jdbcTemplate.queryForObject(GET_QUERY, new AdminRowMapper(),id);
	}
	
	
	
	

	
	

}
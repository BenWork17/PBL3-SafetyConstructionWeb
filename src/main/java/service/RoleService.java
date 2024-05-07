package service;

import java.util.List;

import model.Role;
import repository.RolesRepository;

public class RoleService {
	private RolesRepository repository = new RolesRepository();

	public List<Role> getRole() {
		return repository.getRole();
	}
}

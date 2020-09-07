package com.myproject.library.service.role;

import com.myproject.library.model.Role;


import java.util.List;

public interface RoleService {
    public List<Role> getAllRoles();
    public Role getRoleByName(String name);
}

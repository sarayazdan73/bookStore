package com.myproject.library.service.role;

import com.myproject.library.model.Role;

import com.myproject.library.repository.RoleRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepositry roleRepositry;
    @Override
    public List<Role> getAllRoles() {
        List<Role> users = roleRepositry.findAll();
        return users;
    }

    @Override
    public Role getRoleByName(String name) {
        Role role= roleRepositry.findRoleByName(name);
        return role;
    }
}

package com.myproject.library.repository;

import com.myproject.library.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RoleRepositry extends JpaRepository<Role,Long> {

        List<Role> findAll();
        Role findRoleByName(String name);
}

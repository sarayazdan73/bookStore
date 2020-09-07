package com.myproject.library.repository;

import com.myproject.library.model.Role;
import com.myproject.library.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    List<User> findAll();


    //  @Query("select u from User u where u.userName = ?#{principal.username}")
    User findUserByUserName(String username);
    User findUserByName(String name);
}

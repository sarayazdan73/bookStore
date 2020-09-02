package com.myproject.library.repository;

import com.myproject.library.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User,Long> {

    List<User> findAll();

    //  @Query("select u from User u where u.userName = ?#{principal.username}")
    User findUserByUserName(String username);
}

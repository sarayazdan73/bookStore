package com.myproject.library.service.user;

import com.myproject.library.model.Book;
import com.myproject.library.model.Library;
import com.myproject.library.model.Role;
import com.myproject.library.model.User;
import com.myproject.library.repository.RoleRepositry;
import com.myproject.library.repository.UserRepository;
import com.myproject.library.service.dto.UserDto;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    RoleRepositry roleRepositry;

    public List<User> getAllUsers(){

        List<User> users = userRepository.findAll();

        return users;
    }

    @Override
    public void deleteUser(long id) {
        Optional<User> UserDb = this.userRepository.findById(id);

        if (UserDb.isPresent()) {
            this.userRepository.delete(UserDb.get());
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + id);
        }
    }

    @Transactional
    public void adduser(User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }
    @Transactional
    public void addusers(UserDto user){
        Role role=new Role();
        Role role1 = roleRepositry.findRoleByName(user.getRole());
        User user1=userRepository.findUserByName(user.getName());
        role.setId(role1.getId());
        user1.setRole(role);
        user1.setName(user.getName());
//        user1.setPassword(user2.getPassword());
//        user1.setUserName(user2.getUserName());
        userRepository.save(user1);

    }

}

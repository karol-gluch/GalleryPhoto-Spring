package pl.stackfans.doshopping.service;

import pl.stackfans.doshopping.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
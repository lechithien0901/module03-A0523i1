package com.example.ss13.service;

import com.example.ss13.model.User;

import java.util.List;

public interface IUerService {
    List<User> listAll();
    void addUser(User user);
    void deleteUser(int id);
    User select(int id);
    void updateUser(User user);

}

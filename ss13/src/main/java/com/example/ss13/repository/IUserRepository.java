package com.example.ss13.repository;

import com.example.ss13.model.User;

import java.util.List;

public interface IUserRepository {
    List<User>listAll();
    void addUser(User user);
    void deleteUser(int id);
    User select(int id);
    void updateUser(User user);

}

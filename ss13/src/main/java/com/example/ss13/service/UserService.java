package com.example.ss13.service;

import com.example.ss13.model.User;
import com.example.ss13.repository.IUserRepository;
import com.example.ss13.repository.UserRepository;

import java.util.List;

public class UserService implements IUerService{
    IUserRepository iUserRepository=new UserRepository();
    @Override
    public List<User> listAll() {
        return iUserRepository.listAll();
    }

    @Override
    public void addUser(User user) {
        iUserRepository.addUser(user);

    }

    @Override
    public void deleteUser(int id) {
        iUserRepository.deleteUser(id);

    }

    @Override
    public User select(int id) {
        return iUserRepository.select(id);
    }

    @Override
    public void updateUser(User user) {
        iUserRepository.updateUser(user);

    }
}

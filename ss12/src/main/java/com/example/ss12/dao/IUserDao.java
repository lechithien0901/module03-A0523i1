package com.example.ss12.dao;

import com.example.ss12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    void  insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUser();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User>sortUser();
    User selectCountry(String country);
    void insertUserStore(User user) throws SQLException;
    User getUserById(int id);
    void addUserTransaction(User user, int[] permision);
}

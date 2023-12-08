package com.example.ss12.dao;

import com.example.ss12.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {
    private static final String INSERT_USERS_SQL = "insert into users(name,email,country)\n" +
            "values(?,?,?)";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id=?";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USERS_SQL = "delete from users where id=?";
    private static final String UPDATE_USERS_SQL = "update users set name=?,email=?,country=?where id=?";
    private static final String ORDER_USER_BY_NAME = "select id,name,email,country from users order by name;";
    private static final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from users where country=?;";
    private static final String QUERY="CALL get_user_by_id(?)";
    private static final String INSERT_USER="call insert_user(?);";

    @Override
    public void insertUser(User user) {
        System.out.println(INSERT_USERS_SQL);
        try {
            Connection connection = BaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User selectUser(int id) {
        User user = null;

        try {
            Connection connection = BaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseDao.getConnection();


             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseDao.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        try (Connection connection = BaseDao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;


        }
        return rowUpdate;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState:" + ((SQLException) e).getSQLState());
                System.err.println("Error code:" + ((SQLException) e).getErrorCode());
                System.err.println("Message:" + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause:" + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public List<User> sortUser() {
        Connection connection = BaseDao.getConnection();
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_USER_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                list.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public User selectCountry(String country) {
        User user=null;
        Connection connection=BaseDao.getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1,country);

            ResultSet resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                int id=resultSet.getInt("id");
                user=new User(id,name,email,country);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        Connection connection=BaseDao.getConnection();
        CallableStatement callableStatement=connection.prepareCall(INSERT_USER);
        callableStatement.setString(1,user.getName());
        callableStatement.setString(2,user.getEmail());
        callableStatement.setString(3,user.getCountry());
        callableStatement.executeUpdate();


    }

    @Override
    public User getUserById(int id) {
        User user=null;
        Connection connection=BaseDao.getConnection();
        try {
            CallableStatement callableStatement=connection.prepareCall(QUERY);
            callableStatement.setInt(1,id);
            ResultSet resultSet=callableStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        Connection connection=null;
        PreparedStatement pstmt=null;
        PreparedStatement pstmtAssigment=null;
        ResultSet resultSet=null;
        try {
            connection=BaseDao.getConnection();
            connection.setAutoCommit(false);
            pstmt=connection.prepareStatement(INSERT_USERS_SQL,Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getCountry());
            int rowAffected=pstmt.executeUpdate();
            resultSet=pstmt.getGeneratedKeys();
            int userId=0;
            if (resultSet.next()){
                userId=resultSet.getInt(1);

            }
if (rowAffected==1){

}

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

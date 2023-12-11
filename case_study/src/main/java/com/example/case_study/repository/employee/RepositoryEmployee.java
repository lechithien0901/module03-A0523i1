package com.example.case_study.repository.employee;

import com.example.case_study.model.employee.Employee;
import com.example.case_study.model.employee.EmployeeDTO;
import com.example.case_study.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RepositoryEmployee implements IRepositoryEmployee {
    private static final String SHOW = "select ep.employee_id ,ep.employee_name,ep.employee_birthday,ep.employee_id_card,ep.employee_salary,ep.employee_phone,ep.employee_email,ep.employee_address,p.position_name,ed.education_degree_name,di.division_name,u.password\n" +
            "from employee ep join position p on ep.employee_id=p.position_id join education_degree ed on ed.education_degree_id=p.position_id join division di on ep.employee_id=di.division_id join user u ;";

    @Override
    public List<EmployeeDTO> showAll() {
        List<EmployeeDTO>list=new ArrayList<>();
        Connection connection= BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("employee_id");
                String name=resultSet.getString("employee_name");
                Date date=resultSet.getDate("employee_birthday");
                String id_card=resultSet.getString("employee_id_card");
                double salary=resultSet.getDouble("employee_salary");
                String phone=resultSet.getString("employee_phone");
                String email=resultSet.getString("employee_email");
                String address=resultSet.getString("employee_address");
                String position=resultSet.getString("position_name");
                String education=resultSet.getString("education_degree_name");
                String division=resultSet.getString("division_name");
                String pass=resultSet.getString("password");
                list.add(new EmployeeDTO(id,name,date,id_card,salary,phone,email,address,position,education,division,pass));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void addEmployee(Employee employee) {

    }
}

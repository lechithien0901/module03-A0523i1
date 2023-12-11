package com.example.case_study.service.employee;

import com.example.case_study.model.employee.Employee;
import com.example.case_study.model.employee.EmployeeDTO;
import com.example.case_study.repository.employee.IRepositoryEmployee;
import com.example.case_study.repository.employee.RepositoryEmployee;

import java.util.List;

public class ServiceEmployee implements IServiceEmployee {
    IRepositoryEmployee iRepositoryEmployee =new RepositoryEmployee();
    @Override
    public List<EmployeeDTO> showAll() {
        return iRepositoryEmployee.showAll();
    }

    @Override
    public void addEmployee(Employee employee) {

    }
}

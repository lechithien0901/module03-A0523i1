package com.example.case_study.repository.employee;

import com.example.case_study.model.employee.Employee;
import com.example.case_study.model.employee.EmployeeDTO;

import java.util.List;

public interface IRepositoryEmployee {
    List<EmployeeDTO>showAll();
    void addEmployee(Employee employee);

}

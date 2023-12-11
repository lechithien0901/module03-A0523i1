package com.example.case_study.service.employee;

import com.example.case_study.model.employee.Employee;
import com.example.case_study.model.employee.EmployeeDTO;

import java.util.List;

public interface IServiceEmployee {
    List<EmployeeDTO> showAll();
    void addEmployee(Employee employee);

}

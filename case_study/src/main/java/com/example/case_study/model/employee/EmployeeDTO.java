package com.example.case_study.model.employee;

import java.util.Date;

public class EmployeeDTO {
    private int employee_id;
    private String employee_name;
    private Date employee_birthday;
    private String employee_id_card;
    private double employee_salary;
    private String employee_phone;
    private String employee_email;
    private String employee_address;
    private String position_name;
    private String education_degree_name;
    private String division_name;
    private String password;

    public EmployeeDTO(String employee_name, Date employee_birthday, String employee_id_card, double employee_salary, String employee_phone, String employee_email, String employee_address, String position_name, String education_degree_name, String division_name, String password) {
        this.employee_name = employee_name;
        this.employee_birthday = employee_birthday;
        this.employee_id_card = employee_id_card;
        this.employee_salary = employee_salary;
        this.employee_phone = employee_phone;
        this.employee_email = employee_email;
        this.employee_address = employee_address;
        this.position_name = position_name;
        this.education_degree_name = education_degree_name;
        this.division_name = division_name;
        this.password = password;
    }

    public EmployeeDTO() {
    }

    public EmployeeDTO(int employee_id, String employee_name, Date employee_birthday, String employee_id_card, double employee_salary, String employee_phone, String employee_email, String employee_address, String position_name, String education_degree_name, String division_name, String password) {
        this.employee_id = employee_id;
        this.employee_name = employee_name;
        this.employee_birthday = employee_birthday;
        this.employee_id_card = employee_id_card;
        this.employee_salary = employee_salary;
        this.employee_phone = employee_phone;
        this.employee_email = employee_email;
        this.employee_address = employee_address;
        this.position_name = position_name;
        this.education_degree_name = education_degree_name;
        this.division_name = division_name;
        this.password = password;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public Date getEmployee_birthday() {
        return employee_birthday;
    }

    public void setEmployee_birthday(Date employee_birthday) {
        this.employee_birthday = employee_birthday;
    }

    public String getEmployee_id_card() {
        return employee_id_card;
    }

    public void setEmployee_id_card(String employee_id_card) {
        this.employee_id_card = employee_id_card;
    }

    public double getEmployee_salary() {
        return employee_salary;
    }

    public void setEmployee_salary(double employee_salary) {
        this.employee_salary = employee_salary;
    }

    public String getEmployee_phone() {
        return employee_phone;
    }

    public void setEmployee_phone(String employee_phone) {
        this.employee_phone = employee_phone;
    }

    public String getEmployee_email() {
        return employee_email;
    }

    public void setEmployee_email(String employee_email) {
        this.employee_email = employee_email;
    }

    public String getEmployee_address() {
        return employee_address;
    }

    public void setEmployee_address(String employee_address) {
        this.employee_address = employee_address;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public String getEducation_degree_name() {
        return education_degree_name;
    }

    public void setEducation_degree_name(String education_degree_name) {
        this.education_degree_name = education_degree_name;
    }

    public String getDivision_name() {
        return division_name;
    }

    public void setDivision_name(String division_name) {
        this.division_name = division_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

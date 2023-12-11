package com.example.case_study.controller.employee;

import com.example.case_study.model.employee.EmployeeDTO;
import com.example.case_study.service.employee.IServiceEmployee;
import com.example.case_study.service.employee.ServiceEmployee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IServiceEmployee iServiceEmployee=new ServiceEmployee();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            default:showList(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    public void showList(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("employee/list.jsp");
        List<EmployeeDTO>list=iServiceEmployee.showAll();
        request.setAttribute("list",list);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

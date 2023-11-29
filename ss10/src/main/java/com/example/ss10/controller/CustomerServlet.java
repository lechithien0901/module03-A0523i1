package com.example.ss10.controller;

import com.example.ss10.model.Customer;
import com.example.ss10.repository.CustomerRepository;
import com.example.ss10.repository.ICustomerRepository;
import com.example.ss10.service.CustomerService;
import com.example.ss10.service.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CustomerServlet",value = "/customers")
public class CustomerServlet extends HttpServlet {
  ICustomerService iCustomerService=new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
listCustomer(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void listCustomer(HttpServletRequest request,HttpServletResponse response){
        ArrayList<Customer>list =this.iCustomerService.list();

        request.setAttribute("list",list);
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");

        try {
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();

        }catch (ServletException e){
            e.printStackTrace();
        }
    }
}

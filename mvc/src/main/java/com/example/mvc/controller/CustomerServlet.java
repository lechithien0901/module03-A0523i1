package com.example.mvc.controller;

import com.example.mvc.model.Customer;
import com.example.mvc.service.CustomerService;
import com.example.mvc.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "view":
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
            switch (action) {
                case "create":
                    createCustomer(request,response);
                    break;
                case "delete":
                        deleteCustomer(request,response);
                    break;
                case "edit":
                    updateCustomer(request,response);
                    break;
                default:
                    break;
            }

    }

    public void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = this.customerService.findAll();
        request.setAttribute("customers",customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
    public void showCreateForm(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }
    }
    public void createCustomer(HttpServletRequest request,HttpServletResponse response){
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        int id=(int)(Math.random()*10000);
        Customer customer=new Customer(id,name,email,address);
        this.customerService.save(customer);
        RequestDispatcher dispatcher=request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("message","đối tượng đã thêm mới thành công");
        try {
           dispatcher.forward(request,response);

        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }
    }
    public void showEditForm(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Customer customer=this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer==null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");

        }else {
            dispatcher=request.getRequestDispatcher("customer/edit.jsp");
            request.setAttribute("customer",customer);
        }
try{
    dispatcher.forward(request,response);
}catch (IOException e){
    e.printStackTrace();
}catch (ServletException e){
    e.printStackTrace();
}
    }
    public void updateCustomer(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String address=request.getParameter("address");
        Customer customer=this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer==null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");
        }
        else {
            dispatcher=request.getRequestDispatcher("customer/edit.jsp");

            customer.setName(name);
            customer.setAddress(address);
            customer.setEmail(email);
            request.setAttribute("customer",customer);
            request.setAttribute("message","đối tượng bạn đã vừa update");
        }try{
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }

    }
    public void showDeleteForm(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Customer customer=this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer==null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");
        }
        else {
            dispatcher=request.getRequestDispatcher("customer/delete.jsp");
            request.setAttribute("customer",customer);
        }try{
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }


    }
    public void deleteCustomer(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Customer customer=this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer==null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");

        }else {
            this.customerService.remove(id);
        }
        try {
            response.sendRedirect("/customers");
        }catch (IOException e){
            e.printStackTrace();
        }
    }



}

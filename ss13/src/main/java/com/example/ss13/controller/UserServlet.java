package com.example.ss13.controller;

import com.example.ss13.model.User;
import com.example.ss13.service.IUerService;
import com.example.ss13.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet ", value = "/user_servlet")
public class UserServlet extends HttpServlet {
    private IUerService iUerService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAdd(request, response);
                break;
            case "update":
                showUpdate(request,response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            default:
                listUser(request, response);
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
            case "add":
                addUsers(request, response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "update":
                updateUser(request,response);
                break;
        }
    }

    public void listUser(HttpServletRequest request, HttpServletResponse response) {

        List<User> list = iUerService.listAll();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/listall.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    public void showAdd(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    public void addUsers(HttpServletRequest request,HttpServletResponse response){


        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
       User user=new User(name,email,country);
       iUerService.addUser(user);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void  showUpdate(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("idFix"));
        User user=iUerService.select(id);
        request.setAttribute("user",user);
        RequestDispatcher dispatcher=request.getRequestDispatcher("update.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void updateUser(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("idFix"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=iUerService.select(id);
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        iUerService.updateUser(user);
        request.setAttribute("user",user);
       RequestDispatcher requestDispatcher=request.getRequestDispatcher("update.jsp");

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void showDelete(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("delete.jsp");
        int id=Integer.parseInt(request.getParameter("idDelete"));
        User user=this.iUerService.select(id);
        request.setAttribute("user",user);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void deleteUser(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("idDelete"));
        this.iUerService.deleteUser(id);

        try {
            response.sendRedirect("/user_servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}

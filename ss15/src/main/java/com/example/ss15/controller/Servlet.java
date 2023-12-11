package com.example.ss15.controller;

import com.example.ss15.model.Category;
import com.example.ss15.model.Product;
import com.example.ss15.service.category.IServiceCategory;
import com.example.ss15.service.category.ServiceCategory;
import com.example.ss15.service.product.IServiceProduct;
import com.example.ss15.service.product.ServiceProduct;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlet ",value ="/servlet")
public class Servlet extends HttpServlet {
    IServiceProduct iServiceProduct=new ServiceProduct();
    IServiceCategory iServiceCategory=new ServiceCategory();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action=request.getParameter("action");
if (action==null){
    action="";
}
switch (action){
    case "delete":
        showDelete(request,response);
        break;
    case "create":
        showCreate(request,response);

        break;
    case "update":
        showUpdate(request,response);
        break;
    default:showList(request,response);
    break;

}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "delete":
                delete(request,response);
                break;
            case "create":
                create(request,response);
                break;
            case "update":
                update(request,response);
                break;
        }
    }
    public void showList(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        List<Product>list=iServiceProduct.showListDTO();
        request.setAttribute("list",list);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showDelete(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Product productDTO=this.iServiceProduct.select(id);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("delete.jsp");
        request.setAttribute("productDTO",productDTO);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void delete(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        this.iServiceProduct.delete(id);
        try {
            response.sendRedirect("/servlet");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void showCreate(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("create.jsp");
        List<Category>list;
        list=this.iServiceCategory.showListCategory();
        request.setAttribute("list",list);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public  void create(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("create.jsp");
        int id =Integer.parseInt(request.getParameter("categoryId"));
        Category category=this.iServiceCategory.findCategoryById(id);
        String name=request.getParameter("name");
        Product product=new Product(name,category);
        this.iServiceProduct.create(product);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showUpdate(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/update.jsp");
        int id=Integer.parseInt(request.getParameter("idUpdate"));
        Product productDTO=this.iServiceProduct.select(id);
        request.setAttribute("productDTO",productDTO);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public void update(HttpServletRequest request,HttpServletResponse response){


        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/update.jsp");
        int id=Integer.parseInt(request.getParameter("idUpdate"));

        int categoryId=Integer.parseInt(request.getParameter("categoryId"));
        String name=request.getParameter("name");
       Category category1=this.iServiceCategory.findCategoryById(categoryId);
       Product p = new Product(id, name, category1);
        this.iServiceProduct.update(p);
//        this.iServiceCategory.update(category1);
        request.setAttribute("productDTO",p);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

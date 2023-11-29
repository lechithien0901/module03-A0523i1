package com.example.ss11.controller;

import com.example.ss11.model.Product;
import com.example.ss11.service.ProductService;
import com.example.ss11.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

    @WebServlet(name = "ProductServlet",value = "/products")
public class ProductServlet extends HttpServlet {
    ProductService productService=new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":

                break;
            case "delete":
                showDeleteProduct(request,response);
                break;
            case "update":
                break;
            case "view":
                break;
            default:
                listProduct(request,response);
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
    case "add":
        break;
    case "delete":
        deleteProduct(request,response);
        break;
    case "update":
        break;
    default:
        break;
}
    }
    public void listProduct(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/list.jsp");
        List<Product>list= productService.listProduct();
        request.setAttribute("list",list);
        try {
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }

    }public void showDeleteProduct(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/delete.jsp");
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=this.productService.findById(id);
        request.setAttribute("product",product);
        try {
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }
        }
        public void deleteProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
       Product product=this.productService.findById(id);
       RequestDispatcher dispatcher;
       this.productService.deleteProduct(id);
       try{
           response.sendRedirect("/products");
       }catch (IOException e){
           e.printStackTrace();
       }

        }
}

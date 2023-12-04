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

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showCreateProduct(request, response);

                break;
            case "delete":
                showDeleteProduct(request, response);
                break;
            case "update":
                showUpdateProduct(request,response);
                break;
            case "view":
                break;
            default:
                listProduct(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                createProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "update":
                updateProduct(request,response);
                break;
            default:
                break;
        }
    }

    public void listProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        List<Product> list = productService.listProduct();
        request.setAttribute("list", list);
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }

    }

    public void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/delete.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        request.setAttribute("product", product);
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        this.productService.deleteProduct(id);
        try {
            response.sendRedirect("/products");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }


    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) {

        RequestDispatcher dispatcher;

        dispatcher = request.getRequestDispatcher("product/add.jsp");
        String name = request.getParameter("name");

        double salary = Double.parseDouble(request.getParameter("salary"));
        String productDescription = request.getParameter("mota");
        String producer = request.getParameter("sanxuat");
        Product product = new Product( name, salary, productDescription, producer);
        this.productService.addProduct(product);
        request.setAttribute("message", "đối tượng bạn đã được thêm vào thành công");
        try {
            dispatcher.forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();


        }
    }
    public void showUpdateProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product==null){
            dispatcher=request.getRequestDispatcher("product/error.jsp");

        }else { request.setAttribute("product",product);
            dispatcher=request.getRequestDispatcher("product/update.jsp");

            try {
                dispatcher.forward(request,response);
            }catch (IOException e){
                e.printStackTrace();
            }catch (ServletException e){
                e.printStackTrace();
            }
        }
    }
    public void updateProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String mota=request.getParameter("mota");
        String sanxuat=request.getParameter("sanxuat");

        RequestDispatcher dispatcher;
        Product product=productService.findById(id);
        if (product==null){
            dispatcher=request.getRequestDispatcher("product/error.jsp");

        }
        else {
            product.setNameProduct(name);
            product.setSalaryProduct(salary);
            product.setProductDescription(mota);
            product.setProducer(sanxuat);
            productService.updateProduct(id,product);

            request.setAttribute("message","ban da cap nhat thanh cong");
            request.setAttribute("product",product);
            dispatcher=request.getRequestDispatcher("product/update.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }
}

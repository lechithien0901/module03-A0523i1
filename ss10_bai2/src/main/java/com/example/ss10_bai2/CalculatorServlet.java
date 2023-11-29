package com.example.ss10_bai2;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       list(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double firstNumber=Double.parseDouble(request.getParameter("sothunhat"));
            double secondNumber=Double.parseDouble(request.getParameter("sothu2"));
            String operation=request.getParameter("operation");
            Calculator calculator=new Calculator();
            double result=calculator.totalCalculator(firstNumber,secondNumber,operation);
            request.setAttribute("result",result);
            RequestDispatcher dispatcher=request.getRequestDispatcher("display.jsp");
            dispatcher.forward(request,response);
        }catch (IOException e){
            e.printStackTrace();
        }catch (ServletException e){
            e.printStackTrace();
        }catch (NumberFormatException e){
            e.printStackTrace();
        }



    }
    public void list(HttpServletRequest request,HttpServletResponse response){
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

package com.example.ss10_bai2;

public class Calculator {

    public double totalCalculator(double firstNumber,double secondNumber,String  operation){
        try {
            switch (operation){
                case "add":
                    return firstNumber+secondNumber;

                case "subtract":
                    return firstNumber-secondNumber;

                case "multiply":
                    return firstNumber*secondNumber;

                case "divide":
                    if (secondNumber==0){
                        throw new ArithmeticException("lỗi phép tính không thực hiện được");
                    }
                    return firstNumber/secondNumber;

            }
        }catch (ArithmeticException e){
            e.getMessage();
        }
        return 0;

    }
}

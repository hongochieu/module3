package com.example.product_discount_calculator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "discountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String description = request.getParameter("productDescription");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Discount Result</title></head><body>");
        out.println("<h2>Product Discount Calculator</h2>");
        out.println("<p>Product Description: " + description + "</p>");
        out.println("<p>List Price: " + listPrice + "</p>");
        out.println("<p>Discount Percent: " + discountPercent + " %</p>");
        out.println("<hr>");
        out.println("<p>Discount Amount: " + discountAmount + "</p>");
        out.println("<p>Discount Price: " + discountPrice + "</p>");
        out.println("</body></html>");
    }
}

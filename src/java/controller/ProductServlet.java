package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        List<Category> list = d.getAll();
        String[] pp = {"Dưới 1 triệu", "Từ 1-3 triệu", "Từ 3-5 triệu", "Trên 5 triệu"};
        boolean[] pb = new boolean[pp.length + 1];
        pb[0] = true;
        List<Product> news = d.getNewProducts();
        List<Product> olds = d.getOldProducts();
        boolean[] chid = new boolean[list.size() + 1];
        chid[0] = true;
        request.setAttribute("data", list);
        request.setAttribute("news", news);
        request.setAttribute("olds", olds);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("chid", chid);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

}

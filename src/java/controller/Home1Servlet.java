package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

@WebServlet(name = "Home1Servlet", urlPatterns = {"/home1"})
public class Home1Servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Home1Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home1Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] pp = {"Dưới 1 triệu", "Từ 1-3 triệu", "Từ 3-5 triệu", "Trên 5 triệu"};
        boolean[] pb = new boolean[pp.length + 1];
        DAO d = new DAO();
        List<Category> categories = d.getAll();
        boolean[] chid = new boolean[categories.size() + 1];
        List<Product> products = new ArrayList<>();
        String key = request.getParameter("key");
        if (key != null) {
            products = d.searchByKey(key);
        }
        String cid_raw = request.getParameter("cid");
        String[] cidd_raw = request.getParameterValues("cidd");
        String[] price = request.getParameterValues("price");
        int[] cidd = null;
        int[] id = null;
        int cid = 0;
        
        if (cid_raw != null) {
            cid = Integer.parseInt(cid_raw);
            products = d.getProductsByCid(cid);
            if (cid == 0) {
                chid[0] = true;
            }
        }
        if (cidd_raw != null) {
            cidd = new int[cidd_raw.length];
            for (int i = 0; i < cidd.length; i++) {
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            products = d.seacrhByCheck(cidd);
        }

        if (price != null) {
            id = new int[price.length];
            for (int i = 0; i < price.length; i++) {
                id[i] = Integer.parseInt(price[i]);
            }
        }
        for (int i = 0; i < categories.size(); i++) {
            Category c = categories.get(i);
    }

    private boolean ischeck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

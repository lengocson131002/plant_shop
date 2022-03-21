package com.lson.servlet;

import com.lson.dao.CategoryDAO;
import com.lson.dto.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lengo
 */
public class SaveCategoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String cIdString = request.getParameter("cId");
        String action = request.getParameter("action");

        int cId = 0;

        try {
            cId = Integer.parseInt(cIdString);
        } catch (Exception e) {
        }

        if (cId != 0) {
            Category cate = CategoryDAO.getCategory(cId);
            request.setAttribute("category", cate);
        }

        request.setAttribute("action", action);
        request.getRequestDispatcher("./views/admin/savecategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cIdString = request.getParameter("cId");
        String action = request.getParameter("action");
        String cName = request.getParameter("name");

        int cId = 0;

        try {
            cId = Integer.parseInt(cIdString);
        } catch (Exception e) {
        }

        Category cate = new Category(cId, cName);

        if (cName == null || cName.isBlank()) {
            request.setAttribute("action", action);
            request.setAttribute("category", cate);
            request.setAttribute("nameError", "Category's name is required");
            request.getRequestDispatcher("./views/admin/savecategory.jsp").forward(request, response);
            return;
        }

        boolean result = CategoryDAO.saveCategory(cate);

        if (result) {
            request.setAttribute("saveSuccess", "Category has been just added successfully");
        } else {
            request.setAttribute("saveSuccess", "Failed to add category.Try again");
        }
        request.getRequestDispatcher("viewAllCategories").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

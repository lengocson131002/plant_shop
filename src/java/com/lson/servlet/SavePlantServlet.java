package com.lson.servlet;

import com.lson.dao.CategoryDAO;
import com.lson.dao.PlantDAO;
import com.lson.dto.Category;
import com.lson.dto.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SavePlantServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        get create/update form
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action != null && action.equals("update")) {

            String idString = request.getParameter("pId");
            try {
                int id = Integer.parseInt(idString);
                Plant plant = PlantDAO.findPlant(id);
                request.setAttribute("plant", plant);
                System.out.println(plant);
            } catch (Exception e) {
                response.sendRedirect("admin?action=viewAllPlants");
            }
        }

        List<Category> categories = CategoryDAO.getAllCategories();
        request.setAttribute("action", action);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("./views/admin/saveplant.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String priceString = request.getParameter("price");
        String imgPath = request.getParameter("imgPath");
        String description = request.getParameter("description");
        String cateId = request.getParameter("cateId");
        String action = request.getParameter("action");
        String pId = request.getParameter("pId");

        int price = 0;
        Plant plant = new Plant();

//        validate
        boolean hasError = false;

        if (name == null || name.isBlank()) {
            request.setAttribute("nameError", "Name is required");
            hasError = true;
        }

        try {
            price = Integer.parseInt(priceString);
            if (price < 0) {
                throw new Exception();
            }
        } catch (Exception e) {
            request.setAttribute("priceError", "Invalid price");
            hasError = true;
        }

        if (imgPath == null || imgPath.isBlank()) {
            request.setAttribute("imgPathError", "Image's path is required");
            hasError = true;
        }

        if ("0".equals(cateId)) {
            request.setAttribute("cateError", "Please choose a category");
            hasError = true;
        }

        plant.setName(name);
        plant.setCateId(Integer.parseInt(cateId));
        plant.setPrice(price);
        plant.setImgPath(imgPath);
        plant.setDescription(description);
        plant.setStatus(1);
        if (pId != null && !pId.isBlank()) {
            plant.setId(Integer.parseInt(pId));
        }
        if (hasError) {
            List<Category> categories = CategoryDAO.getAllCategories();
            request.setAttribute("plant", plant);
            request.setAttribute("categories", categories);
            request.setAttribute("action", action);
            request.setAttribute("pId", pId);
            request.getRequestDispatcher("./views/admin/saveplant.jsp").forward(request, response);
        } else {
            System.out.println("SAVE PLANT: " + plant);
            boolean result = PlantDAO.savePlant(plant);

            if (!result) {
                request.setAttribute("saveError", "Something went wrong. Try again");
            } else {
                request.setAttribute("saveSuccess", "Save plant successfully");
            }
            request.getRequestDispatcher("admin?action=viewAllPlants").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

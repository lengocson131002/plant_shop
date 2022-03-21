package com.lson.servlet;

import com.lson.dao.AccountDAO;
import com.lson.dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lengo
 */
public class ChangeProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./views/user/change-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String phone = request.getParameter("phoneNumber");

        boolean hasError = false;

        if (fullname == null || fullname.length() == 0) {
            request.setAttribute("fullnameError", "Fullname is required");
            hasError = true;
        }
        if (password == null || password.length() == 0) {
            request.setAttribute("passwordError", "Password is required");
            hasError = true;
        }

        if (password != null && password.length() < 8) {
            request.setAttribute("passwordError", "Password must contain at least 8 characters");
            hasError = true;
        }

        if (phone == null || phone.length() == 0 || !phone.matches("^[0-9]{10}$")) {
            request.setAttribute("phoneError", "Phone must have 10 digits");
            hasError = true;
        }

        if (!hasError) {

            int status = 1;
            int role = 0;

            HttpSession session = request.getSession();
            
            Account loginedAccount = (Account)session.getAttribute("loginedUser");
            String email = loginedAccount.getEmail();
            
            boolean result = AccountDAO.updateAccount(email, password, fullname, phone);
            if (!result) {
                request.setAttribute("updateError", "Something went wrong");
            } else {
                request.setAttribute("announcement", "Update profile successfully");
                
                //update session
                Account newAccount = AccountDAO.getAccount(email);
                session.setAttribute("loginedUser", newAccount);
            }
        }
        
        request.getRequestDispatcher("./views/user/change-profile.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

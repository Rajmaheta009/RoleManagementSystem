package servlet;

import dao.UserDAO;
import model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        user user = (user) session.getAttribute("user");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check old password
        if (!user.getPassword().equals(oldPassword)) {

            request.setAttribute("error", "Current Password is Incorrect.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

            return;
        }

        // Check new password confirmation
        if (!newPassword.equals(confirmPassword)) {

            request.setAttribute("error", "New Password and Confirm Password do not match.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

            return;
        }

        UserDAO dao = new UserDAO();

        boolean result = dao.changePassword(user.getId(), newPassword);

        if (result) {

            user.setPassword(newPassword);

            session.setAttribute("user", user);

            response.sendRedirect("ProfileServlet");

        } else {

            request.setAttribute("error", "Unable to update password.");

            request.getRequestDispatcher("changePassword.jsp")
                    .forward(request, response);

        }

    }

}

package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.user;
import util.Validation;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        if (!Validation.isValidEmail(email)) {
            response.getWriter().println("Invalid Email");
            return;
        }

        if (!Validation.isValidPhone(phone)) {
            response.getWriter().println("Invalid Phone Number");
            return;
        }

        if (!Validation.isValidPassword(password)) {
            response.getWriter().println("Password must be at least 6 characters");
            return;
        }

        user user = new user();

        user.setFullname(fullname);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        user.setRole(role);
        user.setStatus(true);

        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {

            response.sendRedirect("login.jsp");

        } else {

            response.getWriter().println("Registration Failed");

        }

    }

}

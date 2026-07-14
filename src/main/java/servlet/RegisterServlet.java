    package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;
import util.Validation;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // ===========================
        // Get Form Data
        // ===========================

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        // Default Role = CLIENT (Role ID = 3)
        int roleId = 3;

        System.out.println("========== USER REGISTRATION ==========");
        System.out.println("Name    : " + fullname);
        System.out.println("Email   : " + email);

        // ===========================
        // Validation
        // ===========================

        if (!Validation.isValidName(fullname)) {

            request.setAttribute("error",
                    "Please enter a valid full name.");

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

            return;
        }

        if (!Validation.isValidEmail(email)) {

            request.setAttribute("error",
                    "Invalid email address.");

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

            return;
        }

        if (!Validation.isValidPhone(phone)) {

            request.setAttribute("error",
                    "Invalid phone number.");

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

            return;
        }

        if (!Validation.isValidPassword(password)) {

            request.setAttribute("error",
                    "Password must be at least 6 characters.");

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

            return;
        }

        UserDAO dao = new UserDAO();

        if (dao.emailExists(email.trim())) {

            request.setAttribute("error",
                    "Email already exists.");

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

            return;
        }

        // ===========================
        // Create User Object
        // ===========================

        User user = new User();

        user.setFullname(fullname.trim());
        user.setEmail(email.trim());
        user.setPassword(password);
        user.setPhone(phone.trim());
        user.setGender(gender);
        user.setAddress(address == null ? "" : address.trim());
        user.setRoleId(roleId);
        user.setStatus(true);

        // ===========================
        // Save User
        // ===========================

        boolean result = dao.registerUser(user);

        if (result) {

            System.out.println("Registration Successful");

            HttpSession session = request.getSession();

            session.setAttribute(
                    "success",
                    "Registration Successful. Please Login."
            );

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );

        } else {

            System.out.println("Registration Failed");

            request.setAttribute(
                    "error",
                    "Registration Failed."
            );

            request.getRequestDispatcher("/register.jsp")
                    .forward(request, response);

        }

    }

}
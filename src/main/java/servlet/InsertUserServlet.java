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

@WebServlet("/InsertUserServlet")
public class InsertUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // ==========================
        // Get Form Data
        // ==========================

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        int roleId = Integer.parseInt(request.getParameter("role"));

        System.out.println("========== INSERT USER ==========");
        System.out.println("Name    : " + fullname);
        System.out.println("Email   : " + email);
        System.out.println("Role ID : " + roleId);

        // ==========================
        // Validation
        // ==========================

        if (!Validation.isValidName(fullname)
                || !Validation.isValidEmail(email)
                || !Validation.isValidPhone(phone)
                || !Validation.isValidPassword(password)) {

            session.setAttribute("error", "Invalid user details.");

            response.sendRedirect("insertUser.jsp");

            return;

        }

        User user = new User();

        user.setFullname(fullname);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        user.setRoleId(roleId);
        user.setStatus(true);

        UserDAO dao = new UserDAO();

        boolean result = dao.registerUser(user);

        if (result) {

            System.out.println("User Inserted Successfully");

            session.setAttribute(
                    "success",
                    "User added successfully."
            );

            response.sendRedirect("DisplayUserServlet");

        } else {

            System.out.println("User Insert Failed");

            session.setAttribute(
                    "error",
                    "Unable to insert user."
            );

            response.sendRedirect("insertUser.jsp");

        }

    }

}
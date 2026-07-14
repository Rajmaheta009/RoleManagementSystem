package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;
import util.Validation;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            UserDAO dao = new UserDAO();

            User user = dao.getUserById(id);

            if (user == null) {

                session.setAttribute("error", "User not found.");

                response.sendRedirect("DisplayUserServlet");
                return;

            }

            request.setAttribute("user", user);

            request.getRequestDispatcher("updateUser.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            session.setAttribute("error", "Invalid User ID.");

            response.sendRedirect("DisplayUserServlet");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            int roleId = Integer.parseInt(request.getParameter("role"));

            if (!Validation.isValidName(fullname)
                    || !Validation.isValidEmail(email)
                    || !Validation.isValidPhone(phone)
                    || !Validation.isValidPassword(password)) {

                session.setAttribute("error", "Invalid user details.");

                response.sendRedirect("DisplayUserServlet");
                return;

            }

            User user = new User();

            user.setId(id);
            user.setFullname(fullname);
            user.setEmail(email);
            user.setPassword(password);
            user.setPhone(phone);
            user.setGender(gender);
            user.setAddress(address);
            user.setRoleId(roleId);
            user.setStatus(true);

            UserDAO dao = new UserDAO();

            if (dao.updateUser(user)) {

                session.setAttribute("success",
                        "User updated successfully.");

                response.sendRedirect("DisplayUserServlet");

            } else {

                session.setAttribute("error",
                        "Unable to update user.");

                response.sendRedirect("DisplayUserServlet");

            }

        } catch (Exception e) {

            session.setAttribute("error",
                    "Invalid request.");

            response.sendRedirect("DisplayUserServlet");

        }

    }

}

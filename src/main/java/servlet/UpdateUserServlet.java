package servlet;

import dao.UserDAO;
import model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();

        user user = dao.getUserById(id);

        request.setAttribute("user", user);

        request.getRequestDispatcher("updateUser.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        user user = new user();

        user.setId(id);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        user.setRole(role);
        user.setStatus(true);

        UserDAO dao = new UserDAO();

        if (dao.updateUser(user)) {

            response.sendRedirect("DisplayUserServlet");

        } else {

            response.getWriter().println("Update Failed");

        }

    }

}

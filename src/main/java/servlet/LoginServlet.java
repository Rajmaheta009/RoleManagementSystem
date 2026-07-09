package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.user;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        user user = dao.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);

            session.setAttribute("role", user.getRole());

            session.setAttribute("name", user.getFullname());

            if (user.getRole().equalsIgnoreCase("ADMIN")) {

                response.sendRedirect("dashboard.jsp");

            } else if (user.getRole().equalsIgnoreCase("EMPLOYEE")) {

                response.sendRedirect("dashboard.jsp");

            } else {

                response.sendRedirect("dashboard.jsp");

            }

        } else {

            response.getWriter().println("Invalid Email or Password");

        }

    }

}

package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        UserDAO dao = new UserDAO();

        request.setAttribute("totalUsers", dao.countUsers());
        request.setAttribute("totalAdmins", dao.countAdmins());
        request.setAttribute("totalEmployees", dao.countEmployees());
        request.setAttribute("totalClients", dao.countClients());

        request.getRequestDispatcher("dashboard.jsp")
                .forward(request, response);

    }

}

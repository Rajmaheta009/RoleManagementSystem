package servlet;

import dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        request.setAttribute("totalUsers", dao.countUsers());
        request.setAttribute("totalAdmins", dao.countAdmins());
        request.setAttribute("totalEmployees", dao.countEmployees());
        request.setAttribute("totalClients", dao.countClients());

        request.getRequestDispatcher("dashboard.jsp")
                .forward(request, response);

    }

}

package servlet;

import dao.UserDAO;
import model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayUserServlet")
public class DisplayUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        List<user> users = dao.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("displayUsers.jsp")
                .forward(request, response);

    }

}

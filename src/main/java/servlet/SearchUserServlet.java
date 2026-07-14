package servlet;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchUserServlet")
public class SearchUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check Login Session
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // Get Search Keyword
        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {

            keyword = "";

        }

        // Search User
        UserDAO dao = new UserDAO();

        List<User> users = dao.searchUsers(keyword);

        // Send Data to JSP
        request.setAttribute("users", users);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("displayUsers.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}

package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import model.User;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // User not logged in
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // Get logged-in user from session
        User user = (User) session.getAttribute("user");

        // Send user object to JSP
        request.setAttribute("user", user);

        // Open profile page
        request.getRequestDispatcher("profile.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}

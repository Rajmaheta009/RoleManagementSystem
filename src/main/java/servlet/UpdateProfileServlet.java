package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import model.User;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        User user = (User) session.getAttribute("user");

        user.setFullname(request.getParameter("fullname"));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setGender(request.getParameter("gender"));
        user.setAddress(request.getParameter("address"));

        UserDAO dao = new UserDAO();

        boolean result = dao.updateProfile(user);

        if (result) {

            session.setAttribute("user", user);

            response.sendRedirect("ProfileServlet");

        } else {

            request.setAttribute("error", "Profile Update Failed.");

            request.getRequestDispatcher("profile.jsp")
                    .forward(request, response);

        }

    }

}

package servlet;

import dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();

        boolean found = dao.emailExists(email);

        if (found) {

            HttpSession session = request.getSession();

            session.setAttribute("resetEmail", email);

            response.sendRedirect("resetPassword.jsp");

        } else {

            request.setAttribute("error",
                    "Email does not exist.");

            request.getRequestDispatcher("forgotPassword.jsp")
                    .forward(request, response);

        }

    }

}

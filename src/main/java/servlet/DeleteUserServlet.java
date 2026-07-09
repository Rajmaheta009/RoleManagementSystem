package servlet;

import dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            UserDAO dao = new UserDAO();

            boolean result = dao.deleteUser(id);

            if (result) {

                response.sendRedirect("DisplayUserServlet");

            } else {

                response.getWriter().println("Unable to Delete User.");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println("Error : " + e.getMessage());

        }

    }

}

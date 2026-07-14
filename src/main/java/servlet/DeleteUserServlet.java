package servlet;

import dao.UserDAO;
import model.User;

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

        // ===========================
        // Check Login
        // ===========================
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        // ===========================
        // Logged-in User
        // ===========================
        User currentUser = (User) session.getAttribute("user");

        System.out.println("========== DELETE USER ==========");
        System.out.println("Logged User : " + currentUser.getFullname());
        System.out.println("Role ID     : " + currentUser.getRoleId());

        // ===========================
        // Only ADMIN (role_id = 1)
        // ===========================
        if (currentUser.getRoleId() != 1) {

            System.out.println("Access Denied");

            response.sendRedirect("accessDenied.jsp");
            return;

        }

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            System.out.println("Delete User ID : " + id);

            // ===========================
            // Prevent Self Delete
            // ===========================
            if (currentUser.getId() == id) {

                session.setAttribute(
                        "error",
                        "You cannot delete your own account."
                );

                response.sendRedirect("DisplayUserServlet");
                return;

            }

            UserDAO dao = new UserDAO();

            boolean result = dao.deleteUser(id);

            if (result) {

                System.out.println("User Deleted Successfully");

                session.setAttribute(
                        "success",
                        "User deleted successfully."
                );

            } else {

                System.out.println("Delete Failed");

                session.setAttribute(
                        "error",
                        "Unable to delete user."
                );

            }

            response.sendRedirect("DisplayUserServlet");

        } catch (NumberFormatException e) {

            e.printStackTrace();

            session.setAttribute(
                    "error",
                    "Invalid User ID."
            );

            response.sendRedirect("DisplayUserServlet");

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "error",
                    "Something went wrong while deleting the user."
            );

            response.sendRedirect("DisplayUserServlet");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}
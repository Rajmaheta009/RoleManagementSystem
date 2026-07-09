package servlet;

import dao.UserDAO;
import model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/InsertUserServlet")
public class InsertUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        user user = new user();

        user.setFullname(fullname);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setGender(gender);
        user.setAddress(address);
        user.setRole(role);
        user.setStatus(true);

        UserDAO dao = new UserDAO();

        boolean result = dao.registerUser(user);

        if(result){

            response.sendRedirect("DisplayUserServlet");

        }else{

            response.getWriter().println("Unable to Insert User.");

        }

    }

}
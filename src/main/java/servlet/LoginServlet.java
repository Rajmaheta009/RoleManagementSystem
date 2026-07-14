package servlet;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String normalizedEmail = email == null ? "" : email.trim();
        String normalizedPassword = password == null ? "" : password.trim();
        
//        System.out.println("email verifaction");
//        System.out.println("that is email "+normalizedEmail);
//        System.out.println("that is pass "+normalizedPassword);
        
        if (normalizedEmail.isEmpty() || normalizedPassword.isEmpty()) {
//            System.out.println("that is inside of if");
            request.setAttribute("error", "Please enter both email and password.");
//            request.set
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
//        System.out.println("login pages");
        User user = dao.login(normalizedEmail, normalizedPassword);

        if (user == null) {
            System.out.println("that is not working");
        }
        if (user != null) {
            request.setAttribute("error", "user is found");
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRoleId());
            session.setAttribute("name", user.getFullname());
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
            return;
        }
//        System.out.println(""+normalizedEmail+"----------------"+normalizedPassword);

//        request.setAttribute("error", "Invalid email or password.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

}

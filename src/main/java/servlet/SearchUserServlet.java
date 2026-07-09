package servlet;

import dao.UserDAO;
import model.user;

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

        String keyword = request.getParameter("keyword");

        if(keyword == null){
            keyword = "";
        }

        UserDAO dao = new UserDAO();

        List<user> users = dao.searchUsers(keyword);

        request.setAttribute("users", users);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("displayUsers.jsp")
                .forward(request, response);

    }

}
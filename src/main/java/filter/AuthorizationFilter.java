package filter;

import model.user;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {
    "/InsertUserServlet",
    "/UpdateUserServlet",
    "/DeleteUserServlet"
})

public class AuthorizationFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        user user = (user) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        String role = user.getRole();

        String url = request.getRequestURI();

        if (url.contains("DeleteUserServlet")) {

            if (!role.equalsIgnoreCase("ADMIN")) {

                response.sendRedirect("accessDenied.jsp");
                return;

            }

        }

        if (url.contains("InsertUserServlet")
                || url.contains("UpdateUserServlet")) {

            if (!(role.equalsIgnoreCase("ADMIN")
                    || role.equalsIgnoreCase("EMPLOYEE"))) {

                response.sendRedirect("accessDenied.jsp");
                return;

            }

        }

        chain.doFilter(request, response);

    }

}

package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebFilter(urlPatterns = {
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

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;

        }

        User user = (User) session.getAttribute("user");
        int role = user.getRoleId();

        String servlet = request.getServletPath();

        switch (servlet) {

            case "/DeleteUserServlet":

                if (!(role == 1)) {
                    response.sendRedirect(request.getContextPath() + "/accessDenied.jsp");
                    return;
                }

                break;

            case "/InsertUserServlet":

            case "/UpdateUserServlet":

                if (!(role == 1 || role == 2)) {
                    response.sendRedirect(request.getContextPath() + "/accessDenied.jsp");
                    return;
                }

                break;
        }

        chain.doFilter(request, response);
    }
}

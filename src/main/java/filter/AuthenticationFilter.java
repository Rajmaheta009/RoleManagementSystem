package filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {
    "/DashboardServlet",
    "/DisplayUserServlet",
    "/InsertUserServlet",
    "/UpdateUserServlet",
    "/DeleteUserServlet",
    "/SearchUserServlet",
    "/ProfileServlet",
    "/UpdateProfileServlet",
    "/ChangePasswordServlet",
    "/dashboard.jsp",
    "/displayUsers.jsp",
    "/insertUser.jsp",
    "/updateUser.jsp",
    "/profile.jsp",
    "/changePassword.jsp"
})
public class AuthenticationFilter extends HttpFilter {

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

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        chain.doFilter(request, response);
    }
}

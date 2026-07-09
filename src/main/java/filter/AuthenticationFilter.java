package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {
    "/dashboard.jsp",
    "/DashboardServlet",
    "/DisplayUserServlet",
    "/InsertUserServlet",
    "/UpdateUserServlet",
    "/DeleteUserServlet",
    "/ProfileServlet",
    "/UpdateProfileServlet",
    "/ChangePasswordServlet",
    "/insertUser.jsp",
    "/updateUser.jsp",
    "/displayUsers.jsp",
    "/profile.jsp",
    "/editProfile.jsp",
    "/changePassword.jsp"
})

public class AuthenticationFilter extends HttpFilter {

    @Override
    public void init(FilterConfig filterConfig)
            throws ServletException {

        super.init(filterConfig);

    }

    @Override
    protected void doFilter(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);

        if (session != null
                && session.getAttribute("user") != null) {

            chain.doFilter(request, response);

        } else {

            response.sendRedirect("login.jsp");

        }

    }

}

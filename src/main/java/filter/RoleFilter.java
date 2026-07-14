//package filter;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.*;
//
//import model.User;
//
//import java.io.IOException;
//
//@WebFilter(urlPatterns = {
//    "/InsertUserServlet",
//    "/UpdateUserServlet",
//    "/DeleteUserServlet"
//})
//public class RoleFilter implements Filter {
//
//    @Override
//    public void doFilter(ServletRequest request,
//            ServletResponse response,
//            FilterChain chain)
//            throws IOException, ServletException {
//
//        HttpServletRequest req
//                = (HttpServletRequest) request;
//
//        HttpServletResponse res
//                = (HttpServletResponse) response;
//
//        HttpSession session
//                = req.getSession(false);
//
//        if (session == null) {
//
//            res.sendRedirect("login.jsp");
//
//            return;
//
//        }
//
//        User user
//                = (User) session.getAttribute("user");
//
//        if (user == null) {
//
//            res.sendRedirect("login.jsp");
//
//            return;
//
//        }
//
//        String role = user.getRole();
//
//        String url = req.getServletPath();
//
//        // ADMIN => Full Access
//        if (role.equalsIgnoreCase("ADMIN")) {
//
//            chain.doFilter(request, response);
//
//            return;
//
//        }
//
//        // EMPLOYEE
//        if (role.equalsIgnoreCase("EMPLOYEE")) {
//
//            if (url.equals("/DeleteUserServlet")) {
//
//                res.sendRedirect("accessDenied.jsp");
//
//                return;
//
//            }
//
//            chain.doFilter(request, response);
//
//            return;
//
//        }
//
//        // CLIENT
//        if (role.equalsIgnoreCase("CLIENT")) {
//
//            res.sendRedirect("accessDenied.jsp");
//
//            return;
//
//        }
//
//        res.sendRedirect("login.jsp");
//
//    }
//
//}

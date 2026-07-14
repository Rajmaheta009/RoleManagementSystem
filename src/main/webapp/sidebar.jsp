<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet">

<div class="bg-dark text-white vh-100 p-3 shadow">

    <div class="text-center mb-4">

        <h3 class="fw-bold">

            RMS

        </h3>

        <hr>

        <h5>

            <%= user.getFullname() %>

        </h5>

        <span class="badge bg-warning text-dark">

            <%= user.getRole() %>

        </span>

    </div>

    <ul class="nav flex-column">

        <!-- Dashboard -->

        <li class="nav-item mb-2">

            <a href="DashboardServlet"
               class="nav-link text-white">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>

        </li>

        <!-- ADMIN -->

        <% if(user.getRole().equalsIgnoreCase("ADMIN")) { %>

        <li class="nav-item mb-2">

            <a href="insertUser.jsp"
               class="nav-link text-white">

                <i class="bi bi-person-plus-fill"></i>

                Add User

            </a>

        </li>

        <li class="nav-item mb-2">

            <a href="DisplayUserServlet"
               class="nav-link text-white">

                <i class="bi bi-people-fill"></i>

                Manage Users

            </a>

        </li>

        <% } %>

        <!-- EMPLOYEE -->

        <% if(user.getRole().equalsIgnoreCase("EMPLOYEE")) { %>

        <li class="nav-item mb-2">

            <a href="insertUser.jsp"
               class="nav-link text-white">

                <i class="bi bi-person-plus-fill"></i>

                Add User

            </a>

        </li>

        <li class="nav-item mb-2">

            <a href="DisplayUserServlet"
               class="nav-link text-white">

                <i class="bi bi-people-fill"></i>

                View Users

            </a>

        </li>

        <% } %>

        <!-- COMMON -->

        <li class="nav-item mb-2">

            <a href="ProfileServlet"
               class="nav-link text-white">

                <i class="bi bi-person-circle"></i>

                My Profile

            </a>

        </li>

        <li class="nav-item mb-2">

            <a href="changePassword.jsp"
               class="nav-link text-white">

                <i class="bi bi-key-fill"></i>

                Change Password

            </a>

        </li>

        <li class="nav-item mt-4">

            <a href="LogoutServlet"
               class="nav-link text-danger">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </li>

    </ul>

</div>
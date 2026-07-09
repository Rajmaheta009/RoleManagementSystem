<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@psage import="model.user"%>

<%
    user user = (user) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="sidebar">

    <div class="sidebar-header">

        <h3>RMS</h3>

        <p>
            Welcome,
            <br>
            <strong><%=user.getFullname()%></strong>
        </p>

        <span class="badge bg-warning text-dark">
            <%=user.getRole()%>
        </span>

    </div>

    <ul class="sidebar-menu">

        <!-- Dashboard -->

        <li>

            <a href="dashboard.jsp">

                <i class="bi bi-speedometer2"></i>

                Dashboard

            </a>

        </li>

        <!-- ADMIN MENU -->

        <%
            if (user.getRole().equalsIgnoreCase("ADMIN")) {
        %>

        <li>

            <a href="insertUser.jsp">

                <i class="bi bi-person-plus-fill"></i>

                Add User

            </a>

        </li>

        <li>

            <a href="DisplayUserServlet">

                <i class="bi bi-people-fill"></i>

                Display Users

            </a>

        </li>

        <li>

            <a href="DisplayUserServlet">

                <i class="bi bi-pencil-square"></i>

                Update User

            </a>

        </li>

        <li>

            <a href="DisplayUserServlet">

                <i class="bi bi-trash-fill"></i>

                Delete User

            </a>

        </li>

        <%
            }
        %>

        <!-- EMPLOYEE MENU -->

        <%
            if (user.getRole().equalsIgnoreCase("EMPLOYEE")) {
        %>

        <li>

            <a href="insertUser.jsp">

                <i class="bi bi-person-plus-fill"></i>

                Add User

            </a>

        </li>

        <li>

            <a href="DisplayUserServlet">

                <i class="bi bi-people-fill"></i>

                Display Users

            </a>

        </li>

        <li>

            <a href="DisplayUserServlet">

                <i class="bi bi-pencil-square"></i>

                Update User

            </a>

        </li>

        <%
            }
        %>

        <!-- CLIENT MENU -->

        <%
            if (user.getRole().equalsIgnoreCase("CLIENT")) {
        %>

        <li>

            <a href="profile.jsp">

                <i class="bi bi-person-circle"></i>

                My Profile

            </a>

        </li>

        <%
            }
        %>

        <!-- COMMON -->

        <li>

            <a href="LogoutServlet">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </li>

    </ul>

</div>
        <jsp:include page="footer.jsp"/>
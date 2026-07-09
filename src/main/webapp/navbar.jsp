<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.user"%>

<%
    user user = (user) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">

    <div class="container-fluid">

        <a class="navbar-brand fw-bold" href="DashboardServlet">

            Role Management System

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="DashboardServlet">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="ProfileServlet">

                        Profile

                    </a>

                </li>

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <%= user.getFullname()%>

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <span class="dropdown-item-text">

                                Role :
                                <strong>

                                    <%= user.getRole()%>

                                </strong>

                            </span>

                        </li>

                        <li><hr class="dropdown-divider"></li>

                        <li>

                            <a class="dropdown-item"
                               href="ProfileServlet">

                                My Profile

                            </a>

                        </li>

                        <li>

                            <a class="dropdown-item"
                               href="changePassword.jsp">

                                Change Password

                            </a>

                        </li>

                        <li><hr class="dropdown-divider"></li>

                        <li>

                            <a class="dropdown-item text-danger"
                               href="LogoutServlet">

                                Logout

                            </a>

                        </li>

                    </ul>

                </li>

            </ul>

        </div>

    </div>

</nav>
<jsp:include page="footer.jsp"/>
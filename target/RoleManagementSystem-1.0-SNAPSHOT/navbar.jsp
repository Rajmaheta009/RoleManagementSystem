<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User currentUser = (User) session.getAttribute("user");
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">

    <div class="container-fluid">

        <a class="navbar-brand fw-bold"
           href="<%=request.getContextPath()%>/DashboardServlet">

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

                <% if (currentUser == null) {%>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/index.html">

                        Home

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/login.jsp">

                        Login

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/register.jsp">

                        Register

                    </a>

                </li>

                <% } else {%>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/DashboardServlet">

                        Dashboard

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/ProfileServlet">

                        Profile

                    </a>

                </li>

                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <%= currentUser.getFullname()%>

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>

                            <span class="dropdown-item-text">

                                Role :
                                <strong>

                                    <%= currentUser.getRoleId()%>

                                </strong>

                            </span>

                        </li>

                        <li>

                            <hr class="dropdown-divider">

                        </li>

                        <li>

                            <a class="dropdown-item"
                               href="<%=request.getContextPath()%>/ProfileServlet">

                                My Profile

                            </a>

                        </li>

                        <li>

                            <a class="dropdown-item"
                               href="<%=request.getContextPath()%>/changePassword.jsp">

                                Change Password

                            </a>

                        </li>

                        <li>

                            <hr class="dropdown-divider">

                        </li>

                        <li>

                            <a class="dropdown-item text-danger"
                               href="<%=request.getContextPath()%>/LogoutServlet">

                                Logout

                            </a>

                        </li>

                    </ul>

                </li>

                <% }%>

            </ul>

        </div>

    </div>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
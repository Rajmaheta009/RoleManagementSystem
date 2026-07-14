<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>Dashboard | Role Management System</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="css/dashboard.css">

    </head>

    <body class="bg-light">

        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid">

            <div class="row">

                <!-- Sidebar -->

                <div class="col-md-2 p-0">

                    <jsp:include page="sidebar.jsp"/>

                </div>

                <!-- Main Content -->

                <div class="col-md-10 p-4">

                    <h2 class="mb-4">

                        Welcome,
                        <strong>

                            <%= session.getAttribute("name") == null ? "Guest" : session.getAttribute("name")%>

                        </strong>

                    </h2>

                    <!-- Dashboard Cards -->

                    <div class="row g-4">

                        <div class="col-lg-3 col-md-6">

                            <div class="card dashboard-card text-white bg-primary shadow">

                                <div class="card-body text-center">

                                    <h5>Total Users</h5>

                                    <h2>${totalUsers}</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="card dashboard-card text-white bg-success shadow">

                                <div class="card-body text-center">

                                    <h5>Employees</h5>

                                    <h2>${totalEmployees}</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="card dashboard-card text-dark bg-warning shadow">

                                <div class="card-body text-center">

                                    <h5>Clients</h5>

                                    <h2>${totalClients}</h2>

                                </div>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="card dashboard-card text-white bg-danger shadow">

                                <div class="card-body text-center">

                                    <h5>Admins</h5>

                                    <h2>${totalAdmins}</h2>

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- Information Card -->

                    <div class="card shadow mt-5">

                        <div class="card-header bg-dark text-white">

                            Dashboard Overview

                        </div>

                        <div class="card-body">

                            <h5 class="card-title">

                                Welcome to the Role Management System

                            </h5>

                            <p class="card-text">

                                You are successfully logged in.

                                Use the sidebar to manage users, update your profile,
                                change your password, and access all available features
                                according to your role.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <jsp:include page="footer.jsp"/>

    </body>

</html>
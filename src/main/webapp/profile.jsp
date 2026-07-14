<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User user = (User) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>My Profile | Role Management System</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
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

                    <div class="card shadow">

                        <div class="card-header bg-primary text-white">

                            <h3 class="mb-0">

                                <i class="bi bi-person-circle"></i>

                                My Profile

                            </h3>

                        </div>

                        <div class="card-body">

                            <table class="table table-bordered table-hover">

                                <tr>

                                    <th width="220">User ID</th>

                                    <td>

                                        <%= user.getId()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Full Name</th>

                                    <td>

                                        <%= user.getFullname()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Email</th>

                                    <td>

                                        <%= user.getEmail()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Phone</th>

                                    <td>

                                        <%= user.getPhone()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Gender</th>

                                    <td>

                                        <%= user.getGender()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Address</th>

                                    <td>

                                        <%= user.getAddress()%>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Role</th>

                                    <td>

                                        <span class="badge bg-success">

                                            <%= user.getRole()%>

                                        </span>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Status</th>

                                    <td>

                                        <% if (user.isStatus()) { %>

                                        <span class="badge bg-primary">

                                            Active

                                        </span>

                                        <% } else { %>

                                        <span class="badge bg-danger">

                                            Inactive

                                        </span>

                                        <% }%>

                                    </td>

                                </tr>

                            </table>

                            <div class="mt-4 text-center">

                                <a href="editProfile.jsp"
                                   class="btn btn-success">

                                    <i class="bi bi-pencil-square"></i>

                                    Edit Profile

                                </a>

                                <a href="changePassword.jsp"
                                   class="btn btn-warning">

                                    <i class="bi bi-key-fill"></i>

                                    Change Password

                                </a>

                                <a href="DashboardServlet"
                                   class="btn btn-primary">

                                    <i class="bi bi-house-fill"></i>

                                    Dashboard

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <jsp:include page="footer.jsp"/>

    </body>

</html>
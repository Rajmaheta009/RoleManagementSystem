<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>All Users | Role Management System</title>

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

                    <div class="d-flex justify-content-between align-items-center mb-4">

                        <h2>All Users</h2>

                        <a href="insertUser.jsp"
                           class="btn btn-success">

                            + Add User

                        </a>

                    </div>

                    <!-- Search -->

                    <div class="card shadow mb-4">

                        <div class="card-body">

                            <form action="SearchUserServlet"
                                  method="get">

                                <div class="row">

                                    <div class="col-md-10">

                                        <input
                                            type="text"
                                            name="keyword"
                                            class="form-control"
                                            placeholder="Search by Name, Email, Phone or Role"
                                            value="${keyword}">

                                    </div>

                                    <div class="col-md-2">

                                        <button
                                            type="submit"
                                            class="btn btn-primary w-100">

                                            Search

                                        </button>

                                    </div>

                                </div>

                            </form>

                        </div>

                    </div>

                    <!-- User Table -->

                    <div class="card shadow">

                        <div class="card-header bg-primary text-white">

                            User List

                        </div>

                        <div class="card-body">

                            <div class="table-responsive">

                                <table class="table table-bordered table-hover table-striped align-middle">

                                    <thead class="table-dark">

                                        <tr>

                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Gender</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th width="170">Action</th>

                                        </tr>

                                    </thead>

                                    <tbody>

                                        <%

                                            List<User> users = (List<User>) request.getAttribute("users");

                                            if (users != null && !users.isEmpty()) {

                                                for (User user : users) {

                                        %>

                                        <tr>

                                            <td><%= user.getId()%></td>

                                            <td><%= user.getFullname()%></td>

                                            <td><%= user.getEmail()%></td>

                                            <td><%= user.getPhone()%></td>

                                            <td><%= user.getGender()%></td>

                                            <td>

                                                <span class="badge bg-info text-dark">

                                                    <%= user.getRole()%>

                                                </span>

                                            </td>

                                            <td>

                                                <% if (user.isStatus()) { %>

                                                <span class="badge bg-success">

                                                    Active

                                                </span>

                                                <% } else { %>

                                                <span class="badge bg-danger">

                                                    Inactive

                                                </span>

                                                <% }%>

                                            </td>

                                            <td>

                                                <a href="UpdateUserServlet?id=<%= user.getId()%>"
                                                   class="btn btn-warning btn-sm">

                                                    Edit

                                                </a>

                                                <a href="DeleteUserServlet?id=<%= user.getId()%>"
                                                   class="btn btn-danger btn-sm"
                                                   onclick="return confirm('Are you sure you want to delete this user?');">

                                                    Delete

                                                </a>

                                            </td>

                                        </tr>

                                        <%

                                            }

                                        } else {

                                        %>

                                        <tr>

                                            <td colspan="8"
                                                class="text-center text-muted">

                                                No Users Found.

                                            </td>

                                        </tr>

                                        <%                                        }

                                        %>

                                    </tbody>

                                </table>

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
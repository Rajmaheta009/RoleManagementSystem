<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User currentUser = (User) session.getAttribute("user");

    if (currentUser == null) {
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

    <title>Add User | Role Management System</title>

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

                    <div class="card-header bg-success text-white">

                        <h3 class="mb-0">

                            <i class="bi bi-person-plus-fill"></i>

                            Add New User

                        </h3>

                    </div>

                    <div class="card-body">

                        <form action="InsertUserServlet" method="post">

                            <div class="row">

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Full Name

                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           name="fullname"
                                           required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Email

                                    </label>

                                    <input type="email"
                                           class="form-control"
                                           name="email"
                                           required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Password

                                    </label>

                                    <input type="password"
                                           class="form-control"
                                           name="password"
                                           required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Phone

                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           name="phone"
                                           maxlength="10"
                                           required>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Gender

                                    </label>

                                    <select class="form-select"
                                            name="gender"
                                            required>

                                        <option value="">Select Gender</option>

                                        <option value="Male">Male</option>

                                        <option value="Female">Female</option>

                                        <option value="Other">Other</option>

                                    </select>

                                </div>

                                <div class="col-md-6 mb-3">

                                    <label class="form-label">

                                        Role

                                    </label>

                                    <select class="form-select"
                                            name="role"
                                            required>

                                        <option value="CLIENT">Client</option>

                                        <option value="EMPLOYEE">Employee</option>

                                        <% if(currentUser.getRole().equalsIgnoreCase("ADMIN")) { %>

                                        <option value="ADMIN">Admin</option>

                                        <% } %>

                                    </select>

                                </div>

                                <div class="col-12 mb-3">

                                    <label class="form-label">

                                        Address

                                    </label>

                                    <textarea class="form-control"
                                              name="address"
                                              rows="4"
                                              required></textarea>

                                </div>

                                <div class="col-12">

                                    <button type="submit"
                                            class="btn btn-success">

                                        <i class="bi bi-check-circle-fill"></i>

                                        Save User

                                    </button>

                                    <a href="DisplayUserServlet"
                                       class="btn btn-secondary">

                                        <i class="bi bi-arrow-left-circle-fill"></i>

                                        Back

                                    </a>

                                </div>

                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <jsp:include page="footer.jsp"/>

</body>

</html>
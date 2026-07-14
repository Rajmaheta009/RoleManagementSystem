<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Change Password | Role Management System</title>

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

                    <div class="card-header bg-warning">

                        <h3 class="mb-0">

                            <i class="bi bi-key-fill"></i>

                            Change Password

                        </h3>

                    </div>

                    <div class="card-body">

                        <% if(request.getAttribute("error") != null){ %>

                        <div class="alert alert-danger">

                            <%= request.getAttribute("error") %>

                        </div>

                        <% } %>

                        <% if(request.getAttribute("success") != null){ %>

                        <div class="alert alert-success">

                            <%= request.getAttribute("success") %>

                        </div>

                        <% } %>

                        <form action="ChangePasswordServlet"
                              method="post">

                            <div class="mb-3">

                                <label class="form-label">

                                    Current Password

                                </label>

                                <input type="password"
                                       name="oldPassword"
                                       class="form-control"
                                       required>

                            </div>

                            <div class="mb-3">

                                <label class="form-label">

                                    New Password

                                </label>

                                <input type="password"
                                       name="newPassword"
                                       class="form-control"
                                       minlength="6"
                                       required>

                            </div>

                            <div class="mb-3">

                                <label class="form-label">

                                    Confirm Password

                                </label>

                                <input type="password"
                                       name="confirmPassword"
                                       class="form-control"
                                       minlength="6"
                                       required>

                            </div>

                            <button type="submit"
                                    class="btn btn-success">

                                <i class="bi bi-check-circle-fill"></i>

                                Update Password

                            </button>

                            <a href="ProfileServlet"
                               class="btn btn-secondary">

                                <i class="bi bi-arrow-left-circle-fill"></i>

                                Cancel

                            </a>

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
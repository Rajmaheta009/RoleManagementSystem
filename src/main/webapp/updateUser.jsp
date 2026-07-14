<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<%
    User currentUser = (User) session.getAttribute("user");

    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User user = (User) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect("DisplayUserServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>Update User | Role Management System</title>

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

                <div class="col-md-2 p-0">

                    <jsp:include page="sidebar.jsp"/>

                </div>

                <div class="col-md-10 p-4">

                    <div class="card shadow">

                        <div class="card-header bg-warning text-dark">

                            <h3 class="mb-0">

                                <i class="bi bi-pencil-square"></i>

                                Update User

                            </h3>

                        </div>

                        <div class="card-body">

                            <form action="UpdateUserServlet" method="post">

                                <input type="hidden"
                                       name="id"
                                       value="<%= user.getId()%>">

                                <div class="row">

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Full Name

                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="fullname"
                                               value="<%= user.getFullname()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Email

                                        </label>

                                        <input type="email"
                                               class="form-control"
                                               name="email"
                                               value="<%= user.getEmail()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Password

                                        </label>

                                        <input type="password"
                                               class="form-control"
                                               name="password"
                                               value="<%= user.getPassword()%>"
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
                                               value="<%= user.getPhone()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Gender

                                        </label>

                                        <select class="form-select"
                                                name="gender"
                                                required>

                                            <option value="Male"
                                                    <%= user.getGender().equalsIgnoreCase("Male") ? "selected" : ""%>>

                                                Male

                                            </option>

                                            <option value="Female"
                                                    <%= user.getGender().equalsIgnoreCase("Female") ? "selected" : ""%>>

                                                Female

                                            </option>

                                            <option value="Other"
                                                    <%= user.getGender().equalsIgnoreCase("Other") ? "selected" : ""%>>

                                                Other

                                            </option>

                                        </select>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Role

                                        </label>

                                        <select class="form-select"
                                                name="role"
                                                required>

                                            <% if (currentUser.getRole().equalsIgnoreCase("ADMIN")) {%>

                                            <option value="ADMIN"
                                                    <%= user.getRole().equalsIgnoreCase("ADMIN") ? "selected" : ""%>>

                                                ADMIN

                                            </option>

                                            <% }%>

                                            <option value="EMPLOYEE"
                                                    <%= user.getRole().equalsIgnoreCase("EMPLOYEE") ? "selected" : ""%>>

                                                EMPLOYEE

                                            </option>

                                            <option value="CLIENT"
                                                    <%= user.getRole().equalsIgnoreCase("CLIENT") ? "selected" : ""%>>

                                                CLIENT

                                            </option>

                                        </select>

                                    </div>

                                    <div class="col-12 mb-3">

                                        <label class="form-label">

                                            Address

                                        </label>

                                        <textarea class="form-control"
                                                  name="address"
                                                  rows="4"
                                                  required><%= user.getAddress()%></textarea>

                                    </div>

                                    <div class="col-12">

                                        <button type="submit"
                                                class="btn btn-warning">

                                            <i class="bi bi-check-circle-fill"></i>

                                            Update User

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
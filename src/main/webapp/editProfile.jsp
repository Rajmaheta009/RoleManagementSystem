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

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>Edit Profile | Role Management System</title>

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

                                <i class="bi bi-pencil-square"></i>

                                Edit Profile

                            </h3>

                        </div>

                        <div class="card-body">

                            <form action="UpdateProfileServlet" method="post">

                                <input type="hidden"
                                       name="id"
                                       value="<%=user.getId()%>">

                                <div class="row">

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Full Name

                                        </label>

                                        <input type="text"
                                               name="fullname"
                                               class="form-control"
                                               value="<%=user.getFullname()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Email

                                        </label>

                                        <input type="email"
                                               name="email"
                                               class="form-control"
                                               value="<%=user.getEmail()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Phone

                                        </label>

                                        <input type="text"
                                               name="phone"
                                               class="form-control"
                                               maxlength="10"
                                               value="<%=user.getPhone()%>"
                                               required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label class="form-label">

                                            Gender

                                        </label>

                                        <select name="gender"
                                                class="form-select"
                                                required>

                                            <option value="Male"
                                                    <%=user.getGender().equalsIgnoreCase("Male") ? "selected" : ""%>>

                                                Male

                                            </option>

                                            <option value="Female"
                                                    <%=user.getGender().equalsIgnoreCase("Female") ? "selected" : ""%>>

                                                Female

                                            </option>

                                            <option value="Other"
                                                    <%=user.getGender().equalsIgnoreCase("Other") ? "selected" : ""%>>

                                                Other

                                            </option>

                                        </select>

                                    </div>

                                    <div class="col-12 mb-3">

                                        <label class="form-label">

                                            Address

                                        </label>

                                        <textarea name="address"
                                                  class="form-control"
                                                  rows="4"
                                                  required><%=user.getAddress()%></textarea>

                                    </div>

                                    <div class="col-12">

                                        <button type="submit"
                                                class="btn btn-success">

                                            <i class="bi bi-check-circle-fill"></i>

                                            Update Profile

                                        </button>

                                        <a href="ProfileServlet"
                                           class="btn btn-secondary">

                                            <i class="bi bi-arrow-left-circle-fill"></i>

                                            Cancel

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
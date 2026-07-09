<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.user"%>

<%
    user user = (user) request.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>My Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/dashboard.css">

    </head>

    <body class="bg-light">

        <jsp:include page="navbar.jsp"/>
        <jsp:include page="sidebar.jsp"/>

        <div class="container mt-5">

            <div class="row justify-content-center">

                <div class="col-md-8">

                    <div class="card shadow-lg">

                        <div class="card-header bg-primary text-white">

                            <h3>My Profile</h3>

                        </div>

                        <div class="card-body">

                            <table class="table table-bordered">

                                <tr>
                                    <th>ID</th>
                                    <td><%=user.getId()%></td>
                                </tr>

                                <tr>
                                    <th>Full Name</th>
                                    <td><%=user.getFullname()%></td>
                                </tr>

                                <tr>
                                    <th>Email</th>
                                    <td><%=user.getEmail()%></td>
                                </tr>

                                <tr>
                                    <th>Phone</th>
                                    <td><%=user.getPhone()%></td>
                                </tr>

                                <tr>
                                    <th>Gender</th>
                                    <td><%=user.getGender()%></td>
                                </tr>

                                <tr>
                                    <th>Address</th>
                                    <td><%=user.getAddress()%></td>
                                </tr>

                                <tr>
                                    <th>Role</th>
                                    <td>

                                        <span class="badge bg-success">

                                            <%=user.getRole()%>

                                        </span>

                                    </td>

                                </tr>

                                <tr>

                                    <th>Status</th>

                                    <td>

                                        <%

                                            if (user.isStatus()) {

                                        %>

                                        <span class="badge bg-primary">

                                            Active

                                        </span>

                                        <%} else {

                                        %>

                                        <span class="badge bg-danger">

                                            Inactive

                                        </span>

                                        <%    }

                                        %>

                                    </td>

                                </tr>

                            </table>

                            <div class="text-center">

                                <a href="changePassword.jsp"
                                   class="btn btn-warning">

                                    Change Password

                                </a>

                                <a href="DashboardServlet"
                                   class="btn btn-primary">

                                    Dashboard

                                </a>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>
</html>
<jsp:include page="footer.jsp"/>
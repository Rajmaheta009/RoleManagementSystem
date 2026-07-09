<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.user"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>All Users</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="css/dashboard.css">

    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container-fluid">

            <div class="row">

                <div class="col-md-2 p-0">

                    <jsp:include page="sidebar.jsp"/>

                </div>

                <div class="col-md-10 p-4">

                    <h2 class="mb-4">

                        All Users

                    </h2>

                    <div class="card shadow">

                        <div class="card-header bg-primary text-white">

                            User List

                        </div>

                        <div class="card-body">

                            <table class="table table-bordered table-hover table-striped">

                                <thead class="table-dark">

                                    <tr>

                                        <th>ID</th>

                                        <th>Full Name</th>

                                        <th>Email</th>

                                        <th>Phone</th>

                                        <th>Gender</th>

                                        <th>Role</th>

                                        <th>Status</th>

                                        <th width="180">

                                            Action

                                        </th>

                                    </tr>

                                </thead>

                                <tbody>

                                    <%

                                        List<User> users
                                                = (List<User>) request.getAttribute("users");

                                        if (users != null) {

                                            for (User user : users) {

                                    %>

                                    <tr>

                                        <td>

                                            <%=user.getId()%>

                                        </td>

                                        <td>

                                            <%=user.getFullname()%>

                                        </td>

                                        <td>

                                            <%=user.getEmail()%>

                                        </td>

                                        <td>

                                            <%=user.getPhone()%>

                                        </td>

                                        <td>

                                            <%=user.getGender()%>

                                        </td>

                                        <td>

                                            <%=user.getRole()%>

                                        </td>

                                        <td>

                                            <%

                                                if (user.isStatus()) {

                                            %>

                                            <span class="badge bg-success">

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

                                        <td>

                                            <a href="UpdateUserServlet?id=<%=user.getId()%>"
                                               class="btn btn-warning btn-sm">

                                                Edit

                                            </a>

                                            <a href="DeleteUserServlet?id=<%=user.getId()%>"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Delete this user?')">

                                                Delete

                                            </a>

                                        </td>

                                    </tr>

                                    <%

                                            }

                                        }

                                    %>

                                </tbody>

                            </table>
                            <div class="card mb-3 shadow">

                                <div class="card-body">

                                    <form action="SearchUserServlet" method="get">

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
                                                    class="btn btn-primary w-100">

                                                    Search

                                                </button>

                                            </div>

                                        </div>

                                    </form>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html><jsp:include page="footer.jsp"/>
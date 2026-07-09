<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.user"%>

<%
    user user = (user) request.getAttribute("user");
%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Update User</title>

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

                    <div class="card shadow">

                        <div class="card-header bg-warning">

                            <h4>Update User</h4>

                        </div>

                        <div class="card-body">

                            <form action="UpdateUserServlet" method="post">

                                <input
                                    type="hidden"
                                    name="id"
                                    value="<%=user.getId()%>">

                                <div class="row">

                                    <div class="col-md-6 mb-3">

                                        <label>Full Name</label>

                                        <input
                                            type="text"
                                            name="fullname"
                                            class="form-control"
                                            value="<%=user.getFullname()%>"
                                            required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Email</label>

                                        <input
                                            type="email"
                                            name="email"
                                            class="form-control"
                                            value="<%=user.getEmail()%>"
                                            required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Password</label>

                                        <input
                                            type="text"
                                            name="password"
                                            class="form-control"
                                            value="<%=user.getPassword()%>"
                                            required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Phone</label>

                                        <input
                                            type="text"
                                            name="phone"
                                            class="form-control"
                                            value="<%=user.getPhone()%>"
                                            required>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Gender</label>

                                        <select
                                            name="gender"
                                            class="form-select">

                                            <option value="Male"
                                                    <%=user.getGender().equals("Male") ? "selected" : ""%>>

                                                Male

                                            </option>

                                            <option value="Female"
                                                    <%=user.getGender().equals("Female") ? "selected" : ""%>>

                                                Female

                                            </option>

                                            <option value="Other"
                                                    <%=user.getGender().equals("Other") ? "selected" : ""%>>

                                                Other

                                            </option>

                                        </select>

                                    </div>

                                    <div class="col-md-6 mb-3">

                                        <label>Role</label>

                                        <select
                                            name="role"
                                            class="form-select">

                                            <option value="ADMIN"
                                                    <%=user.getRole().equals("ADMIN") ? "selected" : ""%>>

                                                ADMIN

                                            </option>

                                            <option value="EMPLOYEE"
                                                    <%=user.getRole().equals("EMPLOYEE") ? "selected" : ""%>>

                                                EMPLOYEE

                                            </option>

                                            <option value="CLIENT"
                                                    <%=user.getRole().equals("CLIENT") ? "selected" : ""%>>

                                                CLIENT

                                            </option>

                                        </select>

                                    </div>

                                    <div class="col-12 mb-3">

                                        <label>Address</label>

                                        <textarea
                                            name="address"
                                            rows="4"
                                            class="form-control"><%=user.getAddress()%></textarea>

                                    </div>

                                    <div class="col-12">

                                        <button
                                            class="btn btn-warning">

                                            Update User

                                        </button>

                                        <a href="DisplayUserServlet"
                                           class="btn btn-secondary">

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

    </body>

</html>
<jsp:include page="footer.jsp"/>
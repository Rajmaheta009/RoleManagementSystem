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

        <title>Edit Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/dashboard.css">

    </head>

    <body class="bg-light">

        <jsp:include page="navbar.jsp"/>
        <jsp:include page="sidebar.jsp"/>

        <div class="container mt-5">

            <div class="row justify-content-center">

                <div class="col-md-8">

                    <div class="card shadow">

                        <div class="card-header bg-primary text-white">

                            <h3>Edit Profile</h3>

                        </div>

                        <div class="card-body">

                            <form action="UpdateProfileServlet" method="post">

                                <input type="hidden" name="id" value="<%=user.getId()%>">

                                <div class="mb-3">

                                    <label>Full Name</label>

                                    <input
                                        type="text"
                                        name="fullname"
                                        class="form-control"
                                        value="<%=user.getFullname()%>"
                                        required>

                                </div>

                                <div class="mb-3">

                                    <label>Email</label>

                                    <input
                                        type="email"
                                        name="email"
                                        class="form-control"
                                        value="<%=user.getEmail()%>"
                                        required>

                                </div>

                                <div class="mb-3">

                                    <label>Phone</label>

                                    <input
                                        type="text"
                                        name="phone"
                                        class="form-control"
                                        value="<%=user.getPhone()%>"
                                        required>

                                </div>

                                <div class="mb-3">

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

                                    </select>

                                </div>

                                <div class="mb-3">

                                    <label>Address</label>

                                    <textarea
                                        name="address"
                                        class="form-control"><%=user.getAddress()%></textarea>

                                </div>

                                <button class="btn btn-success">

                                    Update Profile

                                </button>

                                <a href="ProfileServlet"
                                   class="btn btn-secondary">

                                    Cancel

                                </a>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>


    </body>

</html>
<jsp:include page="footer.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>User Registration | Role Management System</title>

        <link rel="stylesheet" href="css/style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container">

            <div class="card register-card">

                <h1>Create Account</h1>

                <p>User Registration</p>

                <%
                    String error = (String) request.getAttribute("error");

                    if (error == null) {
                        error = (String) session.getAttribute("error");
                    }

                    if (error != null) {
                %>

                <div class="alert alert-danger">

                    <%= error%>

                </div>

                <%
                        session.removeAttribute("error");
                    }
                %>

                <form action="<%= request.getContextPath() %>/RegisterServlet" method="post">

                    <div class="row">

                        <div class="input-box">

                            <label>Full Name</label>

                            <input
                                type="text"
                                name="fullname"
                                placeholder="Enter Full Name"
                                required>

                        </div>

                        <div class="input-box">

                            <label>Email</label>

                            <input
                                type="email"
                                name="email"
                                placeholder="Enter Email"
                                required>

                        </div>

                    </div>

                    <div class="row">

                        <div class="input-box">

                            <label>Password</label>

                            <input
                                type="password"
                                name="password"
                                placeholder="Enter Password"
                                required>

                        </div>

                        <div class="input-box">

                            <label>Phone</label>

                            <input
                                type="text"
                                name="phone"
                                placeholder="Enter Phone Number"
                                required>

                        </div>

                    </div>

                    <label>Gender</label>

                    <div class="gender-box">

                        <label>

                            <input
                                type="radio"
                                name="gender"
                                value="Male"
                                required>

                            Male

                        </label>

                        <label>

                            <input
                                type="radio"
                                name="gender"
                                value="Female">

                            Female

                        </label>

                        <label>

                            <input
                                type="radio"
                                name="gender"
                                value="Other">

                            Other

                        </label>

                    </div>

                    <div class="input-box">

                        <label>Address</label>

                        <textarea
                            name="address"
                            rows="3"
                            placeholder="Enter Address"
                            required></textarea>

                    </div>

                    <!-- Hidden Role -->
                    <input
                        type="hidden"
                        name="role"
                        value="CLIENT">

                    <button
                        type="submit"
                        class="btn btn-success w-100">

                        Register

                    </button>

                </form>

                <div class="link mt-3">

                    Already have an account?

                    <a href="login.jsp">

                        Login

                    </a>

                </div>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

        <jsp:include page="footer.jsp"/>

    </body>

</html>
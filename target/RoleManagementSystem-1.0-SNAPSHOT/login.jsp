<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Login | Role Management System</title>

        <link rel="stylesheet" href="css/style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="container">

            <div class="card login-card">

                <h1>Login</h1>

                <p>Welcome Back</p>

                <%
                    String success = (String) request.getAttribute("success");
                    String error = (String) request.getAttribute("error");

                    if (success == null) {
                        success = (String) session.getAttribute("success");
                    }

                    if (error == null) {
                        error = (String) session.getAttribute("error");
                    }

                    if (success != null) {
                %>

                <div class="alert alert-success">
                    <%= success%>
                </div>

                <%
                        session.removeAttribute("success");
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

                <form action="<%= request.getContextPath() %>/LoginServlet" method="post">

                    <div class="input-box">

                        <label>Email</label>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter Email"
                            required>

                    </div>

                    <div class="input-box">

                        <label>Password</label>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter Password"
                            required>

                    </div>

                    <button type="submit" class="btn btn-primary w-100">

                        Login

                    </button>

                </form>

                <div class="link mt-3">

                    Don't have an account?

                    <a href="register.jsp">

                        Register

                    </a>

                </div>

            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

        <jsp:include page="footer.jsp"/>

    </body>

</html>
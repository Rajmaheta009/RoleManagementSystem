<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <title>Login</title>

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <div class="container">

            <div class="card login-card">

                <h1>Login</h1>

                <p>Welcome Back</p>

                <form action="LoginServlet" method="post">

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

                    <button type="submit">

                        Login

                    </button>

                </form>

                <div class="link">

                    Don't have an account?

                    <a href="register.jsp">

                        Register

                    </a>

                </div>

            </div>

        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>
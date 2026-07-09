<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">

        <title>Forgot Password</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <div class="container mt-5">

            <div class="row justify-content-center">

                <div class="col-md-5">

                    <div class="card shadow">

                        <div class="card-header bg-primary text-white">

                            <h3>Forgot Password</h3>

                        </div>

                        <div class="card-body">

                            <form action="ForgotPasswordServlet" method="post">

                                <div class="mb-3">

                                    <label>Email Address</label>

                                    <input
                                        type="email"
                                        name="email"
                                        class="form-control"
                                        required>

                                </div>

                                <button
                                    class="btn btn-primary w-100">

                                    Verify Email

                                </button>

                            </form>

                            <br>

                            <div class="text-center">

                                <a href="login.jsp">

                                    Back to Login

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
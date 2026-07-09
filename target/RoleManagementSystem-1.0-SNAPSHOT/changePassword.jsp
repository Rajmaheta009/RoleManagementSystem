<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Change Password</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="css/dashboard.css">

    </head>

    <body class="bg-light">

        <jsp:include page="navbar.jsp"/>
        <jsp:include page="sidebar.jsp"/>

        <div class="container mt-5">

            <div class="row justify-content-center">

                <div class="col-md-6">

                    <div class="card shadow">

                        <div class="card-header bg-warning">

                            <h3>Change Password</h3>

                        </div>

                        <div class="card-body">

                            <form action="ChangePasswordServlet"
                                  method="post">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Current Password

                                    </label>

                                    <input
                                        type="password"
                                        name="oldPassword"
                                        class="form-control"
                                        required>

                                </div>

                                <div class="mb-3">

                                    <label class="form-label">

                                        New Password

                                    </label>

                                    <input
                                        type="password"
                                        name="newPassword"
                                        class="form-control"
                                        required>

                                </div>

                                <div class="mb-3">

                                    <label class="form-label">

                                        Confirm Password

                                    </label>

                                    <input
                                        type="password"
                                        name="confirmPassword"
                                        class="form-control"
                                        required>

                                </div>

                                <button
                                    class="btn btn-success w-100">

                                    Update Password

                                </button>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>
<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Error</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>

            body{
                background:#f5f7fa;
            }

            .error-box{
                margin-top:120px;
            }

        </style>

    </head>

    <body>

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-6">

                    <div class="card shadow-lg error-box">

                        <div class="card-header bg-danger text-white">

                            <h3>Something Went Wrong</h3>

                        </div>

                        <div class="card-body text-center">

                            <h1 class="display-1">500</h1>

                            <p class="lead">

                                An unexpected error occurred.

                            </p>

                            <a href="DashboardServlet"
                               class="btn btn-primary">

                                Back to Dashboard

                            </a>

                            <a href="login.jsp"
                               class="btn btn-secondary">

                                Login Again

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>
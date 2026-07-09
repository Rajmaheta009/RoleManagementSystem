<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <title>Session Expired</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>

            body{

                background:#eef2f7;

            }

            .box{

                margin-top:120px;

            }

        </style>

    </head>

    <body>

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-6">

                    <div class="card shadow-lg box">

                        <div class="card-header bg-warning">

                            <h3>Session Expired</h3>

                        </div>

                        <div class="card-body text-center">

                            <h1 class="display-4">

                                ⌛

                            </h1>

                            <p class="lead">

                                Your session has expired.

                                Please login again.

                            </p>

                            <a href="login.jsp"
                               class="btn btn-success">

                                Login

                            </a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>

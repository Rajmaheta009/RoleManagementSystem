<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <title>Access Denied</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

    </head>

    <body class="bg-light">

        <div class="container mt-5">

            <div class="alert alert-danger text-center">

                <h2>

                    Access Denied

                </h2>

                <p>

                    You don't have permission to access this page.

                </p>

                <a href="dashboard.jsp"
                   class="btn btn-primary">

                    Go Dashboard

                </a>

            </div>

        </div>

    </body>

</html>
<jsp:include page="footer.jsp"/>
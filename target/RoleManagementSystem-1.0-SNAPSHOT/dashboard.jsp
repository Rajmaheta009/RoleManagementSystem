<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <title>Dashboard</title>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="css/dashboard.css">

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container-fluid">

    <div class="row">

        <div class="col-md-2 p-0">

            <jsp:include page="sidebar.jsp"/>

        </div>

        <div class="col-md-10 dashboard-content">

            <h2 class="mb-4">

                Welcome,
                <%=session.getAttribute("name")==null?"Guest":session.getAttribute("name")%>

            </h2>

            <div class="row">

                <div class="col-lg-3 col-md-6">

                    <div class="card dashboard-card bg-primary">

                        <h5>Total Users</h5>

                        <h1>${totalUsers}</h1>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card dashboard-card bg-success">

                        <h5>Employees</h5>

                        <h1>${totalEmployees}</h1>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card dashboard-card bg-warning">

                        <h5>Clients</h5>

                        <h1>${totalClients}</h1>

                    </div>

                </div>

                <div class="col-lg-3 col-md-6">

                    <div class="card dashboard-card bg-danger">

                        <h5>Admins</h5>

                        <h1>${totalAdmins}</h1>

                    </div>

                </div>

            </div>

            <div class="card mt-5 shadow">

                <div class="card-header">

                    Recent Users

                </div>

                <div class="card-body">

                    <table class="table table-bordered table-hover">

                        <thead class="table-dark">

                        <tr>

                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>

                        </tr>

                        </thead>

                        <tbody>

                        <tr>

                            <td>1</td>
                            <td>Raj</td>
                            <td>raj@gmail.com</td>
                            <td>ADMIN</td>
                            <td>Active</td>

                        </tr>

                        <tr>

                            <td>2</td>
                            <td>Rahul</td>
                            <td>rahul@gmail.com</td>
                            <td>EMPLOYEE</td>
                            <td>Active</td>

                        </tr>

                        <tr>

                            <td>3</td>
                            <td>Riya</td>
                            <td>riya@gmail.com</td>
                            <td>CLIENT</td>
                            <td>Active</td>

                        </tr>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>
<jsp:include page="footer.jsp"/>
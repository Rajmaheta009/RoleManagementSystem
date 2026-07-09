<jsp:include page="navbar.jsp"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <title>Registration</title>

        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <div class="container">

            <div class="card register-card">

                <h1>Create Account</h1>

                <p>User Registration</p>

                <form action="RegisterServlet" method="post">

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
                                placeholder="Password"
                                required>

                        </div>

                        <div class="input-box">

                            <label>Phone</label>

                            <input
                                type="text"
                                name="phone"
                                placeholder="Phone Number"
                                required>

                        </div>

                    </div>

                    <label>Gender</label>

                    <div class="gender-box">

                        <label>

                            <input
                                type="radio"
                                name="gender"
                                value="Male">

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
                            placeholder="Enter Address"></textarea>

                    </div>

                    <div class="input-box">

                        <label>Role</label>

                        <select name="role">

                            <option value="CLIENT">

                                Client

                            </option>

                            <option value="EMPLOYEE">

                                Employee

                            </option>

                        </select>

                    </div>

                    <button type="submit">

                        Register

                    </button>

                </form>

                <div class="link">

                    Already Registered?

                    <a href="login.jsp">

                        Login

                    </a>

                </div>

            </div>

        </div>

    </body>

</html>
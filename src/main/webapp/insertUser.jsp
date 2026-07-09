<jsp:include page="navbar.jsp"/>
<form action="InsertUserServlet" method="post">

    <div class="row">

        <div class="col-md-6 mb-3">

            <label class="form-label">Full Name</label>

            <input type="text"
                   class="form-control"
                   name="fullname"
                   required>

        </div>

        <div class="col-md-6 mb-3">

            <label class="form-label">Email</label>

            <input type="email"
                   class="form-control"
                   name="email"
                   required>

        </div>

        <div class="col-md-6 mb-3">

            <label class="form-label">Password</label>

            <input type="password"
                   class="form-control"
                   name="password"
                   required>

        </div>

        <div class="col-md-6 mb-3">

            <label class="form-label">Phone</label>

            <input type="text"
                   class="form-control"
                   name="phone"
                   required>

        </div>

        <div class="col-md-6 mb-3">

            <label class="form-label">Gender</label>

            <select class="form-select"
                    name="gender">

                <option value="Male">Male</option>

                <option value="Female">Female</option>

                <option value="Other">Other</option>

            </select>

        </div>

        <div class="col-md-6 mb-3">

            <label class="form-label">Role</label>

            <select class="form-select"
                    name="role">

                <option value="CLIENT">Client</option>

                <option value="EMPLOYEE">Employee</option>

                <option value="ADMIN">Admin</option>

            </select>

        </div>

        <div class="col-12 mb-3">

            <label class="form-label">Address</label>

            <textarea
                class="form-control"
                name="address"
                rows="4"></textarea>

        </div>

        <div class="col-12">

            <button
                class="btn btn-success">

                Save User

            </button>

            <a href="DisplayUserServlet"
               class="btn btn-secondary">

                Back

            </a>

        </div>

    </div>

</form>
<jsp:include page="footer.jsp"/>
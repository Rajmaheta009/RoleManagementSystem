package dao;

import config.DBConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private static final List<User> MEMORY_USERS = new ArrayList<>();
    private static boolean seededDefaultUser = false;

    private Connection conn;

    public UserDAO() {
        conn = DBConnection.getConnection();
//         System.out.println("Connection = " + conn);
    }

    private boolean useInMemoryStore() {
//        System.out.println("connectiion = "+conn);
        return conn == null;
    }

    private void seedDefaultUser() {

        if (seededDefaultUser) {
            return;
        }

        User admin = new User();

        admin.setId(1);
        admin.setFullname("Admin User");
        admin.setEmail("admin@example.com");
        admin.setPassword("admin123");
        admin.setPhone("9999999999");
        admin.setGender("Other");
        admin.setAddress("System");
        admin.setRoleId(1); // ADMIN Role ID
        admin.setStatus(true);

        MEMORY_USERS.add(admin);

        seededDefaultUser = true;
    }

    // ==========================
    // Register User
    // ==========================
    public boolean registerUser(User user) {

        boolean flag = false;

        if (user != null) {
            user.setEmail(user.getEmail().trim());
            user.setPassword(user.getPassword().trim());
        }

        if (useInMemoryStore()) {

            seedDefaultUser();

            user.setId(MEMORY_USERS.size() + 1);

            MEMORY_USERS.add(user);

            return true;
        }

        try {

            String sql = """
            INSERT INTO users
            (fullname,email,password,phone,gender,address,role_id,status)
            VALUES (?,?,?,?,?,?,?,?)
            """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setInt(7, user.getRoleId());
            ps.setBoolean(8, user.isStatus());

            int row = ps.executeUpdate();

            flag = row > 0;

            System.out.println("Register Rows : " + row);

        } catch (Exception e) {

            System.out.println("Register Error");

            e.printStackTrace();
        }

        return flag;
    }

    // ==========================
    // Login User
    // ==========================
    public User login(String email, String password) {

        User user = null;
        System.out.println("that is in login page");
        try {

            String sql = """
            SELECT *
            FROM users
            WHERE LOWER(email)=LOWER(?)
            AND password=?
            """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email.trim());
            ps.setString(2, password.trim());

            ResultSet rs = ps.executeQuery();
            

            if (rs.next()) {
                System.out.println("data is found");

                user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRoleId(rs.getInt("role_id"));
                user.setStatus(rs.getBoolean("status"));

                System.out.println("Login Success");
            } else {
                
                System.out.println("Invalid Email or Password");

            }

        } catch (Exception e) {

            System.out.println("Login Error");

            e.printStackTrace();

        }

        return user;
    }

    // ==========================
    // Display All Users
    // ==========================
    public List<User> getAllUsers() {

        List<User> list = new ArrayList<>();

        if (useInMemoryStore()) {
            seedDefaultUser();
            return new ArrayList<>(MEMORY_USERS);
        }

        try {

            String sql = """
                SELECT *
                FROM users
                ORDER BY id
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRoleId(rs.getInt("role_id"));
                user.setStatus(rs.getBoolean("status"));

                list.add(user);
            }

            System.out.println("Total Users Loaded : " + list.size());

        } catch (Exception e) {

            System.out.println("getAllUsers Error");

            e.printStackTrace();
        }

        return list;
    }
// ==========================
// Get User By ID
// ==========================

    public User getUserById(int id) {

        User user = null;

        try {

            String sql = "SELECT * FROM users WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRoleId(rs.getInt("role_id"));
                user.setStatus(rs.getBoolean("status"));

                System.out.println("User Found : " + user.getFullname());

            } else {

                System.out.println("User Not Found");

            }

        } catch (Exception e) {

            System.out.println("getUserById Error");

            e.printStackTrace();
        }

        return user;
    }
    // ==========================
// Update User
// ==========================

    public boolean updateUser(User user) {

        boolean flag = false;

        try {

            String sql = """
                UPDATE users
                SET
                fullname=?,
                email=?,
                password=?,
                phone=?,
                gender=?,
                address=?,
                role_id=?,
                status=?
                WHERE id=?
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setInt(7, user.getRoleId());
            ps.setBoolean(8, user.isStatus());
            ps.setInt(9, user.getId());

            int row = ps.executeUpdate();

            flag = row > 0;

            System.out.println("Updated Rows : " + row);

        } catch (Exception e) {

            System.out.println("Update Error");

            e.printStackTrace();
        }

        return flag;
    }
// ==========================
// Delete User
// ==========================

    public boolean deleteUser(int id) {

        boolean flag = false;

        try {

            String sql = "DELETE FROM users WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int row = ps.executeUpdate();

            flag = row > 0;

            System.out.println("Deleted Rows : " + row);

        } catch (Exception e) {

            System.out.println("Delete Error");

            e.printStackTrace();
        }

        return flag;
    }
// ==========================
// Count Total Users
// ==========================

    public int countUsers() {

        int count = 0;

        try {

            String sql = "SELECT COUNT(*) FROM users";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

            System.out.println("Total Users : " + count);

        } catch (Exception e) {

            System.out.println("countUsers Error");

            e.printStackTrace();

        }

        return count;

    }
// ==========================
// Count Admins
// ==========================

    public int countAdmins() {

        int count = 0;

        try {

            String sql = """
                SELECT COUNT(*)
                FROM users u
                INNER JOIN roles r
                ON u.role_id = r.id
                WHERE UPPER(r.role_name)='ADMIN'
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

            System.out.println("Admins : " + count);

        } catch (Exception e) {

            System.out.println("countAdmins Error");

            e.printStackTrace();

        }

        return count;

    }
// ==========================
// Count Employees
// ==========================

    public int countEmployees() {

        int count = 0;

        try {

            String sql = """
                SELECT COUNT(*)
                FROM users u
                INNER JOIN roles r
                ON u.role_id = r.id
                WHERE UPPER(r.role_name)='EMPLOYEE'
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

            System.out.println("Employees : " + count);

        } catch (Exception e) {

            System.out.println("countEmployees Error");

            e.printStackTrace();

        }

        return count;

    }
// ==========================
// Count Clients
// ==========================

    public int countClients() {

        int count = 0;

        try {

            String sql = """
                SELECT COUNT(*)
                FROM users u
                INNER JOIN roles r
                ON u.role_id = r.id
                WHERE UPPER(r.role_name)='CLIENT'
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

            System.out.println("Clients : " + count);

        } catch (Exception e) {

            System.out.println("countClients Error");

            e.printStackTrace();

        }

        return count;

    }

    // ==========================
// Change Password
// ==========================
    public boolean changePassword(int id, String password) {

        boolean flag = false;

        try {

            String sql = "UPDATE users SET password=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, password);
            ps.setInt(2, id);

            int row = ps.executeUpdate();

            flag = row > 0;

            System.out.println("Password Changed : " + row);

        } catch (Exception e) {

            System.out.println("Password Change Error");

            e.printStackTrace();

        }

        return flag;

    }
    // ==============================
// Search User
// ==============================

    public List<User> searchUsers(String keyword) {

        List<User> list = new ArrayList<>();

        try {

            String sql = """
                SELECT *
                FROM users
                WHERE
                LOWER(fullname) LIKE LOWER(?)
                OR LOWER(email) LIKE LOWER(?)
                OR phone LIKE ?
                ORDER BY id
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            String search = "%" + keyword.trim() + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRoleId(rs.getInt("role_id"));
                user.setStatus(rs.getBoolean("status"));

                list.add(user);

            }

            System.out.println("Search Result : " + list.size());

        } catch (Exception e) {

            System.out.println("Search Error");

            e.printStackTrace();

        }

        return list;

    }
// ======================================
// Update Logged-in User Profile
// ======================================

    public boolean updateProfile(User user) {

        boolean flag = false;

        try {

            String sql = """
                UPDATE users
                SET
                fullname=?,
                email=?,
                phone=?,
                gender=?,
                address=?
                WHERE id=?
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getId());

            int row = ps.executeUpdate();

            flag = row > 0;

            System.out.println("Profile Updated : " + row);

        } catch (Exception e) {

            System.out.println("Update Profile Error");

            e.printStackTrace();

        }

        return flag;

    }
    // =====================================
// Check Email Exists
// =====================================

    public boolean emailExists(String email) {

        boolean status = false;

        try {

            String sql = "SELECT 1 FROM users WHERE LOWER(email)=LOWER(?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email.trim());

            ResultSet rs = ps.executeQuery();

            status = rs.next();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;
    }
}

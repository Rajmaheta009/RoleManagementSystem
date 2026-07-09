package dao;

import config.DBConnection;
import model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection conn;

    public UserDAO() {

        conn = DBConnection.getConnection();

    }

    // ==========================
    // Register User
    // ==========================
    public boolean registerUser(user user) {

        boolean flag = false;

        try {

            String sql = "INSERT INTO users(fullname,email,password,phone,gender,address,role,status) VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getRole());
            ps.setBoolean(8, user.isStatus());

            int i = ps.executeUpdate();

            if (i > 0) {

                flag = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return flag;

    }

    // ==========================
    // Login User
    // ==========================
    public user login(String email, String password) {

        user user = null;

        try {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new user();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getBoolean("status"));

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return user;

    }

    // ==========================
    // Display All Users
    // ==========================
    public List<user> getAllUsers() {

        List<user> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM users ORDER BY id";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                user user = new user();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getBoolean("status"));

                list.add(user);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;

    }
// ==========================
// Get User By ID
// ==========================

    public user getUserById(int id) {

        user user = null;

        try {

            String sql = "SELECT * FROM users WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new user();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getBoolean("status"));

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return user;

    }
    // ==========================
// Update User
// ==========================

    public boolean updateUser(user user) {

        boolean flag = false;

        try {

            String sql = "UPDATE users SET fullname=?,email=?,password=?,phone=?,gender=?,address=?,role=?,status=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getRole());
            ps.setBoolean(8, user.isStatus());
            ps.setInt(9, user.getId());

            int i = ps.executeUpdate();

            if (i > 0) {

                flag = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return flag;

    }// ==========================
// Delete User
// ==========================

    public boolean deleteUser(int id) {

        boolean flag = false;

        try {

            String sql = "DELETE FROM users WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if (i > 0) {

                flag = true;

            }

        } catch (Exception e) {

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

        } catch (Exception e) {

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

            String sql = "SELECT COUNT(*) FROM users WHERE role='ADMIN'";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

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

            String sql = "SELECT COUNT(*) FROM users WHERE role='EMPLOYEE'";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

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

            String sql = "SELECT COUNT(*) FROM users WHERE role='CLIENT'";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

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

            int i = ps.executeUpdate();

            if (i > 0) {

                flag = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return flag;

    }
    // ==============================
// Search User
// ==============================

    public List<user> searchUsers(String keyword) {

        List<user> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM users "
                    + "WHERE "
                    + "LOWER(fullname) LIKE LOWER(?) "
                    + "OR LOWER(email) LIKE LOWER(?) "
                    + "OR phone LIKE ? "
                    + "OR LOWER(role) LIKE LOWER(?) "
                    + "ORDER BY id";

            PreparedStatement ps = conn.prepareStatement(sql);

            String search = "%" + keyword + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);
            ps.setString(4, search);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                user user = new user();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getBoolean("status"));

                list.add(user);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;

    }
// ======================================
// Update Logged-in User Profile
// ======================================

    public boolean updateProfile(user user) {

        boolean status = false;

        try {

            String sql = "UPDATE users SET fullname=?,email=?,phone=?,gender=?,address=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAddress());
            ps.setInt(6, user.getId());

            int i = ps.executeUpdate();

            if (i > 0) {

                status = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;

    }
    // =====================================
// Check Email Exists
// =====================================

    public boolean emailExists(String email) {

        boolean status = false;

        try {

            String sql = "SELECT * FROM users WHERE email=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                status = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;

    }
}

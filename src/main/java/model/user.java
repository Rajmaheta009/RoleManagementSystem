package model;

public class User {

    private int id;
    private String fullname;
    private String email;
    private String password;
    private String phone;
    private String gender;
    private String address;
    private int roleId;
    private boolean status;

    public User() {
    }

    public User(int id, String fullname, String email, String password,
            String phone, String gender, String address,
            int roleId, boolean status) {

        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.roleId = roleId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

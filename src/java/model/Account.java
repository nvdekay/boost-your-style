package model;

public class Account {

    private int id, roleId;
    private String username, email, address, phoneNumber, password;
    private boolean active;

    public Account() {
    }

    public Account(String username, String email, String address, String phoneNumber, String password) {
        this.username = username;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }
    
    
    

    public Account(String username, String password, int roleId) {
        this.username = username;
        this.password = password;
        this.roleId = roleId;
    }

    public Account(int id, int roleId, String username, String email, String address, String phoneNumber, String password) {
        this.id = id;
        this.roleId = roleId;
        this.username = username;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    
    

}

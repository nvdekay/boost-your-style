package model;

public class Account {
//    	ID int identity(1,1) primary key,
//	Username nvarchar(100) not null unique,
//	Email nvarchar(100) not null unique,
//	Address nvarchar(100) not null,
//	PhoneNumber varchar(20) not null unique,
//	Password varchar(50) not null,
//	RoleID int not null,
//	Create_At datetime default(getDate()),
//	foreign key (RoleID) references Roles(RoleID),

    private int id, roleId;
    private String username, email, address, phoneNumber, password;

    public Account(String string, String string1, int aInt) {
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

}

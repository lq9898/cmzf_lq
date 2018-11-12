package com.baizhi.entity;

public class Admin {
    private String id;
    private  String adminName;
    private  String password;
    private  String status;

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", adminName='" + adminName + '\'' +
                ", password='" + password + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Admin(String id, String adminName, String password, String status) {
        this.id = id;
        this.adminName = adminName;
        this.password = password;
        this.status = status;
    }

    public Admin() {
    }
}

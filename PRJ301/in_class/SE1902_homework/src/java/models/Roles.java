package models;

public class Roles {
    private int roleID;
    private String roleName;
    private int status;
    
    public Roles() {
        this.roleID = 0;
        this.roleName = "";
        this.status = 0;
    }

    public Roles(String roleName, int status) {
        this.roleName = roleName;
        this.status = status;
    }

    public Roles(int roleID, String roleName, int status) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.status = status;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return roleID + "-" + roleName;
    }
    
}

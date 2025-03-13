/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuatr
 */
public class RoleCount {
    private int roleID;
    private String roleName;
    private int totalUsers;

    public RoleCount(int roleID, String roleName, int totalUsers) {
        this.roleID = roleID;
        this.roleName = roleName;
        this.totalUsers = totalUsers;
    }

    public int getRoleID() {
        return roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public int getTotalUsers() {
        return totalUsers;
    }
}


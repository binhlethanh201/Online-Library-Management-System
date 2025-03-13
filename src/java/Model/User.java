/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class User {
//    	[Username] [varchar](50) NOT NULL,
//	[Password] [varchar](50) NOT NULL,
//	[PersonID] [varchar](20) NOT NULL,
//	[RoleID] [varchar](20) NOT NULL,
    private String Username;
    private String Password;
    private int PersonID;
    private int RoleID;
    private String RoleName;

    public User() {
    }

    public User(String Username, String Password, int PersonID, int RoleID) {
        this.Username = Username;
        this.Password = Password;
        this.PersonID = PersonID;
        this.RoleID = RoleID;
    }

    public User(String Username, String Password, int PersonID, int RoleID, String RoleName) {
        this.Username = Username;
        this.Password = Password;
        this.PersonID = PersonID;
        this.RoleID = RoleID;
        this.RoleName = RoleName;
    }
    

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getPersonID() {
        return PersonID;
    }

    public void setPersonID(int PersonID) {
        this.PersonID = PersonID;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public String getRoleName() {
        return RoleName;
    }

    public void setRoleName(String RoleName) {
        this.RoleName = RoleName;
    }
    
    

    @Override
    public String toString() {
        return "User{" + "Username=" + Username + ", Password=" + Password + ", PersonID=" + PersonID + ", RoleID=" + RoleID + '}';
    }

    
    
    
    
    
    
}

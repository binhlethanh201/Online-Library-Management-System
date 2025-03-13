/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Person {
    
//    [PersonID] [int] IDENTITY(1,1) NOT NULL,
//	[Name] [nvarchar](50) NULL,
//	[Gender] [nvarchar](6) NULL,
//	[DateOfBirth] [date] NULL,
//	[Address] [nvarchar](200) NULL,
//	[Email] [varchar](100) NULL,
//	[Phone] [varchar](15) NULL,
    
    private int PersonID;
    private String name;
    private String gender;
    private Date birth;
    private String address;
    private String email;
    private String phone;
    private int roleID;
    private String roleName;
    private String username;

    public Person() {
    }

    public Person(int PersonID, String name, String gender, Date birth, String address, String email, String phone, int roleID, String roleName, String username) {
        this.PersonID = PersonID;
        this.name = name;
        this.gender = gender;
        this.birth = birth;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.roleID = roleID;
        this.roleName = roleName;
        this.username = username;
    }

    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
    
    public int getPersonID() {
        return PersonID;
    }

    public void setPersonID(int PersonID) {
        this.PersonID = PersonID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    @Override
    public String toString() {
        return "Person{" + "PersonID=" + PersonID + ", name=" + name + ", gender=" + gender + ", birth=" + birth + ", address=" + address + ", email=" + email + ", phone=" + phone + ", roleID=" + roleID + ", roleName=" + roleName + ", username=" + username + '}';
    }
    
    
    
    
}

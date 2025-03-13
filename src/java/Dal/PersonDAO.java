/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Person;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class PersonDAO extends DBContext {

    public Person getInfoUser(int id) {
        String sql = "select *from Person p\n"
                + "join Users u ON p.PersonID =u.PersonID\n"
                + "join Role r ON u.RoleID =r.RoleID\n"
                + "where p.PersonID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Person(
                            rs.getInt("PersonID"),
                            rs.getString("Name"),
                            rs.getString("Gender"),
                            rs.getDate("DateOfBirth"),
                            rs.getString("Address"),
                            rs.getString("Email"),
                            rs.getString("Phone"),
                            rs.getInt("RoleID"),
                            rs.getString("RoleName"),
                            rs.getString("Username"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
            PersonDAO p = new PersonDAO();
            Person a = p.getInfoUser(1);
            System.out.println(a);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Role;
import Model.RoleCount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class RoleDAO extends DBContext {

    public List<Role> getRole() {
        String sql = "select * from Role\n"
                + "where RoleID !=3";
        List<Role> listR = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role a = new Role(rs.getInt("RoleID"), rs.getString("RoleName"));
                listR.add(a);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }
        return listR;

    }
    
    public List<RoleCount> getRoleUserCounts() {
        String sql = "SELECT r.RoleID, r.RoleName, COUNT(u.RoleID) AS TotalUsers "
                   + "FROM [DB_PRJ301_LONGPD_SEND].[dbo].[Role] r "
                   + "LEFT JOIN [DB_PRJ301_LONGPD_SEND].[dbo].[Users] u ON r.RoleID = u.RoleID "
                   + "GROUP BY r.RoleID, r.RoleName "
                   + "ORDER BY r.RoleID";

        List<RoleCount> roleCounts = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int roleID = rs.getInt("RoleID");
                String roleName = rs.getString("RoleName");
                int totalUsers = rs.getInt("TotalUsers");

                RoleCount roleCount = new RoleCount(roleID, roleName, totalUsers);
                roleCounts.add(roleCount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return roleCounts;
    }

    public static void main(String[] args) {
        RoleDAO r = new RoleDAO();
        List<Role> list = r.getRole();
        for (Role a : list) {
            System.out.println(a);
        }
    }
}

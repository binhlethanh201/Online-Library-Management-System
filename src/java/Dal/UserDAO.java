/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Reader;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class UserDAO extends DBContext {
    // hàm dang nhâp

    public User Login(String username, String pass) {
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        String xUsername, xPass;
        int xId, xRole;
        User x = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                xUsername = rs.getString("Username");
                xPass = rs.getString("Password");
                xId = rs.getInt("PersonID");
                xRole = rs.getInt("RoleID");
                x = new User(username, pass, xRole, xRole);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public List<User> getUser() {
        List<User> listU = new ArrayList<>();
        String sql = "select * from Users u\n"
                + "JOIN Role r\n"
                + "on u.RoleID=r.RoleID\n"
                + "where u.RoleID !=3";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                User c = new User(rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("PersonID"),
                        rs.getInt("RoleID"),
                        rs.getString("RoleName"));
                listU.add(c);
            }
        } catch (SQLException e) {

        }
        return listU;
    }

    public User checkAccountExist(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkUsernameExist(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;  // Username exists
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;  // Username does not exist or an exception occurred
    }

    public User checkPersonIDExist(String personid) {
        String sql = "SELECT * FROM Users WHERE PersonID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, personid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkUserExist(String user, String pass) {
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, user);
            st.setString(2, pass);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); // Returns true if ResultSet has any rows (user exists)
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false if an exception occurs or user does not exist
    }

    public boolean updatePassword(String user, String pass) {
        String sql = "UPDATE Users SET Password = ? WHERE Username = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, pass);
            st.setString(2, user);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;  // Return true if at least one row was updated
        } catch (SQLException e) {
            e.printStackTrace();  // Use printStackTrace() instead of System.out.println()
        }
        return false;
    }

    public int getMaxPersonID() {
        String sql = "SELECT MAX(PersonID) FROM Person";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0; // Nếu không có giá trị nào, trả về 0
    }

    public boolean signUp(String username, String password) {
        int currentMaxPersonID = getMaxPersonID();
        int newPersonID = currentMaxPersonID;

        String sql = "INSERT INTO Users (Username, Password, PersonID, RoleID) VALUES (?, ?, ?, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, newPersonID);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public void updateRole(int personID, int roleID) {
        String sql = "UPDATE [dbo].[Users] SET RoleID = ? WHERE PersonID =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, roleID);
            st.setInt(2, personID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        ReaderDAO r = new ReaderDAO();

        if(u.updatePassword("user2", "long")){
            
        }
    }
}

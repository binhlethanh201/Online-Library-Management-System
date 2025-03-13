/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Publisher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class PublisherDAO extends DBContext {

    public List<Publisher> getPublisher() {
        String sql = "select * from Publisher";
        List<Publisher> ListP = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Publisher a = new Publisher(rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getString("Address"),
                        rs.getString("Website"),
                        rs.getString("Email"),
                        rs.getString("Phone"));
                ListP.add(a);

            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }

        return ListP;

    }

    public Publisher getPublisherById(int Id) {
        String sql = "select * from Publisher where PublisherID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Publisher(rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getString("Address"),
                        rs.getString("Website"),
                        rs.getString("Email"),
                        rs.getString("Phone"));

            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }

        return null;

    }

    public List<Publisher> getPublisherBySearch(String txt) {
        String sql = "select * from Publisher where PublisherName LIKE ?";
        List<Publisher> ListP = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Publisher a = new Publisher(rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getString("Address"),
                        rs.getString("Website"),
                        rs.getString("Email"),
                        rs.getString("Phone"));
                ListP.add(a);

            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }

        return ListP;

    }

    public void updatePublisher(int id, String name, String address, String website, String email, String phone) {
        String sql = "UPDATE [dbo].[Publisher]\n"
                + "   SET [PublisherName] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Website] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Phone] = ?\n"
                + " WHERE PublisherID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, website);
            st.setString(4, email);
            st.setString(5, phone);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void addPublisher(String name, String address, String website, String email, String phone) {
        String sql = "INSERT INTO [dbo].[Publisher]\n"
                + "           ([PublisherName]\n"
                + "           ,[Address]\n"
                + "           ,[Website]\n"
                + "           ,[Email]\n"
                + "           ,[Phone])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, website);
            st.setString(4, email);
            st.setString(5, phone);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        PublisherDAO a = new PublisherDAO();
        List<Publisher> list = a.getPublisher();

        for (Publisher o : list) {
            System.out.println(o);
        }

    }

}

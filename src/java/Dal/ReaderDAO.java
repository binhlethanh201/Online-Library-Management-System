/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Reader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duc Long
 */
public class ReaderDAO extends DBContext {

    public List<Reader> getAllReader() {
        List<Reader> listReader = new ArrayList<>();
        try {
            String sql = "select * from Person";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Reader r = new Reader();
                r.setPersonID(rs.getInt("PersonID"));
                r.setName(rs.getString("Name"));
                r.setGender(rs.getString("Gender"));
                r.setDateOfBirth(rs.getString("DateOfBirth"));
                r.setStartDate(rs.getString("StartDate"));
                r.setAddress(rs.getString("Address"));
                r.setEmail(rs.getString("Email"));
                r.setPhone(rs.getString("Phone"));
                listReader.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listReader;
    }

    public boolean addReader(String name, String gender, String dateOfBirth, String startDate, String address, String email, String phone) {
        String sql = "INSERT INTO Person (Name, Gender, DateOfBirth, StartDate, Address, Email, Phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, gender);
            st.setString(3, dateOfBirth);
            st.setString(4, startDate);  // StartDate is now included
            st.setString(5, address);
            st.setString(6, email);
            st.setString(7, phone);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Reader getPersonByUser(String user) {
        try {
            String sql = "select * from Person p\n"
                    + "join Users u on p.PersonID = u.PersonID\n"
                    + "where u.Username = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Reader r = new Reader();
                r.setPersonID(rs.getInt("PersonID"));
                r.setName(rs.getString("Name"));
                r.setGender(rs.getString("Gender"));
                r.setDateOfBirth(rs.getString("DateOfBirth"));
                r.setStartDate(rs.getString("StartDate"));
                r.setAddress(rs.getString("Address"));
                r.setEmail(rs.getString("Email"));
                r.setPhone(rs.getString("Phone"));
                return r;
            }
            rs.close();
            st.close();
            return null;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }


    public Reader getPersonByCard(int cardid) {
        try {
            String sql = "  select * from Person p\n"
                    + "  join Card c on p.PersonID = c.PersonID\n"
                    + "  where c.CardID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cardid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Reader r = new Reader();
                r.setPersonID(rs.getInt("PersonID"));
                r.setName(rs.getString("Name"));
                r.setGender(rs.getString("Gender"));
                r.setDateOfBirth(rs.getString("DateOfBirth"));
                r.setStartDate(rs.getString("StartDate"));
                r.setAddress(rs.getString("Address"));
                r.setEmail(rs.getString("Email"));
                r.setPhone(rs.getString("Phone"));
                return r;
            }
            rs.close();
            st.close();
            return null;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int getLastInsertedBorrowID() {
        String sql = "SELECT MAX(BorrowID) AS BorrowID FROM Borrow";
        try (Statement st = connection.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt("BorrowID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Indicate failure
    }

    public boolean updateReader(int pid, String name, String gender, String date, String startdate, String address, String email, String phone) {
        try {
            String sql = "update Person set Name = ?, Gender = ?, DateOfBirth = ?, StartDate = ?, Address = ?, Email = ?, Phone = ? where PersonID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, gender);
            st.setString(3, date);
            st.setString(4, startdate);
            st.setString(5, address);
            st.setString(6, email);
            st.setString(7, phone);
            st.setInt(8, pid);
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        ReaderDAO rDAO = new ReaderDAO();
        int cardid = 9;
        System.out.println(rDAO.getPersonByCard(cardid));
//        if (r.addReader(null, null, null, null, null, null, null)) {
//            System.out.println("Success");
//        }
rDAO.updateReader(2, "Nguyễn Thị Bích Lương", "Nữ", "2000-09-09", null, "Tô Hiệu", "luong@gmail.com", "0986789988");
    }

}

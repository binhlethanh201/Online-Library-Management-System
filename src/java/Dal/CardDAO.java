/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import Model.Card;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duc Long
 */
public class CardDAO extends DBContext {

    public List<Card> getAllCard() {
        List<Card> listCard = new ArrayList<>();
        try {
            String sql = "select * from ";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Card r = new Card();
                r.setCardID(rs.getInt("CardID"));
                r.setPersonID(rs.getInt("PersonID"));
                r.setValidFrom(rs.getString("ValidFrom"));
                r.setValidThru(rs.getString("ValidThru"));
                listCard.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listCard;
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

    public boolean addCard(String ValidFrom, String ValidThru) {
        String sql = "INSERT INTO Card (PersonID, ValidFrom, ValidThru) VALUES (?, ?, ?)";
        int currentMaxPersonID = getMaxPersonID();
        int newPersonID = currentMaxPersonID;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, newPersonID);
            st.setString(2, ValidFrom);
            st.setString(3, ValidThru);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addCardExistUser(int pid, String ValidFrom, String ValidThru) {
        String sql = "INSERT INTO Card (PersonID, ValidFrom, ValidThru) VALUES (?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, pid);
            st.setString(2, ValidFrom);
            st.setString(3, ValidThru);
            return st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getLastInsertedCardID() {
        String sql = "SELECT MAX(CardID) AS CardID FROM Card";
        try (Statement st = connection.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt("CardID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Indicate failure
    }

    public boolean checkPersonExistCard(int personId) {
        String sql = "select * from Person p\n"
                + "join Card c on p.PersonID = c.PersonID\n"
                + "where p.PersonID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, personId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkExistCard(int cardid) {
        String sql = "select * from Card where CardID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cardid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getCardByPerson(int personId) {
        String sql = "select * from Card c\n"
                + "where PersonID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, personId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("CardID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static void main(String[] args) {
        CardDAO c = new CardDAO();
        if (c.checkExistCard(20)) {
            System.out.println("True");
        } else {
            System.out.println("False");
        }

    }

}

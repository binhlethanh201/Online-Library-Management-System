/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Book;
import Model.Borrow;
import Model.Reader;
import Model.StatusCount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Duc Long
 */
public class BorrowDAO extends DBContext {

    public List<Borrow> getAllBorrow() {
        List<Borrow> listBorrow = new ArrayList<>();
        try {
            String sql = "select * from Borrow b\n"
                    + "join BorrowDetails b1 on b.BorrowID = b1.BorrowID\n"
                    + "join Book b2 on b1.BookID = b2.BookID";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Borrow b = new Borrow();
                b.setBookID(rs.getInt("BookID"));
                b.setPersonID(rs.getInt("PersonID"));
                b.setBorrowID(rs.getInt("BorrowID"));
                b.setBookName(rs.getString("BookName"));
                b.setAmount(rs.getInt("Amount"));
                b.setBorrowDate(rs.getDate("BorrowDate"));
                b.setDeadline(rs.getDate("Deadline"));
                b.setReturnDate(rs.getDate("ReturnDate"));
                b.setStatus(rs.getString("Status"));
                listBorrow.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBorrow;
    }

    public List<Borrow> getAllBorrowByPerson(int pid) {
        List<Borrow> listBorrow = new ArrayList<>();
        try {
            String sql = "select * from Borrow b\n"
                    + "join BorrowDetails b1 on b.BorrowID = b1.BorrowID\n"
                    + "join Book b2 on b1.BookID = b2.BookID where b.PersonID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Borrow b = new Borrow();
                b.setBookID(rs.getInt("BookID"));
                b.setPersonID(rs.getInt("PersonID"));
                b.setBorrowID(rs.getInt("BorrowID"));
                b.setBookName(rs.getString("BookName"));
                b.setAmount(rs.getInt("Amount"));
                b.setBorrowDate(rs.getDate("BorrowDate"));
                b.setDeadline(rs.getDate("Deadline"));
                b.setReturnDate(rs.getDate("ReturnDate"));
                b.setStatus(rs.getString("Status"));
                listBorrow.add(b);
            }
        } catch (SQLException e) {
            // Handle or log the exception appropriately
            e.printStackTrace();
        }
        return listBorrow;
    }

    public void addBorrow(int PersonID, List<Integer> BookIDs, List<Integer> Amounts, String BorrowDate, String Deadline, String ReturnDate, String Status) {
        String sqlBorrow = "INSERT INTO Borrow (PersonID, BorrowDate, Deadline) VALUES (?, ?, ?)";
        String sqlBorrowDetails = "INSERT INTO BorrowDetails (BorrowID, BookID, Amount, ReturnDate, Status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement stBorrow = connection.prepareStatement(sqlBorrow, Statement.RETURN_GENERATED_KEYS); PreparedStatement stBorrowDetails = connection.prepareStatement(sqlBorrowDetails)) {

            // Execute INSERT INTO Borrow
            stBorrow.setInt(1, PersonID);
            stBorrow.setString(2, BorrowDate);
            stBorrow.setString(3, Deadline);
            stBorrow.executeUpdate();

            // Get the generated BorrowID
            ResultSet generatedKeys = stBorrow.getGeneratedKeys();
            int borrowID = -1;
            if (generatedKeys.next()) {
                borrowID = generatedKeys.getInt(1);
            }

            // Execute INSERT INTO BorrowDetails for each BookID
            for (int i = 0; i < BookIDs.size(); i++) {
                stBorrowDetails.setInt(1, borrowID);
                stBorrowDetails.setInt(2, BookIDs.get(i));
                stBorrowDetails.setInt(3, Amounts.get(i));
                stBorrowDetails.setString(4, ReturnDate);
                stBorrowDetails.setString(5, Status);
                stBorrowDetails.addBatch();
            }

            stBorrowDetails.executeBatch();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteOneBorrow(int borrowid, int bookid) {
        try {
            String sql = "Delete from BorrowDetails WHERE BorrowID = ? and BookID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, borrowid);
            st.setInt(2, bookid);
            st.executeUpdate();
            st.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;

        }

    }

    public boolean deleteBorrow(int borrowid) {
        try {
            String sql = "Delete from BorrowDetails WHERE BorrowID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, borrowid);
            st.executeUpdate();
            st.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;

        }

    }

    public List<Integer> searchBorrrowIDByPid(int pid) {
        List<Integer> listB = new ArrayList<>();
        try {
            String sql = "select BorrowID from Borrow where PersonID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listB.add(rs.getInt("BorrowID"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listB;
    }

    public boolean deleteAllBorrowDetails(int personid) {
        BorrowDAO bDAO = new BorrowDAO();
        try {
            String sql = "Delete from BorrowDetails WHERE BorrowID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            List<Integer> borrowIDs = bDAO.searchBorrrowIDByPid(personid);
            for (int borrowID : borrowIDs) {
                st.setInt(1, borrowID);
                st.executeUpdate();
            }
            st.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;

        }
    }

    public boolean deleteAllBorrowByPerson(int personid) {
        BorrowDAO bDAO = new BorrowDAO();
        try {
            String sql = "Delete from Borrow WHERE PersonID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, personid);
            st.executeUpdate();
            st.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;

        }
    }

    public boolean updateBorrow(int borrowid, int bookid, int amount, String returndate, String status) {
        try {
            String sql = "UPDATE BorrowDetails SET Amount = ?, ReturnDate = ? , Status = ? WHERE BorrowID = ? and BookID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            st.setString(2, returndate);
            st.setString(3, status);
            st.setInt(4, borrowid);
            st.setInt(5, bookid);
            st.executeUpdate();
            st.close();
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;

        }

    }

    public List<Borrow> getPersonIDsByDeadline(String date) {
        List<Borrow> personIDs = new ArrayList<>();
        try {
            String sql = "select * from Borrow b\n"
                    + "join BorrowDetails b1 on b.BorrowID = b1.BorrowID\n"
                    + "join Book b2 on b1.BookID = b2.BookID\n"
                    + "where b.Deadline = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, date);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Borrow b = new Borrow();
                b.setBookID(rs.getInt("BookID"));
                b.setPersonID(rs.getInt("PersonID"));
                b.setBorrowID(rs.getInt("BorrowID"));
                b.setBookName(rs.getString("BookName"));
                b.setAmount(rs.getInt("Amount"));
                b.setBorrowDate(rs.getDate("BorrowDate"));
                b.setDeadline(rs.getDate("Deadline"));
                b.setReturnDate(rs.getDate("ReturnDate"));
                b.setStatus(rs.getString("Status"));
                personIDs.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return personIDs;
    }
    
    public List<StatusCount> getStatusCounts() {
        String sql = """
                     SELECT [Status], COUNT(*) AS StatusCount 
                                     FROM [BorrowDetails] 
                                     GROUP BY [Status]""";

        List<StatusCount> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String status = rs.getString("Status");
                int count = rs.getInt("StatusCount");
                list.add(new StatusCount(status, count));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        BorrowDAO bDAO = new BorrowDAO();
        List<Borrow> li = bDAO.getPersonIDsByDeadline("2024-07-13");
        for (Borrow p : li) {
            System.out.println(p);
        }

    }
}

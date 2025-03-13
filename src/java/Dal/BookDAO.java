/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Book;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Duc Long
 */
public class BookDAO extends DBContext {

    public List<Book> getAllBook() {
        List<Book> listBook = new ArrayList<>();
        try {
            String sql = "select * from Book";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setImages(rs.getString("Images"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisherID(rs.getInt("PublisherID"));
                b.setCategoryID(rs.getInt("CategoryID"));
                b.setPublishingYear(rs.getInt("PublishingYear"));
                b.setDescription(rs.getString("Description"));
                listBook.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBook;
    }

    public List<Book> getBookByCategoryId(int cateID) {
        List<Book> listBook = new ArrayList<>();
        String sql = "select * from Book where CategoryID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setImages(rs.getString("Images"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisherID(rs.getInt("PublisherID"));
                b.setCategoryID(rs.getInt("CategoryID"));
                b.setPublishingYear(rs.getInt("PublishingYear"));
                b.setDescription(rs.getString("Description"));
                listBook.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBook;
    }

    public List<Book> getBookBySearch(String txt) {
        List<Book> listBook = new ArrayList<>();
        String sql = "select * from Book where BookName like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setImages(rs.getString("Images"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisherID(rs.getInt("PublisherID"));
                b.setCategoryID(rs.getInt("CategoryID"));
                b.setPublishingYear(rs.getInt("PublishingYear"));
                b.setDescription(rs.getString("Description"));
                listBook.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBook;
    }

    public Book getBookDetail(int bookID) {

        String sql = """
                     select b.*,p.PublisherName from Book b
                     JOIN Publisher p ON b.PublisherID=p.PublisherID
                     where BookID =?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Book(rs.getInt("BookID"),
                        rs.getString("BookName"),
                        rs.getString("Images"),
                        rs.getString("Author"),
                        rs.getInt("PublisherID"),
                        rs.getString("PublisherName"),
                        rs.getInt("CategoryID"),
                        rs.getInt("PublishingYear"),
                        rs.getString("Description"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Book> getNewBook() {
        List<Book> listBook = new ArrayList<>();
        String sql = "SELECT TOP (4) * FROM Book ORDER BY BookID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setImages(rs.getString("Images"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisherID(rs.getInt("PublisherID"));
                b.setCategoryID(rs.getInt("CategoryID"));
                b.setPublishingYear(rs.getInt("PublishingYear"));
                b.setDescription(rs.getString("Description"));
                listBook.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBook;
    }

    public List<Book> getRandomBookByCategory(int Category) {
        List<Book> listBook = new ArrayList<>();
        String sql = "SELECT TOP(4) * FROM Book WHERE CategoryID = ? ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Category);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Book b = new Book();
                b.setBookID(rs.getInt("BookID"));
                b.setBookName(rs.getString("BookName"));
                b.setImages(rs.getString("Images"));
                b.setAuthor(rs.getString("Author"));
                b.setPublisherID(rs.getInt("PublisherID"));
                b.setCategoryID(rs.getInt("CategoryID"));
                b.setPublishingYear(rs.getInt("PublishingYear"));
                b.setDescription(rs.getString("Description"));
                listBook.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listBook;
    }

    public List<Book> getBookByPage(List<Book> list, int start, int end) {
        ArrayList<Book> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void updateBook(int bookId, String bookName, String images, String author, int publisherId, int CategoryId, int publishingYear, String des) {
        String sql = "UPDATE [dbo].[Book]\n"
                + "   SET [BookName] = ?\n"
                + "      ,[Images] = ?\n"
                + "      ,[Author] = ?\n"
                + "      ,[PublisherID] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[PublishingYear] = ?\n"
                + "      ,[Description] = ?\n"
                + " WHERE BookID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, bookName);
            st.setString(2, images);
            st.setString(3, author);
            st.setInt(4, publisherId);
            st.setInt(5, CategoryId);
            st.setInt(6, publishingYear);
            st.setString(7, des);
            st.setInt(8, bookId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBook(int bookID) {
        String sql = "DELETE FROM [dbo].[Book]\n"
                + "      WHERE BookID=?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, bookID);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addBook(String bookName, String image, String author, int publisherId, int categoryId, int pubYear, String des) {
        String sql = "INSERT INTO [dbo].[Book]\n"
                + "           ([BookName]\n"
                + "           ,[Images]\n"
                + "           ,[Author]\n"
                + "           ,[PublisherID]\n"
                + "           ,[CategoryID]\n"
                + "           ,[PublishingYear]\n"
                + "           ,[Description])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, bookName);
            st.setString(2, image);
            st.setString(3, author);
            st.setInt(4, publisherId);
            st.setInt(5, categoryId);
            st.setInt(6, pubYear);
            st.setString(7, des);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateBookInfo(int BookID, String Author, int CategoryID, String Description) {
        try {
            String sql = "UPDATE Book SET Author = ?, CategoryID = ?, Description = ? WHERE BookID = ?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, Author);
            st.setInt(2, CategoryID);
            st.setString(3, Description);
            st.setInt(4, BookID);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        BookDAO book = new BookDAO();
        List<Book> li = book.getAllBook();
        if (book.updateBookInfo(9, "long", 4, "hay")) {
            System.out.println("Success");
        }
    }

}

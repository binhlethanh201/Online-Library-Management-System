/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Category;
import Model.CategoryBookCount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCatgory() {
        String sql = "select * from category";
        List<Category> category = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category a = new Category(rs.getInt("CategoryId"), rs.getString("CategoryName"));
                category.add(a);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }
        return category;
    }

    public Category getCategoryById(int BookID) {
        String sql = "select c.CategoryID, c.CategoryName from Book b\n"
                + "join Category c on b.CategoryID =c.CategoryID\n"
                + "where b.BookID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, BookID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt("CategoryId"), rs.getString("CategoryName"));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }
        return null;
    }

    public boolean deleteCategory(int cateID) {
        String checkQuery = "SELECT COUNT(*) FROM [dbo].[Book] WHERE CategoryID = ?";
        String deleteQuery = "DELETE FROM [dbo].[Category] WHERE CategoryID = ?";

        try {
            // Kiểm tra xem có sách nào liên kết với CategoryID không
            PreparedStatement checkStmt = connection.prepareStatement(checkQuery);
            checkStmt.setInt(1, cateID);
            ResultSet rs = checkStmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                // Nếu có sách liên kết, trả về false
                return false;
            } else {
                // Nếu không có sách liên kết, thực hiện việc xóa
                PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
                deleteStmt.setInt(1, cateID);
                deleteStmt.executeUpdate();
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Category> getCategorySearch(String txt) {
        String sql = "select * from Category where CategoryName LIKE ?";
        List<Category> ListC = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category a = new Category(rs.getInt("CategoryId"),
                        rs.getString("CategoryName"));

                ListC.add(a);

            }
        } catch (SQLException e) {
            System.err.println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }

        return ListC;

    }

    public void updateCategory(int idCat, String nameCat) {
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET \n"
                + "      [CategoryName] = ?\n"
                + " WHERE CategoryID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, nameCat);
            st.setInt(2, idCat);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCategory(String name) {
        String sql = "INSERT INTO [dbo].[Category]\n"
                + "           ([CategoryName])\n"
                + "     VALUES(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<CategoryBookCount> getCategoryBookCounts() {
        String sql = "SELECT c.CategoryID, c.CategoryName, COUNT(b.BookID) AS BookCount "
                + "FROM [DB_PRJ301].[dbo].[Category] c "
                + "LEFT JOIN [DB_PRJ301].[dbo].[Book] b ON c.CategoryID = b.CategoryID "
                + "GROUP BY c.CategoryID, c.CategoryName "
                + "ORDER BY c.CategoryID;";
        List<CategoryBookCount> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                int bookCount = rs.getInt("BookCount");
                list.add(new CategoryBookCount(categoryID, categoryName, bookCount));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        CategoryDAO a = new CategoryDAO();
//        List<Category> list = a.getAllCatgory();
//        for (Category o : list) {
//            System.out.println(o);
//        }
        Category h = a.getCategoryById(1);
        System.out.println(a);
    }
}

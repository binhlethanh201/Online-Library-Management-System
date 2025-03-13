/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuatr
 */
public class CategoryBookCount {
    private int categoryID;
    private String categoryName;
    private int bookCount;

    public CategoryBookCount(int categoryID, String categoryName, int bookCount) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.bookCount = bookCount;
    }

    // Getters và setters
    public int getCategoryID() {
        return categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getBookCount() {
        return bookCount;
    }

    @Override
    public String toString() {
        return categoryName +" " +categoryID + " " +bookCount;
    }
    
}

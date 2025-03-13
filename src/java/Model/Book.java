/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Duc Long
 */
public class Book {
    private int BookID;
    private String BookName;
    private String Images;
    private String Author;
    private int PublisherID;
    private String PublisherName;
    private int CategoryID;
    private int PublishingYear;
    private String Description;

    public Book() {
    }

    public Book(int BookID, String BookName, String Images, String Author, int PublisherID, int CategoryID, int PublishingYear, String Description) {
        this.BookID = BookID;
        this.BookName = BookName;
        this.Images = Images;
        this.Author = Author;
        this.PublisherID = PublisherID;
        this.CategoryID = CategoryID;
        this.PublishingYear = PublishingYear;
        this.Description = Description;
    }

    public Book(int BookID, String BookName, String Images, String Author, int PublisherID, String PublisherName, int CategoryID, int PublishingYear, String Description) {
        this.BookID = BookID;
        this.BookName = BookName;
        this.Images = Images;
        this.Author = Author;
        this.PublisherID = PublisherID;
        this.PublisherName = PublisherName;
        this.CategoryID = CategoryID;
        this.PublishingYear = PublishingYear;
        this.Description = Description;
    }
    

    public String getPublisherName() {
        return PublisherName;
    }

    public void setPublisherName(String PublisherName) {
        this.PublisherName = PublisherName;
    }
    

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookName(String BookName) {
        this.BookName = BookName;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public int getPublisherID() {
        return PublisherID;
    }

    public void setPublisherID(int PublisherID) {
        this.PublisherID = PublisherID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getPublishingYear() {
        return PublishingYear;
    }

    public void setPublishingYear(int PublishingYear) {
        this.PublishingYear = PublishingYear;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "Book{" + "BookID=" + BookID + ", BookName=" + BookName + ", Images=" + Images + ", Author=" + Author + ", PublisherID=" + PublisherID + ", CategoryID=" + CategoryID + ", PublishingYear=" + PublishingYear + ", Description=" + Description + '}';
    }

    
    
   
   
}

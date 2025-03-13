/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Duc Long
 */
public class Borrow {

    private int borrowID;
    private int personID;
    private int bookID;
    private String bookName;
    private int amount;
    private Date borrowDate;
    private Date deadline;
    private Date returnDate;
    private String status;

    // Constructors

    public Borrow() {
    }

    public Borrow(int borrowID, int personID, int bookID, String bookName, int amount, Date borrowDate, Date deadline, Date returnDate, String status) {
        this.borrowID = borrowID;
        this.personID = personID;
        this.bookID = bookID;
        this.bookName = bookName;
        this.amount = amount;
        this.borrowDate = borrowDate;
        this.deadline = deadline;
        this.returnDate = returnDate;
        this.status = status;
    }

    public int getBorrowID() {
        return borrowID;
    }

    public void setBorrowID(int borrowID) {
        this.borrowID = borrowID;
    }

    public int getPersonID() {
        return personID;
    }

    public void setPersonID(int personID) {
        this.personID = personID;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Borrow{" + "borrowID=" + borrowID + ", personID=" + personID + ", bookID=" + bookID + ", bookName=" + bookName + ", amount=" + amount + ", borrowDate=" + borrowDate + ", deadline=" + deadline + ", returnDate=" + returnDate + ", status=" + status + '}';
    }
    
    
}

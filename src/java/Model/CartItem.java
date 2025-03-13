/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Duc Long
 */
public class CartItem {

    private Book book;
    private int amount;

    public CartItem(Book book, int amount) {
        this.book = book;
        this.amount = amount;
    }

    public Book getBook() {
        return book;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}

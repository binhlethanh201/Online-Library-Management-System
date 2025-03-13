/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Duc Long
 */
public class Card {
    private int CardID;
    private int PersonID;
    private String ValidFrom;
    private String ValidThru;

    public Card() {
    }

    public Card(int CardID, int PersonID, String ValidFrom, String ValidThru) {
        this.CardID = CardID;
        this.PersonID = PersonID;
        this.ValidFrom = ValidFrom;
        this.ValidThru = ValidThru;
    }

    public int getCardID() {
        return CardID;
    }

    public void setCardID(int CardID) {
        this.CardID = CardID;
    }

    public int getPersonID() {
        return PersonID;
    }

    public void setPersonID(int PersonID) {
        this.PersonID = PersonID;
    }

    public String getValidFrom() {
        return ValidFrom;
    }

    public void setValidFrom(String ValidFrom) {
        this.ValidFrom = ValidFrom;
    }

    public String getValidThru() {
        return ValidThru;
    }

    public void setValidThru(String ValidThru) {
        this.ValidThru = ValidThru;
    }

    @Override
    public String toString() {
        return "Card{" + "CardID=" + CardID + ", PersonID=" + PersonID + ", ValidFrom=" + ValidFrom + ", ValidThru=" + ValidThru + '}';
    }
    
}

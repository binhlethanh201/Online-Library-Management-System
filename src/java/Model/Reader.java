/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Duc Long
 */
public class Reader {
    private int PersonID;
    private String Name;
    private String Gender;
    private String DateOfBirth;
    private String StartDate;
    private String Address;
    private String Email;
    private String Phone;

    public Reader() {
    }

    public Reader(int PersonID, String Name, String Gender, String DateOfBirth, String StartDate, String Address, String Email, String Phone) {
        this.PersonID = PersonID;
        this.Name = Name;
        this.Gender = Gender;
        this.DateOfBirth = DateOfBirth;
        this.StartDate = StartDate;
        this.Address = Address;
        this.Email = Email;
        this.Phone = Phone;
    }

    public int getPersonID() {
        return PersonID;
    }

    public void setPersonID(int PersonID) {
        this.PersonID = PersonID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(String DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    @Override
    public String toString() {
        return "Reader{" + "PersonID=" + PersonID + ", Name=" + Name + ", Gender=" + Gender + ", DateOfBirth=" + DateOfBirth + ", StartDate=" + StartDate + ", Address=" + Address + ", Email=" + Email + ", Phone=" + Phone + '}';
    }

    


    
    
}

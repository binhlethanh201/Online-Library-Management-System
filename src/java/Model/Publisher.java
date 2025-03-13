/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Publisher {
//    	[PublisherID] [varchar](20) NOT NULL,
//	[PublisherName] [nvarchar](200) NOT NULL,
//	[Address] [nvarchar](200) NOT NULL,
//	[Website] [varchar](200) NOT NULL,
//	[Email] [varchar](100) NOT NULL,
//	[Phone] [varchar](15) NOT NULL,
    
    private int publisherID;
    private String publisherName;
    private String address;
    private String website;
    private String email;
    private String phone;

    public Publisher() {
    }

    public Publisher(int publisherID, String publisherName, String address, String website, String email, String phone) {
        this.publisherID = publisherID;
        this.publisherName = publisherName;
        this.address = address;
        this.website = website;
        this.email = email;
        this.phone = phone;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

   

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Publisher{" + "publisherID=" + publisherID + ", publisherName=" + publisherName + ", address=" + address + ", website=" + website + ", email=" + email + ", phone=" + phone + '}';
    }
    
    
    
}

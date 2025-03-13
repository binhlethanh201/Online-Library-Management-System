/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author vuatr
 */
public class StatusCount {
    private String status;
    private int count;

    public StatusCount(String status, int count) {
        this.status = status;
        this.count = count;
    }

    public String getStatus() {
        return status;
    }

    public int getCount() {
        return count;
    }
}


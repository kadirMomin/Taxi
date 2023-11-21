/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author hp
 */
public class Driver {

    int ID;
    String name;
    String password;
    String email;
    String phone;
    String plate;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public boolean AddUser() {
        String sql = "INSERT INTO `Drivers`(`ID`, `Name`, `Email`, `Password`, `Phone`, `Plate`) VALUES (NULL, '" + this.name + "', '" + this.email + "', '" + this.password + "', '" + this.phone + "', '" + this.plate + "')";
        if (!CheckUser(this.getEmail(), this.getPassword())) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/mydatabase/Calltaksi", "root", "");
                Statement stmt = con.createStatement();
                stmt.execute(sql);
                con.close();
            } catch (Exception e) {
                System.out.println("Bir hatayla karşılaşıldı \n" + e);
            }
            return true;
        } else {
            return false;
        }
    }

    private boolean CheckUser(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

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
    int avaible;
    String plate;

    public Driver(int ID, int avaible, String name, String plate) {
        this.ID = ID;
        this.avaible = avaible;
        this.name = name;
        this.plate = plate;
    }

    public Driver() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    

    public int getAvaible() {
        return avaible;
    }

    public void setAvaible(int avaible) {
        this.avaible = avaible;
    }

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

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    /*
    public boolean AddUser() {
        String sql = "INSERT INTO `Drivers`(`ID`, `drivername`, `Email`, `Password`, `Phone`, `Plate`) VALUES (NULL, '" + this.drivername + "', '" + this.phone + "', '" + this.plate + "')";

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

    }*/
    private boolean CheckUser(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

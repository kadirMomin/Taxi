/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

import java.sql.*;

/**
 *
 * @author hp
 */
public class Calls {

    int ID;
    String clientName;
    String address;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getLocation() {
        return address;
    }

    public void setLocation(String address) {
        this.address = address;
    }

    public void callTaxi(String name, String address, String dt) {
        String sql = "INSERT INTO `Calls`(`ID`, `ClientsName`, `address`, `Datetime`) VALUES(NULL, '" + name + "', '" + address + "', '" + dt + "')";
        System.out.println("sql = " + sql);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydatabase/Calltaksi", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public void addDriver(String dname, int id) {
        String sql = "UPDATE Calls SET DriversName='" + dname + "' WHERE ID=" + id;
        System.out.println("sql = " + sql);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydatabase/Calltaksi", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }
}

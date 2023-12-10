/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

/*import com.DriverManager;
import java.sql.*;*/
/**
 *
 * @author hp
 */
public class Calls {

    String clientName;
    String address;
    String Phone;
    private String assignedDriverName;

    public String getAssignedDriverName() {
        return this.assignedDriverName;
    }

    public void setAssignedDriverName(String name) {
        this.assignedDriverName = name;
    }

    public Calls(String clientName, String address, String phone) {
        this.clientName = clientName;
        this.address = address;
        this.Phone = phone;
    }

    public Calls() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
/*
    public void callTaxi(String ClientsName, String address, int Phone) {
        String sql = "INSERT INTO `calltaksi`(`ID`, `ClientsName`, `address`, `Phone`) VALUES(NULL, '" + ClientsName + "', '" + address + "', '" + Phone + "')";
        System.out.println("sql = " + sql);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydatabase/calltaksi", "root", "");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
    }*/
 /*
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
    }*/

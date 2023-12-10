/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;

import com.Calls;
import com.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDatabase {

    Connection con;

    public UserDatabase(Connection con) {
        this.con = con;
    }

    //for register user 
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into user(name,email,password) values(?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //user login
    public User logUser(String email, String pass) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setType(rs.getString("type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //for call user 
    public boolean saveCall(Calls call) {
        boolean set = false;
        try {
            // Insert register data to database
            String query = "INSERT INTO `calltaksi`(clientName, address, Phone) values(?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, call.getClientName());
            pt.setString(2, call.getAddress());
            pt.setString(3, call.getPhone());

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
        }
        return set;
    }

    public List<Calls> getAllCalls() {
        List<Calls> callsList = new ArrayList<>();
        try {
            String query = "SELECT * FROM calltaksi";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                Calls call = new Calls(rs.getString("clientName"), rs.getString("address"), rs.getString("Phone"));
                callsList.add(call);
            }
        } catch (SQLException e) {
            // Hata yönetimi
            System.err.println("lütfen bir hata oluştu bir kontrol ediniz!!! ");
        }
        return callsList;
    }

    public Driver assignDriverToCall(Calls call) {

        Driver assignedDriver = null;
        try {
            // Müsait olan ilk sürücüyü seç
            String query = "SELECT * FROM driver WHERE avaible = 0 LIMIT 1";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                assignedDriver = new Driver(rs.getInt("id"), rs.getInt("avaible"), rs.getString("name"), rs.getString("plate"));
                // Sürücüyü meşgul olarak işaretle
                String updateQuery = "UPDATE driver SET avaible = 1 WHERE id = ?";
                PreparedStatement updatePst = this.con.prepareStatement(updateQuery);
                updatePst.setInt(1, assignedDriver.getID());
                updatePst.executeUpdate();
            }
           /* if (assignedDriver != null) {
                call.setAssignedDriverName(assignedDriver.getName());
            }
            return assignedDriver;*/
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return assignedDriver;
    }

    // for Assign driver when a user receives a call
    /* public Driver getAvailableDriver() {
        Driver driver = null;
        try {
            String query = "SELECT * FROM driver";
            PreparedStatement pst = this.con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                if (rs.getInt("avaible") == 0) {
                    driver = new Driver(rs.getInt("id"), rs.getInt("avaible"), rs.getString("name"), rs.getString("plate"));
                    // Sürücüyü müsait olmayan olarak işaretle
                    String updateQuery = "UPDATE driver SET avaible = 1 WHERE id = ?";
                    PreparedStatement updatePst = this.con.prepareStatement(updateQuery);
                    updatePst.setInt(0, driver.getID());
                    updatePst.executeUpdate();
                    break; // Müsait sürücü bulunduğunda döngüden çık
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return driver;
    }*/
    public List<Driver> getAllDrivers() {
        List<Driver> driverList = new ArrayList<>();
        String sql = "SELECT * FROM driver"; 

        try (PreparedStatement pst = con.prepareStatement(sql); ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                // Sürücü nesnesini oluştur ve doldur
                Driver driver = new Driver();
                driver.setName(rs.getString("name"));
                driver.setPlate(rs.getString("plate"));
                driver.setAvaible(rs.getInt("avaible"));

                driverList.add(driver);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Hata durumunda hata bilgilerini yazdır
        }

        return driverList;
    }

}

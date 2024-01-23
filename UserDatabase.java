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

    public boolean validateDriver(String name, String plate) {
        try {
            String query = "SELECT * FROM driver WHERE name=? AND plate=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, plate);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                return true; // Eşleşme var
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Eşleşme yok
        
    }



    public boolean isExistingUser(String email) {
        try {
            // Veritabanınıza bağlanın (bu örnek için "con" adında bir Connection değişkeni varsayalım)

            String query = "SELECT COUNT(*) FROM user WHERE email = ?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            int count = 0;
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }

            return count > 0; // Eğer count 0'dan büyükse, e-posta var demektir.

        } catch (SQLException e) {
            e.printStackTrace(); // Hata durumunda hata bilgilerini yazdırabilirsiniz.
            return false; // Bir hata oluştuğunda false döndürülebilir.
        }
    }
       public boolean updateDriverAvailabilityToZero(int driverID) {
    try {
        String query = "UPDATE driver SET avaible = 0 WHERE id = ?";
        PreparedStatement pst = this.con.prepareStatement(query);
        pst.setInt(1, driverID);
        int rowsUpdated = pst.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}

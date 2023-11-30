<%-- 
    Document   : callredirect
    Created on : Nov 22, 2023, 2:37:56 PM
    Author     : hp
--%>

<%@page import="com.Calls"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="com.sun.jdi.connect.spi.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con;
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydatabase ", "root", " ");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM `Users`  WHERE `Email` LIKE '" + email + "'");
            while (rs.next()) {
               
                String fullname = rs.getString("clientName");
                String address = rs.getString("address");
                int Phone = rs.getInt("Phone");
                session.setAttribute("clientName", fullname);
                session.setAttribute("address", address);
                session.setAttribute("Phone", Phone);

                Calls newCall = new Calls();

                newCall.callTaxi(fullname, address, Phone);

                response.sendRedirect(request.getContextPath() + "/displaycalls.jsp");
            }
        %>
    </body>
</html>

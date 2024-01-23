/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackage;

import com.Calls;
import com.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class CallServet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @return
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kullanıcı giriş yapmış, işlemlere devam et
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // HTML başlangıcı ve başlık
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CallServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // Formdan veri al
            String clientName = request.getParameter("clientName");
            String address = request.getParameter("address");
            String phone = request.getParameter("Phone");
            if (clientName.isEmpty() || address.isEmpty() || phone.isEmpty()) {
                out.println("<script>alert('Lütfen tüm alanları doldurun.'); window.history.back();</script>");
            } else {
                // Calls nesnesi oluştur
                Calls call = new Calls(clientName, address, phone);
                if (call.isNumeric(phone)) {
                    // Veritabanı bağlantısı ve sürücü atama
                    UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());
                    Driver assignedDriver = regUser.assignDriverToCall(call);

                    if (assignedDriver != null) {
                        regUser.saveCall(call);
                        String driverInfo = "Sürücü atandı: " + assignedDriver.getName() + ", Plaka: " + assignedDriver.getPlate() + " yolda";
                        request.getSession().setAttribute("assignedDriverInfo", driverInfo);

                        request.getSession().setAttribute("assignedCustomerName", call.getClientName());
                        request.getSession().setAttribute("assignedCustomerAddress", call.getAddress());
                        request.getSession().setAttribute("assignedCustomerPhone", call.getPhone());
                        response.sendRedirect("Taxicall.jsp");
                    } else {
                        out.println("<script>alert('Boş sürücümüz yok.'); window.history.back();</script>");
                    }
                } else {
                    out.println("<script>alert('Telefon sadece rakam içermelidir.'); window.history.back();</script>");
                }
            }

            out.println("</body>");
            out.println("</html>");
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

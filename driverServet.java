/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackage;

import com.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class driverServet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet driverServet</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("name");
            String plate = request.getParameter("plate");
            boolean isValidInput = !(name.trim().isEmpty() || plate.trim().isEmpty()); // Boşluk kontrolü

            if (isValidInput) {
                UserDatabase userDb = new UserDatabase(ConnectionPro.getConnection());
                boolean isValidDriver = userDb.validateDriver(name, plate);
                if (isValidDriver) {
                    // Kullanıcı giriş yapıldığında veya kullanıcı türü belirlendiğinde
                    String userType = "driver"; // veya "user" olarak belirlenmesi gereken kullanıcı tipi
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("userType", userType);
                    
                    HttpSession session = request.getSession(true);
                    session.setAttribute("isValidDriver", isValidDriver);
                    // Çerez oluştur
                    Cookie driverCookie = new Cookie("driverCookie", "validDriver");
                    // Çerezin ömrünü ayarla (örneğin, 1 saat)
                    driverCookie.setMaxAge(3600);
                    // Çerezi yanıtta gönder
                    response.addCookie(driverCookie);
                    // out.println("<script>alert('Başarılı giriş!');</script>");
                    out.println("<script>alert('Başarılı giriş!'); window.location.href='Driver.jsp';</script>");// Eşleşme varsa Driver sayfasına yönlendir
                } else {
                    out.println("<script>alert('Geçersiz sürücü bilgileri. Lütfen doğru bilgileri girin.'); window.location.href='Driverlogin.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Boşluk veya yanlış giriş! Lütfen tüm alanları doldurun.'); window.location.href='Driverlogin.jsp';</script>");

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
        processRequest(request, response);
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

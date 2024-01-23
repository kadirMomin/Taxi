/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String lEmail = request.getParameter("email");
            String lPass = request.getParameter("password");

            UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
            User user = db.logUser(lEmail, lPass);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // Boşlukları temizle
            lEmail = lEmail.trim();

            // E-posta formatını kontrol et
            boolean isValidEmail = isValidEmailAddress(lEmail);
            // Eğer e-posta formatı doğruysa ve kullanıcı adı ve şifre doğruysa
            if (!lEmail.isEmpty() && isValidEmail && lEmail.equals("user") && lPass.equals("password")) {

                // Kullanıcı doğrulandı, çerez oluştur ve kullanıcı bilgilerini içine yerleştir
                Cookie userCookie = new Cookie("user", lEmail);
                userCookie.setMaxAge(24 * 60 * 60); // Çerezin ömrü 24 saat
                response.addCookie(userCookie);
                // Başarılı giriş durumunu gönder              
                out.println("<script>alert('Başarılı giriş!'); window.location.href='index.jsp';</script>");
            } else {
                // Geçersiz giriş durumunu gönder
                request.setAttribute("result", "failure");
            }
            if (lEmail.length() <= 45 && lPass.length() <= 45) {
                if (user != null) {
                    // Kullanıcı doğrulandı, çerez oluştur ve kullanıcı bilgilerini içine yerleştir
                    Cookie userCookie = new Cookie("user", lEmail);
                    userCookie.setMaxAge(24 * 60 * 60); // Çerezin ömrü 24 saat
                    response.addCookie(userCookie);

                    response.sendRedirect("index.jsp");
                } else {
                    // Geçersiz giriş
                    boolean isValidUser = false;
                    if (!isValidUser) {
                        String messagebilgi = "Geçersiz kimlik bilgileri veya kayıtlı kullanıcı yok.";
                        request.setAttribute("loginError", messagebilgi);
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    }
                }
            } else {
                // Girişlerin herhangi biri 45 karakterden fazlaysa, hata mesajı ver ve giriş sayfasına yönlendir
                String messageKarkter = "Girişler 45 karakterden uzun olmamalıdır.";
                request.setAttribute("loginError", messageKarkter);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
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

    private boolean isValidEmailAddress(String email) {
        // E-posta adresinin basit bir kontrolü - içinde @ sembolü olmalı
        return email.contains("@");
    }

}

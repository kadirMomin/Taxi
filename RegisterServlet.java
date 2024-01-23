/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Alanların maksimum uzunluk kontrolü (45 karakter)
            if (name.length() > 45 || email.length() > 45 || password.length() > 45) {
                String errorMessage = "Alanlar en fazla 45 karakter olmalıdır.";
                request.setAttribute("RegError", errorMessage);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
                return;
            }

            // Boş alan kontrolü
            if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
                String errorMessage = "Lütfen tüm alanları doldurun.";
                request.setAttribute("RegError", errorMessage);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
                return;
            }

            // Email format kontrolü
            if (!isValidEmail(email) || email.contains(" ")) {
                String errorMessage = "Geçersiz e-posta formatı veya boşluk içeremez.";
                request.setAttribute("RegError", errorMessage);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
                return;
            }
            //make user object
            User userModel = new User(name, email, password);
            //create a database model
            UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());
            if (regUser.saveUser(userModel)) {
                // Başarılı giriş durumunu gönder
                out.println("<script>alert('Başarılı kayıt!'); window.location.href='login.jsp';</script>");
                // Oturumu geçersiz kıl
                HttpSession session = request.getSession();
                session.invalidate();
            } else {
                String errorMessage = "User Available";
                HttpSession regSession = request.getSession();
                regSession.setAttribute("RegError", errorMessage);
                response.sendRedirect("registration.jsp");
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

    public boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."
                + "[a-zA-Z0-9_+&*-]+)*@"
                + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
                + "A-Z]{2,7}$";

        return email.matches(emailRegex);
    }

}

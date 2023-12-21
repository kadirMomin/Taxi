<%-- 
    Document   : logout
    Created on : Nov 22, 2023, 2:20:52 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% // Oturumu sonlandırma
            session.invalidate();

            // Çerezleri sonlandırma
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }

            // Belirtilen sayfaya yönlendirme
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessionS = request.getSession(false);
        sessionS.invalidate();
        Cookie cookie = new Cookie("Username", "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        response.sendRedirect("index.jsp");
    }
}

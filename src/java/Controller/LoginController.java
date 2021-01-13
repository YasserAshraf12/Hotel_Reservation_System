package Controller;

import Models.UserType;
import Models.Users;
import Services.UsersServices.UserServiceImpl;
import Services.UsersServices.UsersService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Gson gson = new Gson(); 
        JsonObject json = new JsonObject();
        PrintWriter out = response.getWriter();
        Item item = null;
        
        String page = null;
        if((username.trim().length() >= 0) && (username != null) && (password.trim().length() >= 0) && (password != null)) {
            UsersService loginService = new UserServiceImpl();
            boolean flag = loginService.login(username, password);

            if(flag) {
                HttpSession sessionS = request.getSession(true);
                Users user = loginService.selectByUsername(username);
                
                request.setAttribute("Username", username);
                request.setAttribute("UserID", user.getUserId());
                sessionS.setAttribute("UserID", user.getUserId());
                Cookie cookie = new Cookie("Username", (user.getUserUserName()).toString());
                response.addCookie(cookie);
                UserType usertype = user.getUserType();
                if(usertype.getTypeId() == 1){
                    page = "/Hotel_Reservation_System/JSP/admin/dashboard.jsp";
                }else{
                    page = "/Hotel_Reservation_System/JSP/client/home.jsp";
                    
                }
                item = new Item(true, "Login Success", page);
            } else {
                page = "/Hotel_Reservation_System/JSP/userLogin.jsp";
                item = new Item(false, "Invalid Username or Password.", page);
            }
            JsonElement element = gson.toJsonTree(item);
            json.add("item", element);
        }
        out.write(json.toString());
        out.flush(); 
    }
    private class Item {
        boolean status;
        String message;
        String redirect;
        
        public Item(){
            status = true;
            message = "";
            redirect = "";
        }
        
        public Item(boolean status, String msg, String redirect){
            this.status = status;
            this.message = msg;
            this.redirect = redirect;
        }
    }
}

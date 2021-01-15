package Controller;

import JavaMailUtil.JavaMailUtil;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendMail")
public class sendMail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String msg = request.getParameter("msg");
        
        
        JavaMailUtil javaMail = new JavaMailUtil();
        String htmlCode = "<h1>" + fname + "</h1>" + "<p>" + msg + "</p>" + "<br>" + "<small>Contact Me: " + phone + "</small>";
        javaMail.sendMail(email, password, htmlCode);
        
        Gson gson = new Gson(); 
        JsonObject json = new JsonObject();
        PrintWriter out = response.getWriter();
        MailResponse mail= new MailResponse(true);
        JsonElement element = gson.toJsonTree(mail);
        json.add("mail", element);
        out.write(json.toString());
        out.flush();
    }
    
    private class MailResponse{
        boolean status;

        public MailResponse() {
        }

        public MailResponse(boolean status) {
            this.status = status;
        }
        
    }
}

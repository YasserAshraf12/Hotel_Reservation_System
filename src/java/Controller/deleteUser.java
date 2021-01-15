/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Services.UsersServices.UserServiceImpl;
import Services.UsersServices.UsersService;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Top
 */
public class deleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        UsersService userService = new UserServiceImpl();
        PrintWriter out = response.getWriter();
        JsonObject json = new JsonObject();
        
        if(userService.deleteUser(Integer.parseInt(id))){
            json.addProperty("status", Boolean.TRUE);
        }else{
            json.addProperty("status", Boolean.FALSE);
        }
        out.write(json.toString());
    }

}

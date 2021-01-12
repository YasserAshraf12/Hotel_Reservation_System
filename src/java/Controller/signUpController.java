package Controller;

import Models.City;
import Models.Country;
import Models.UserType;
import Models.Users;
import Services.CityServices.CityService;
import Services.CityServices.CityServiceImpl;
import Services.CountryServices.CountryService;
import Services.CountryServices.CountryServiceImpl;
import Services.UserTypeServices.UserTypeServices;
import Services.UserTypeServices.UserTypeServicesImpl;
import Services.UsersServices.UserServiceImpl;
import Services.UsersServices.UsersService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class signUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signUpController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String age = request.getParameter("age");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        
        UserTypeServices userTypeService = new UserTypeServicesImpl();
        CityService cityService = new CityServiceImpl();
        CountryService countryServices = new CountryServiceImpl();
        
        
        
        UserType userType = userTypeService.selectById(2);
        City cityData = cityService.selectByCityCode(city);
        Country countryData = countryServices.selectByCountryCode(country);
        
        Users user = new Users(cityData, countryData, userType, fname, lname, email, Integer.parseInt(age), username, getAlphaNumericString(10), 'N');
        UsersService userServices = new UserServiceImpl();
        
        if(userServices.registration(user)){
            response.sendRedirect("/userLogin.jsp");
        }else{ 
            PrintWriter out = response.getWriter();
            out.write("<script>alert('Username already exists');" + "setTimeout(function(){window.location = '/Hotel_Reservation_System/JSP/userSignUp.jsp'},2000);" + "</script>");
        }
    }
    
    public static String getAlphaNumericString(int n)
    {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz"; 
        StringBuilder sb = new StringBuilder(n); 
        for (int i = 0; i < n; i++) { 
            int index = (int)(AlphaNumericString.length() * Math.random()); 
            sb.append(AlphaNumericString.charAt(index)); 
        } 
        return sb.toString(); 
    }
 

}

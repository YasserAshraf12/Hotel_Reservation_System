package Controller;

import static Controller.signUpController.getAlphaNumericString;
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
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editProfileData extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String username = request.getParameter("userName");
        String email = request.getParameter("userEmail");
        String phone = request.getParameter("phoneNum");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String country = request.getParameter("countrySelect");
        String city = request.getParameter("citySelect");
        String photo = request.getParameter("customFile");
        String address = request.getParameter("address");
        HttpSession sessionS = request.getSession(false);
        Integer userID = (Integer) sessionS.getAttribute("UserID");

        UserTypeServices userTypeService = new UserTypeServicesImpl();
        CityService cityService = new CityServiceImpl();
        CountryService countryServices = new CountryServiceImpl();
        UsersService userServices = new UserServiceImpl();

        boolean status;
        Gson gson = new Gson(); 
        JsonObject json = new JsonObject();

        UserType userType = userTypeService.selectById(1);
        City cityData = cityService.selectByCityCode(city);

        Country countryData = countryServices.selectByCountryCode(country);

        Users user = new Users(cityData, countryData, userType, fname, lname, "", Integer.parseInt(age), username, password, 'Y');
         PrintWriter out = response.getWriter();
         aya a;
//         aya a = new aya(false);
        if (userServices.updateUser(user)) {
//             PrintWriter out = response.getWriter();
             a=new aya(true);
//         status= true;
//            out.write(1);
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Profile Updated');");
            
//            out.println("location='/editProfile.jsp';");
//            out.println("</script>");
        } else {
             a=new aya(false);
//            status= false;
//             out.write(0);
//            PrintWriter out = response.getWriter();
//            out.write("<script>alert('Profile Updation Failed');");
        }

        JsonElement element = gson.toJsonTree(a);
          json.add("a", element);

//        json.addProperty("status", status);
        out.write(json.toString());
        out.flush();
    }

    private class aya{
    
    boolean status;

        public aya() {
        }

        public aya(boolean status) {
            this.status = status;
        }

        public boolean isStatus() {
            return status;
        }

        public void setStatus(boolean status) {
            this.status = status;
        }
    
    
    
    }
    
}

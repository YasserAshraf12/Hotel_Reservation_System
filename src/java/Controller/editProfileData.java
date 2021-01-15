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
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
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
        
         PrintWriter out = response.getWriter();
         UpdateResult uR;
        
        UserTypeServices userTypeService = new UserTypeServicesImpl();
        CityService cityService = new CityServiceImpl();
        CountryService countryServices = new CountryServiceImpl();
        UsersService userServices = new UserServiceImpl();

        Users tUser = userServices.selectByID(userID);

        Gson gson = new Gson(); 
        JsonObject json = new JsonObject();

        UserType userType = tUser.getUserType();
        City cityData = cityService.selectByCityCode(city);
        Country countryData = countryServices.selectByCountryCode(country);

        Users user = new Users(cityData, countryData, userType, fname, lname, "", Integer.parseInt(age), username,  password, 'Y');
        if(phone == null){
            phone = tUser.getUserTelefone();
            user.setUserTelefone(phone);
        }else
            user.setUserTelefone(phone);
        
         if(photo == null){
            photo = tUser.getUserProfilePhoto();
            user.setUserProfilePhoto(photo);
         }else
             user.setUserProfilePhoto(photo);
        
         if(address == null){
             address = tUser.getUserAddress();
             user.setUserAddress(address);
         }else
             user.setUserAddress(address);
         
        
        if (userServices.updateUser(user)) 
             uR =new UpdateResult(true, userType.getTypeId());
         else 
             uR =new UpdateResult(false, userType.getTypeId());

        JsonElement element = gson.toJsonTree(uR);
          json.add("a", element);

        out.write(json.toString());
        out.flush();
    }

    public class UpdateResult{
    
        public boolean status;
        public Integer type;

        public UpdateResult() {}
        
        public UpdateResult(boolean status, Integer type) {this.status = status; this.type = type;}
    }
}

package Controller;

import Models.Booking;
import Models.BookingStatus;
import Models.City;
import Models.Country;
import Models.Rooms;
import Models.UserType;
import Models.Users;
import Services.BookingServices.BookingService;
import Services.BookingServices.BookingServicesImpl;
import Services.CityServices.CityService;
import Services.CityServices.CityServiceImpl;
import Services.CountryServices.CountryService;
import Services.CountryServices.CountryServiceImpl;
import Services.UserTypeServices.UserTypeServices;
import Services.UserTypeServices.UserTypeServicesImpl;
import Services.UsersServices.UserServiceImpl;
import Services.UsersServices.UsersService;
import Services.roomServices.RoomService;
import Services.roomServices.RoomServiceImpl;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class makeReservation extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//String sDate1="31/12/1998"
//        
//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//LocalDate startDate_new = LocalDate.parse(startDate, dtf);
//LocalDate endDate_new = LocalDate.parse(endDate, dtf);
// int duration = Period.between(startDate_new.toLocalDate(),  endDate_new.toLocalDate()).getDays();
        String roomID = request.getParameter("roomid");
//        String hotelID = request.getParameter("hotelid");
        String toDate = request.getParameter("todate");
        String fromDate = request.getParameter("fromdate");
        Date startDate;
        Date endDate;

        try {
            startDate = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
            endDate = new SimpleDateFormat("yyyy-MM-dd").parse(toDate);

            HttpSession sessionS = request.getSession(false);
            Integer userID = (Integer) sessionS.getAttribute("UserID");

            PrintWriter out = response.getWriter();

            BookingService bookingService = new BookingServicesImpl();
            RoomService roomService = new RoomServiceImpl();
            UsersService userServices = new UserServiceImpl();
            

            Users user = userServices.selectByID(userID);
            Rooms room = roomService.selectRoomByID(Integer.parseInt(roomID));
            BookingStatus bookingStatus = new BookingStatus("P");

        JsonObject json = new JsonObject();

            Booking booking = new Booking(bookingStatus, room, user, startDate, endDate);
            if(bookingService.makeReservation(booking)) {

            json.addProperty("a","Booking Done successfully");

             
      
        }
            else{
                     json.addProperty("a","Booking Failed");
            }
        out.write(json.toString());
        out.flush();
         
        }
        
    
    catch (ParseException ex) {
             Logger.getLogger(makeReservation.class.getName()).log(Level.SEVERE, null, ex);
    }
    }
}

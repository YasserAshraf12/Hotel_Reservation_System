
package Controller;

import Services.BookingServices.BookingService;
import Services.BookingServices.BookingServicesImpl;
import Services.HotelServices.HotelService;
import Services.HotelServices.HotelServiceImpl;
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


public class dataCheck extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet dataCheck</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsersService userService = new UserServiceImpl();
        BookingService bookingService = new BookingServicesImpl();
        HotelService hotelService = new HotelServiceImpl();
        
        Gson gson = new Gson(); 
        JsonObject json = new JsonObject();
        PrintWriter out = response.getWriter();
        Data data = null;
        
        Long nOfUsers = userService.countUsers();
        Long nOfBookings = bookingService.countBooking();
        Long nOfHotels = hotelService.countHotels();
        data = new Data(nOfUsers, nOfHotels, nOfBookings);
        JsonElement element = gson.toJsonTree(data);
        json.add("data", element);
        out.write(json.toString());
        out.flush();
    }

    
    private class Data{
        private Long x1;
        private Long x2;
        private Long x3;

        public Data() {
            this.x1 = 0L;
            this.x2 = 0L;
            this.x3 = 0L;
        }

        public Data(Long x1, Long x2, Long x3) {
            this.x1 = x1;
            this.x2 = x2;
            this.x3 = x3;
        }
    }
}

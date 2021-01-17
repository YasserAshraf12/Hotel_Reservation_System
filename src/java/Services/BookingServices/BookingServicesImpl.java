package Services.BookingServices;

import Dao.BookingDao.BookingDao;
import Dao.BookingDao.BookingDaoImpl;
import Models.Booking;
import java.util.List;



public class BookingServicesImpl implements BookingService{

    BookingDao bookingDao = new BookingDaoImpl();
    
    @Override
    public Long countBooking() {
        return bookingDao.countBookings();
    }
   
    @Override
     public boolean makeReservation(Booking booking) {
          
        return bookingDao.makeReservation(booking);

    }
    @Override
    public List<Booking> getReservation(Integer id){
      
        return bookingDao.getReservation(id);
      
      }
     
}

package Services.BookingServices;

import Dao.BookingDao.BookingDao;
import Dao.BookingDao.BookingDaoImpl;
import Models.Booking;



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

}

package Services.BookingServices;

import Dao.BookingDao.BookingDao;
import Dao.BookingDao.BookingDaoImpl;


public class BookingServicesImpl implements BookingService{

    BookingDao bookingDao = new BookingDaoImpl();
    
    @Override
    public Long countBooking() {
        return bookingDao.countBookings();
    }
    
}

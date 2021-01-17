package Dao.BookingDao;

import Models.Booking;
import java.util.List;


public interface BookingDao {
    public Long countBookings();
    public boolean makeReservation(Booking booking);
    List<Booking> getReservation(Integer id);
}

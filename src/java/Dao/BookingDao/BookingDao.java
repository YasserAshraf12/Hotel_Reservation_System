package Dao.BookingDao;

import Models.Booking;


public interface BookingDao {
    public Long countBookings();
    public boolean makeReservation(Booking booking);
}

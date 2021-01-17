package Services.BookingServices;

import Models.Booking;
import Models.Rooms;
import java.util.List;


public interface BookingService {
    public Long countBooking();
    public boolean makeReservation(Booking booking);
    public List<Booking> getReservation(Integer id);
}

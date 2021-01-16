package Services.BookingServices;

import Models.Booking;
import Models.Rooms;


public interface BookingService {
    public Long countBooking();
    public boolean makeReservation(Booking booking);
}

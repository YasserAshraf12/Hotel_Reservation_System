package Services.HotelServices;

import Models.Hotels;
import java.util.List;


public interface HotelService {
    public Long countHotels();
    public List<Hotels> selectHotels();
}

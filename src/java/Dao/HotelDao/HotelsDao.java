package Dao.HotelDao;

import Models.Hotels;
import java.util.List;


public interface HotelsDao {
    public Long countHotels();
    public List<Hotels> selectHotels();
}

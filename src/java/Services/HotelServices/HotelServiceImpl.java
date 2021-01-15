package Services.HotelServices;

import Dao.HotelDao.HotelsDao;
import Dao.HotelDao.HotelsDaoImpl;
import Models.Hotels;
import java.util.List;


public class HotelServiceImpl implements HotelService{

    HotelsDao hotelDao = new HotelsDaoImpl();
    
    @Override
    public Long countHotels() {
        return hotelDao.countHotels();
    }

    @Override
    public List<Hotels> selectHotels() {
        return hotelDao.selectHotels();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.HotelServices;

import Dao.HotelDao.HotelsDao;
import Dao.HotelDao.HotelsDaoImpl;

/**
 *
 * @author Top
 */
public class HotelServiceImpl implements HotelService{

    HotelsDao hotelDao = new HotelsDaoImpl();
    
    @Override
    public Long countHotels() {
        return hotelDao.countHotels();
    }
    
}

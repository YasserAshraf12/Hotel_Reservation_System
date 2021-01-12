package Services.CityServices;

import Dao.CityDao.CityDao;
import Dao.CityDao.CityDaoImpl;
import Models.City;
import java.util.List;

public class CityServiceImpl implements CityService{

    CityDao cityDao = new CityDaoImpl();
    @Override
    public List<City> selectCities(String countryID) {
        return cityDao.selectCities(countryID);
    }

    @Override
    public City selectByCityCode(String cityCode) {
        return cityDao.selectByCityCode(cityCode);
    }
    
}

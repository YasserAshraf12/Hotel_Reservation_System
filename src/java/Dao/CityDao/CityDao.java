package Dao.CityDao;

import Models.City;
import java.util.List;

public interface CityDao {
    public List<City> selectCities(String countryID);
    public City selectByCityCode(String cityCode);
}

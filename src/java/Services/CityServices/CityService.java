package Services.CityServices;

import Models.City;
import java.util.List;

public interface CityService {
    public List<City> selectCities(String countryID);
    public City selectByCityCode(String cityCode);
}

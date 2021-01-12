package Dao.CountryDao;

import Models.Country;
import java.util.List;


public interface CountryDao {
    public List<Country> selectCountries();
    public Country selectByCountryCode(String countryCode);
}

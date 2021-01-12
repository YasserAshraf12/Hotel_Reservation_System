package Services.CountryServices;

import Models.Country;
import java.util.List;

public interface CountryService {
    public List<Country> selectCountries();
    public Country selectByCountryCode(String countryCode);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.CountryServices;

import Dao.CountryDao.CountryDao;
import Dao.CountryDao.CountryDaoImpl;
import Models.Country;
import java.util.List;

/**
 *
 * @author Top
 */
public class CountryServiceImpl implements CountryService{

    CountryDao countryDao = new CountryDaoImpl();
    
    @Override
    public List<Country> selectCountries() {
        return countryDao.selectCountries();
    }

    @Override
    public Country selectByCountryCode(String countryCode) {
        return countryDao.selectByCountryCode(countryCode);
    }
    
}

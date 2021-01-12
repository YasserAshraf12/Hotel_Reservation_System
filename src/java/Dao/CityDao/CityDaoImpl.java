package Dao.CityDao;

import Models.City;
import Models.Country;
import Models.Users;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class CityDaoImpl implements CityDao{

    @Override
    public List<City> selectCities(String countryID) {
        Session session = HibernateUtil.getSession();
        List<City> list = new ArrayList<>();
        if (session != null) {
            Transaction tx = session.beginTransaction();
            String hql = "FROM City C WHERE C.country.countryCode =(:Country_Code)";
            Query query = session.createQuery(hql);
            query.setParameter("Country_Code", countryID);
            list = new ArrayList();
            for(final Object o : query.list()) {
                list.add((City)o);
            }
            return list;
        }
        return null;
    }

    @Override
    public City selectByCityCode(String cityCode) {
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            City city = (City) session.get(City.class, cityCode);
            if(city != null)
                return city;
            return null;
        }
        return null;
    }
    
}

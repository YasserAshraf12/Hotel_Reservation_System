package Dao.CountryDao;

import Models.City;
import Models.Country;
import Models.Users;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CountryDaoImpl implements CountryDao{

    @Override
    public List<Country> selectCountries() {
        Session session = HibernateUtil.getSession();
        List<Country> list;
        if(session != null){
            Transaction tx = session.beginTransaction();
            String hql = "FROM Country";
            Query query = session.createQuery(hql);
            list = new ArrayList();
            for(final Object o : query.list()) {
                list.add((Country)o);
            }
            return list;
        }
        return null;
    }

    @Override
    public Country selectByCountryCode(String countryCode) {
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Country country = (Country) session.get(Country.class, countryCode);
            if(country != null)
                return country;
            return null;
        }
        return null;
    }
    
}

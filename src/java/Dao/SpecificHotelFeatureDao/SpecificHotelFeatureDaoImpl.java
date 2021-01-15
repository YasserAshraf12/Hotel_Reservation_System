package Dao.SpecificHotelFeatureDao;

import Models.SpecificHotelFeature;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


public class SpecificHotelFeatureDaoImpl implements SpecificHotelFeatureDao{

    @Override
    public List<SpecificHotelFeature> getHotelFeatures(Integer Id) {
            Session session = HibernateUtil.getSession();
            List list;
            if (session != null) {
                String hql = "From SpecificHotelFeature F WHERE F.hotels.hotelId= :id";
                Query query = session.createQuery(hql);
                query.setParameter("id", Id);
                list = new ArrayList();
                for(final Object o : query.list()) {
                    list.add((SpecificHotelFeature)o);
                }
                return list;
            }
            return null;
    }
    
}

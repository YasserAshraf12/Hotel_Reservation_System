package Dao.hotelFeaturesDao;

import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Session;


public class hotelFeatureDaoImpl implements hotelFeaturesDao{

    @Override
    public List<String> getHotelFeatures(Integer Id) {
        Session session = HibernateUtil.getSession();
            List list;
            if (session != null) {
                String hql = "From SpecificHotelFeature F WHERE F.hotels.hotelId= :id";
                
            }
            return null;
            
    }
    
}

package Services.SpecifichotelFeaturesServices;

import Dao.SpecificHotelFeatureDao.SpecificHotelFeatureDao;
import Dao.SpecificHotelFeatureDao.SpecificHotelFeatureDaoImpl;
import Models.SpecificHotelFeature;
import java.util.List;


public class SpecificHotelFeaturesServiceImpl implements SpecificHotelFeatureService{

    SpecificHotelFeatureDao spHFDao = new SpecificHotelFeatureDaoImpl();
    
    @Override
    public List<SpecificHotelFeature> getHotelFeatures(Integer id) {
        return spHFDao.getHotelFeatures(id);
    }
    
}

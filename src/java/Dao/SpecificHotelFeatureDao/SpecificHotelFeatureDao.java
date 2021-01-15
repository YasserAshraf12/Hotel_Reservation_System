package Dao.SpecificHotelFeatureDao;

import Models.SpecificHotelFeature;
import java.util.List;


public interface SpecificHotelFeatureDao {
    public List<SpecificHotelFeature>getHotelFeatures(Integer Id);
}

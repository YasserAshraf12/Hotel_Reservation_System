package Services.SpecifichotelFeaturesServices;

import Models.SpecificHotelFeature;
import java.util.List;


public interface SpecificHotelFeatureService {
    public List<SpecificHotelFeature> getHotelFeatures(Integer id);
}

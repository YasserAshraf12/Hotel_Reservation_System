package Models;

import java.util.HashSet;
import java.util.Set;

public class HotelFeatures  implements java.io.Serializable {


     private String featureCode;
     private String featureCodeDescription;
     private Set specificHotelFeatures = new HashSet(0);

    public HotelFeatures() {
    }

	
    public HotelFeatures(String featureCode) {
        this.featureCode = featureCode;
    }
    public HotelFeatures(String featureCode, String featureCodeDescription, Set specificHotelFeatures) {
       this.featureCode = featureCode;
       this.featureCodeDescription = featureCodeDescription;
       this.specificHotelFeatures = specificHotelFeatures;
    }
   
    public String getFeatureCode() {
        return this.featureCode;
    }
    
    public void setFeatureCode(String featureCode) {
        this.featureCode = featureCode;
    }
    public String getFeatureCodeDescription() {
        return this.featureCodeDescription;
    }
    
    public void setFeatureCodeDescription(String featureCodeDescription) {
        this.featureCodeDescription = featureCodeDescription;
    }
    public Set getSpecificHotelFeatures() {
        return this.specificHotelFeatures;
    }
    
    public void setSpecificHotelFeatures(Set specificHotelFeatures) {
        this.specificHotelFeatures = specificHotelFeatures;
    }




}



package Models;
// Generated Jan 4, 2021 6:34:40 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;


public class City  implements java.io.Serializable {


     private String cityCode;
     private Country country;
     private String cityName;
     private Set userses = new HashSet(0);

    public City() {
    }

	
    public City(String cityCode) {
        this.cityCode = cityCode;
    }
    public City(String cityCode, Country country, String cityName, Set userses) {
       this.cityCode = cityCode;
       this.country = country;
       this.cityName = cityName;
       this.userses = userses;
    }
   
    public String getCityCode() {
        return this.cityCode;
    }
    
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
    public Country getCountry() {
        return this.country;
    }
    
    public void setCountry(Country country) {
        this.country = country;
    }
    public String getCityName() {
        return this.cityName;
    }
    
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
    public Set getUserses() {
        return this.userses;
    }
    
    public void setUserses(Set userses) {
        this.userses = userses;
    }




}


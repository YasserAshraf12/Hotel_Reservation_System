package Models;
// Generated Jan 4, 2021 6:34:40 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Country generated by hbm2java
 */
public class Country  implements java.io.Serializable {


     private String countryCode;
     private String countryCurrency;
     private String countryName;
     private Set hotelses = new HashSet(0);
     private Set cities = new HashSet(0);
     private Set userses = new HashSet(0);

    public Country() {
    }

	
    public Country(String countryCode) {
        this.countryCode = countryCode;
    }
    public Country(String countryCode, String countryCurrency, String countryName, Set hotelses, Set cities, Set userses) {
       this.countryCode = countryCode;
       this.countryCurrency = countryCurrency;
       this.countryName = countryName;
       this.hotelses = hotelses;
       this.cities = cities;
       this.userses = userses;
    }
   
    public String getCountryCode() {
        return this.countryCode;
    }
    
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
    public String getCountryCurrency() {
        return this.countryCurrency;
    }
    
    public void setCountryCurrency(String countryCurrency) {
        this.countryCurrency = countryCurrency;
    }
    public String getCountryName() {
        return this.countryName;
    }
    
    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
    public Set getHotelses() {
        return this.hotelses;
    }
    
    public void setHotelses(Set hotelses) {
        this.hotelses = hotelses;
    }
    public Set getCities() {
        return this.cities;
    }
    
    public void setCities(Set cities) {
        this.cities = cities;
    }
    public Set getUserses() {
        return this.userses;
    }
    
    public void setUserses(Set userses) {
        this.userses = userses;
    }




}



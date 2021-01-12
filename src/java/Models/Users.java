package Models;


import java.util.HashSet;
import java.util.Set;

public class Users  implements java.io.Serializable {

    private Integer userId;
    private City city;
    private Country country;
    private UserType userType;
    private String userFirstName;
    private String userLastName;
    private String userEmail;
    private int userAge;
    private String userUserName;
    private String userPassword;
    private String userAddress;
    private String userTelefone;
    private String userProfilePhoto;
    private char userAccountVerified;
    private Set bookingListInserts = new HashSet(0);
    private Set commentses = new HashSet(0);
    private Set bookings = new HashSet(0);
    private Set bookingDeleteHistories = new HashSet(0);
     
    public Users() {
    }

	
    public Users(City city, Country country, UserType userType, String userFirstName, String userLastName, String userEmail, int userAge, String userUserName, String userPassword, char userAccountVerified) {
        this.city = city;
        this.country = country;
        this.userType = userType;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.userEmail = userEmail;
        this.userAge = userAge;
        this.userUserName = userUserName;
        this.userPassword = userPassword;
        this.userAccountVerified = userAccountVerified;
    }
    public Users(City city, Country country, UserType userType, String userFirstName, String userLastName, String userEmail, int userAge, String userUserName, String userPassword, String userAddress, String userTelefone, String userProfilePhoto, char userAccountVerified, Set bookingListInserts, Set commentses, Set bookings, Set bookingDeleteHistories) {
       this.city = city;
       this.country = country;
       this.userType = userType;
       this.userFirstName = userFirstName;
       this.userLastName = userLastName;
       this.userEmail = userEmail;
       this.userAge = userAge;
       this.userUserName = userUserName;
       this.userPassword = userPassword;
       this.userAddress = userAddress;
       this.userTelefone = userTelefone;
       this.userProfilePhoto = userProfilePhoto;
       this.userAccountVerified = userAccountVerified;
       this.bookingListInserts = bookingListInserts;
       this.commentses = commentses;
       this.bookings = bookings;
       this.bookingDeleteHistories = bookingDeleteHistories;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public City getCity() {
        return this.city;
    }
    
    public void setCity(City city) {
        this.city = city;
    }
    public Country getCountry() {
        return this.country;
    }
    
    public void setCountry(Country country) {
        this.country = country;
    }
    public UserType getUserType() {
        return this.userType;
    }
    
    public void setUserType(UserType userType) {
        this.userType = userType;
    }
    public String getUserFirstName() {
        return this.userFirstName;
    }
    
    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }
    public String getUserLastName() {
        return this.userLastName;
    }
    
    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }
    public String getUserEmail() {
        return this.userEmail;
    }
    
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public int getUserAge() {
        return this.userAge;
    }
    
    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }
    public String getUserUserName() {
        return this.userUserName;
    }
    
    public void setUserUserName(String userUserName) {
        this.userUserName = userUserName;
    }
    public String getUserPassword() {
        return this.userPassword;
    }
    
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public String getUserAddress() {
        return this.userAddress;
    }
    
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    public String getUserTelefone() {
        return this.userTelefone;
    }
    
    public void setUserTelefone(String userTelefone) {
        this.userTelefone = userTelefone;
    }
    public String getUserProfilePhoto() {
        return this.userProfilePhoto;
    }
    
    public void setUserProfilePhoto(String userProfilePhoto) {
        this.userProfilePhoto = userProfilePhoto;
    }
    public char getUserAccountVerified() {
        return this.userAccountVerified;
    }
    
    public void setUserAccountVerified(char userAccountVerified) {
        this.userAccountVerified = userAccountVerified;
    }
    public Set getBookingListInserts() {
        return this.bookingListInserts;
    }
    
    public void setBookingListInserts(Set bookingListInserts) {
        this.bookingListInserts = bookingListInserts;
    }
    public Set getCommentses() {
        return this.commentses;
    }
    
    public void setCommentses(Set commentses) {
        this.commentses = commentses;
    }
    public Set getBookings() {
        return this.bookings;
    }
    
    public void setBookings(Set bookings) {
        this.bookings = bookings;
    }
    public Set getBookingDeleteHistories() {
        return this.bookingDeleteHistories;
    }
    
    public void setBookingDeleteHistories(Set bookingDeleteHistories) {
        this.bookingDeleteHistories = bookingDeleteHistories;
    }




}



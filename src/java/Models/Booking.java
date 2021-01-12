package Models;
// Generated Jan 4, 2021 6:34:40 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Booking generated by hbm2java
 */
public class Booking  implements java.io.Serializable {


     private Integer bookingId;
     private BookingStatus bookingStatus;
     private Rooms rooms;
     private Users users;
     private Date dateFrom;
     private Date dateTo;
     private Set bookingDeleteHistories = new HashSet(0);
     private Set bookingRoomUpdates = new HashSet(0);

    public Booking() {
    }

	
    public Booking(BookingStatus bookingStatus, Rooms rooms, Users users, Date dateFrom, Date dateTo) {
        this.bookingStatus = bookingStatus;
        this.rooms = rooms;
        this.users = users;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
    }
    public Booking(BookingStatus bookingStatus, Rooms rooms, Users users, Date dateFrom, Date dateTo, Set bookingDeleteHistories, Set bookingRoomUpdates) {
       this.bookingStatus = bookingStatus;
       this.rooms = rooms;
       this.users = users;
       this.dateFrom = dateFrom;
       this.dateTo = dateTo;
       this.bookingDeleteHistories = bookingDeleteHistories;
       this.bookingRoomUpdates = bookingRoomUpdates;
    }
   
    public Integer getBookingId() {
        return this.bookingId;
    }
    
    public void setBookingId(Integer bookingId) {
        this.bookingId = bookingId;
    }
    public BookingStatus getBookingStatus() {
        return this.bookingStatus;
    }
    
    public void setBookingStatus(BookingStatus bookingStatus) {
        this.bookingStatus = bookingStatus;
    }
    public Rooms getRooms() {
        return this.rooms;
    }
    
    public void setRooms(Rooms rooms) {
        this.rooms = rooms;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public Date getDateFrom() {
        return this.dateFrom;
    }
    
    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }
    public Date getDateTo() {
        return this.dateTo;
    }
    
    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }
    public Set getBookingDeleteHistories() {
        return this.bookingDeleteHistories;
    }
    
    public void setBookingDeleteHistories(Set bookingDeleteHistories) {
        this.bookingDeleteHistories = bookingDeleteHistories;
    }
    public Set getBookingRoomUpdates() {
        return this.bookingRoomUpdates;
    }
    
    public void setBookingRoomUpdates(Set bookingRoomUpdates) {
        this.bookingRoomUpdates = bookingRoomUpdates;
    }




}



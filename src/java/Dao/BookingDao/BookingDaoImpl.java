package Dao.BookingDao;

import Models.Booking;
import Models.Rooms;
import Util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class BookingDaoImpl implements BookingDao{

    @Override
    public Long countBookings() {
        Session session = HibernateUtil.getSession();
        
        if(session != null){
            Transaction tx = session.beginTransaction();
            String hql = "select count(*) from Booking";
            Query query = session.createQuery(hql);
            Long  counter = (Long) query.uniqueResult();
            return counter;
        }
        return -1L;
    }
    
    
//    
//    
   public boolean makeReservation(Booking booking){
      
//          Session session = HibernateUtil.getSession();
////        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            // start a transaction
//              if(session != null){
//            Transaction  transaction = session.beginTransaction();
//
//            String hql = "INSERT INTO Booking (:user , :room, :bookingStatus :dataFrom , :dateTo) " +
//                "SELECT user , :room, :bookibookingngStatus :dataFrom , :dateTo FROM Booking";
//            
//             Query query = session.createQuery(hql);
//             
//            query.setParameter("user", booking.getUsers());
//            query.setParameter("room", booking.getRooms());
//            query.setParameter("bookingStatus", booking.getBookingStatus());
//            query.setParameter("dateFrom", booking.getDateFrom());  
//            query.setParameter("dateTo", booking.getDateTo()); 
//
//            int result = query.executeUpdate();
//            System.out.println("Rows affected: " + result);
//
//            // commit transaction
//            transaction.commit();
//    
//          
//             return true;
//        }
//    
//      return false;}
        
      Session session = HibernateUtil.getSession();
        if (session != null) {
            try {
                if (booking != null) {
                    Integer Id = (Integer) session.save(booking);
                    session.beginTransaction().commit();
                    return true;
                }
            }
            catch (Exception e) {
                return false;
            }

        } else {
            return false;
        }
        return false;

   }
}

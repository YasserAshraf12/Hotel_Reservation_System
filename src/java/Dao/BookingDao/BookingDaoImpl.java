package Dao.BookingDao;

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
    
}

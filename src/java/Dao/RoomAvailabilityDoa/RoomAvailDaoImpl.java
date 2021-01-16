/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.RoomAvailabilityDoa;

import Models.RoomAvailability;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Aya
 */
public class RoomAvailDaoImpl  implements RoomAvailDao{
    
    
       
//    <a href='gallery.jsp?id=" + hotels.get(i).getHotelId() + "'" + " id='viewHotel' class='btn btn-info'>View</a>
//--------------
//FROM Room_Availability R WHERE R.rooms.roomId= :id
//    FROM Models.Rooms R WHERE R.hotels.hotelId = id
//  @Override
//       public RoomAvailability getRoomAvailability(Integer id) {
//        Session session = HibernateUtil.getSession();
//        if(session != null){  
//            Transaction tx = session.beginTransaction();
////            FROM Models.Users U WHERE U.userUserName = (:username)";
//            String hql="FROM RoomAvailability RA WHERE RA.rooms.roomId= :id ";
//            Query query = session.createQuery(hql);
//            query.setParameter("id", id);
//
//          RoomAvailability roomAvailability = (RoomAvailability) query.uniqueResult();
//            if(roomAvailability != null)
//                return roomAvailability;
//            else
//                return null;
//        }
//        return null;
//    
//}
       
       
          @Override
       public List<RoomAvailability> getAvailRooms(Integer id) {
        Session session = HibernateUtil.getSession();
        List<RoomAvailability> list;
        if(session != null){  
            Transaction tx = session.beginTransaction();

              String hql="  From RoomAvailability R Where R.rooms.hotels.hotelId =:id  and R.roomAvailabilityStatus= :Available";

            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            query.setParameter("Available", "Available" );
            list = new ArrayList();
            for(final Object o : query.list()) {
                    list.add((RoomAvailability)o);
            }
            return list;
        }
        return null;
    }
}

       



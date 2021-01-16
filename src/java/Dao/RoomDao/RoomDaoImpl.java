/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.RoomDao;

import Models.RoomAvailability;
import Models.Rooms;
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
public class RoomDaoImpl implements RoomDao {
   
    
     @Override
       public Rooms selectRoomByID(Integer id){
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
              Transaction tx = session.beginTransaction();
        
             String hql="FROM Models.Rooms R WHERE R.roomId = :id  ";
              Query query = session.createQuery(hql);
              query.setParameter("id", id);
               Rooms room = (Rooms) query.uniqueResult();
             if(room != null)
                return room;
             else      
                  return null;
        }
        return null;
    }
    

    
//          @Override
//       public List<RoomAvailability> getRooms(Integer id) {
//        Session session = HibernateUtil.getSession();
//        List<RoomAvailability> list;
//        if(session != null){  
//            Transaction tx = session.beginTransaction();
////            FROM Models.Users U WHERE U.userUserName = (:username)";
////            String hql="FROM Models.Rooms R WHERE R.hotels.hotelId = :id  "
//              String hql="  From RoomAvailability R Where R.rooms.hotels.hotelId =:id  and R.roomAvailabilityStatus=Available";
//
////                String hql="select *  from   Models.Rooms R inner join  Models.RoomAvailability RA on R.hotels.hotelId  = id and  RA.rooms.roomId  = R.roomId and  RA.avail_status='Available'"
////                          (select * from table1 R inner join table2 RA on R.roomId = RA.roomId) as d Where d.avail_status = "Availability";
//
////    join cat.kittens kitten
////group by cat.id, cat.weight
////        
////        select mother, offspr, mate.name
////from DomesticCat as mother
////    inner join mother.mate as mate
////    left outer join mother.kittens as offspr
//
//
////                    + "and   R.hotels.hotelId =:Available";
//            Query query = session.createQuery(hql);
//            query.setParameter("id", id);
//            list = new ArrayList();
//            for(final Object o : query.list()) {
//                    list.add((RoomAvailability)o);
//            }
//            return list;
//        }
//        return null;
//    }
}

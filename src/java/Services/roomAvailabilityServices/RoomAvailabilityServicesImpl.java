/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.roomAvailabilityServices;

import Dao.RoomAvailabilityDoa.RoomAvailDao;
import Dao.RoomAvailabilityDoa.RoomAvailDaoImpl;
import Models.RoomAvailability;
import java.util.List;

/**
 *
 * @author Aya
 */
public class RoomAvailabilityServicesImpl implements RoomAvailabilityServices {
      private final RoomAvailDao RADao = new RoomAvailDaoImpl();
//       public RoomAvailability getRoomAvailability(Integer id) {
//      
//           return  RADao.getRoomAvailability();
//       }
         public List<RoomAvailability> getAvailRooms(Integer id){
          return  RADao.getAvailRooms( id );
         }
}

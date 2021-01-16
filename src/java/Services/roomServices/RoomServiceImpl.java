/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services.roomServices;

import Dao.RoomDao.RoomDao;
import Dao.RoomDao.RoomDaoImpl;
import Models.RoomAvailability;
import Models.Rooms;
import java.util.List;

/**
 *
 * @author Aya
 */
public class RoomServiceImpl implements RoomService {

//      private final RoomDao roomDao = new RoomDaoImpl();
//      @Override
//    public List<RoomAvailability> getRooms(Integer Id) {
//        return roomDao.getRooms(Id);
//    }

//       public List<Comments> getLastComments() {
//        return commentDao.getLastComments();
//    }

 private final RoomDao RADao = new RoomDaoImpl();
  public Rooms selectRoomByID(Integer id){
  
     return  RADao.selectRoomByID( id );
  }
}

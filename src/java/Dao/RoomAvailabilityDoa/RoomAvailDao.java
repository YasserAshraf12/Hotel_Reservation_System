/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.RoomAvailabilityDoa;

/**
 *
 * @author Aya
 */



import Models.RoomAvailability;
import java.util.List;

public interface RoomAvailDao {

//  public RoomAvailability getRoomAvailability(Integer id);
  public List<RoomAvailability> getAvailRooms(Integer id);
    
}

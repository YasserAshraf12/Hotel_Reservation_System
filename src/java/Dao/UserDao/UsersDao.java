package Dao.UserDao;

import Models.Users;
import java.util.List;

public interface UsersDao {
    
    public boolean login(String username, String password);
    public boolean register(Users user);
    public Users selectByUsername(String username);
    public Users selectByID(Integer Id);
    public Long countUsers();
    public boolean updateUser(Users user);
    public List<Users> selectAllUser();
    public boolean deleteUser(Integer id);
}

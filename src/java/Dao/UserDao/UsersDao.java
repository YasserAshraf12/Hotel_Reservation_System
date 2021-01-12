package Dao.UserDao;

import Models.Users;

public interface UsersDao {
    
    public boolean login(String username, String password);
    public boolean register(Users user);
    public Users selectByUsername(String username);
    public Users selectByID(Integer Id);
    public Long countUsers();
}

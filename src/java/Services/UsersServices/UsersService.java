package Services.UsersServices;

import Models.Users;

public interface UsersService {
    
    public boolean login(String username, String password); 
    public boolean registration(Users user);
    public Users selectByUsername(String username);
    public Users selectByID(Integer Id);
    public Long countUsers();
}

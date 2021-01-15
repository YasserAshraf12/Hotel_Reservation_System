package Services.UsersServices;

import Dao.UserDao.UsersDao;
import Dao.UserDao.UsersDaoImpl;
import Models.Users;
import java.util.List;

public class UserServiceImpl implements UsersService{

    private final UsersDao loginDao = new UsersDaoImpl();

    @Override
    public boolean login(String username, String password) {
        return loginDao.login(username, password);
    }

    @Override
    public boolean registration(Users user) {
        return loginDao.register(user);
    }

    @Override
    public Users selectByUsername(String username) {
        return loginDao.selectByUsername(username);
    }

    @Override
    public Users selectByID(Integer Id) {
        return loginDao.selectByID(Id);
    }

    @Override
    public Long countUsers() {
        return loginDao.countUsers();
    }

    @Override
    public boolean updateUser(Users user) {
         return loginDao.updateUser(user);
    }

    @Override
    public List<Users> selectAllUser() {
        return loginDao.selectAllUser();
    }

    @Override
    public boolean deleteUser(Integer id) {
        return loginDao.deleteUser(id);
    }
}

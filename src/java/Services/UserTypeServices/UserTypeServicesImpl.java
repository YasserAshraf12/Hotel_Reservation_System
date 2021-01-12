
package Services.UserTypeServices;

import Dao.UserType.UserTypeDao;
import Dao.UserType.UserTypeDaoImpl;
import Models.UserType;

public class UserTypeServicesImpl implements UserTypeServices {

    UserTypeDao userType = new UserTypeDaoImpl();
    
    @Override
    public UserType selectById(Integer id) {
        return userType.selectById(id);
    }
    
}

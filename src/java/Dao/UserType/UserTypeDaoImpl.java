package Dao.UserType;

import Models.UserType;
import Util.HibernateUtil;
import org.hibernate.Session;

public class UserTypeDaoImpl implements UserTypeDao{

    @Override
    public UserType selectById(Integer id) {
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            UserType userType = (UserType) session.get(UserType.class, id);
            if(userType != null)
                return userType;
            return null;
        }
        return null;
    }
    
}
    
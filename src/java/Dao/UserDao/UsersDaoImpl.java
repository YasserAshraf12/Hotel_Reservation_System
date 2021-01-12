package Dao.UserDao;

import Models.Users;
import Util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UsersDaoImpl implements UsersDao{

    @Override
    public boolean login(String username, String password) {
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Transaction tx = session.beginTransaction();
            String hql = "FROM Models.Users U WHERE U.userUserName = (:username)";
            Query query = session.createQuery(hql);
            query.setParameter("username", username);
            Users user = (Users) query.uniqueResult();
            if(user != null){
                if (password.equals(user.getUserPassword().trim())) 
                    return true;
                else
                    return false;
            }else
                return false;
        }
        else
            return false;
    }
    
    @Override
    public boolean register(Users user) {
        Session session = HibernateUtil.getSession();
        if (session != null) {
            try {
                if (user != null) {
                    Integer Id = (Integer) session.save(user);
                    session.beginTransaction().commit();
                    return true;
                }
            }
            catch (Exception e) {
                return false;
            }

        } else {
            return false;
        }
        return false;
    }

    @Override
    public Users selectByUsername(String username) {
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Transaction tx = session.beginTransaction();
            String hql = "FROM Models.Users U WHERE U.userUserName = (:username)";
            Query query = session.createQuery(hql);
            query.setParameter("username", username);
            Users user = (Users) query.uniqueResult();
            if(user != null)
                return user;
            else
                return null;
        }
        return null;
    }
    public Users selectByID(Integer Id){
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Users user = (Users) session.get(Users.class, Id);
            if(user != null)
                return user;
            return null;
        }
        return null;
    }

    @Override
    public Long countUsers() {
        Session session = HibernateUtil.getSession();
        
        if(session != null){
            Transaction tx = session.beginTransaction();
            String hql = "select count(*) from Users";
            Query query = session.createQuery(hql);
            Long  counter = (Long) query.uniqueResult();
            return counter;
        }
        return -1L;
    }
}
    


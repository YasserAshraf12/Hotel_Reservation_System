package Dao.UserDao;

import Models.Users;
import Services.CommentsServices.CommentServices;
import Services.CommentsServices.CommentServicesImpl;
import Util.HibernateUtil;
import static java.lang.System.console;
import java.util.ArrayList;
import java.util.List;
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

    @Override
     public boolean updateUser(Users user){
    
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Transaction tx = session.beginTransaction();
           
            String hql = "UPDATE Users SET "
                    + "userFirstName= :userfirstname, userLastName= :userlastname, userAddress= :useraddress, "
                    + "userAge= :userage, userPassword= :userpassword, userTelefone= :userphone, "
                    + "country= :country, city= :city, userProfilePhoto= :photo"
                    + " WHERE userUserName = :username";

            Query query = session.createQuery(hql);
            query.setParameter("username", user.getUserUserName());
            query.setParameter("userfirstname", user.getUserFirstName());
            query.setParameter("userlastname", user.getUserLastName());
            query.setParameter("useraddress", user.getUserAddress());
            query.setParameter("userage", user.getUserAge());
            query.setParameter("userpassword", user.getUserPassword());
            query.setParameter("userphone", user.getUserTelefone());
            query.setParameter("country", user.getCountry());
            query.setParameter("city", user.getCity());
            query.setParameter("photo", user.getUserProfilePhoto());

            
            int status=query.executeUpdate();
            tx.commit();
            
            if( status <1){
            
            return false;
            }
            return true;
            }
        return false;
    }

    @Override
    public List<Users> selectAllUser() {
            Session session = HibernateUtil.getSession();
            List list;
            if (session != null) {
                Transaction tx = session.beginTransaction();
                String hql = "From Users U Where U.userType.typeId= :typeId";
                Query query = session.createQuery(hql);
                query.setParameter("typeId", 2);
                list = new ArrayList();
                for(final Object o : query.list()) {
                      list.add((Users)o);
                }
                return list;
            }
            return null;
    }

    @Override
    public boolean deleteUser(Integer id) {
        CommentServices commentServices = new CommentServicesImpl();
        commentServices.deleteComment(id);
        Session session = HibernateUtil.getSession();
        
        if (session != null) {
            Transaction tx = session.beginTransaction();
            String hql = "DELETE FROM Users U WHERE U.userId= :id";
            Query query = session.createQuery(hql);
            query.setInteger("id", id);
            int r = query.executeUpdate();
            tx.commit(); 
           return true;
        }
        return false;
    }
}
    


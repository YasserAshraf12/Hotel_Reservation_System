
package Dao.CommentDao;

import Models.Comments;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class CommentDaoImpl implements CommentDao{

    @Override
    public List<Comments> getRandomComments() {
        Session session = HibernateUtil.getSession();
        List<Comments> list;
        if(session != null){
            Transaction tx = session.beginTransaction();
            String hql = "FROM Comments ORDER BY RAND()";
            Query query = session.createQuery(hql);
            query.setFirstResult(0);
            query.setMaxResults(3);
            list = new ArrayList();
            for(final Object o : query.list()) {
                list.add((Comments)o);
            }
            return list;
        }
        return null;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao.HotelDao;

import Models.Hotels;
import Models.Users;
import Util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Top
 */
public class HotelsDaoImpl implements HotelsDao{

    @Override
    public Long countHotels() {
        Session session = HibernateUtil.getSession();

        if(session != null){
            Transaction tx = session.beginTransaction();
            String hql = "select count(*) from Hotels";
            Query query = session.createQuery(hql);
            Long  counter = (Long) query.uniqueResult();
            return counter;
        }
        return -1L;
    }

    @Override
    public List<Hotels> selectHotels() {
        Session session = HibernateUtil.getSession();
        List list;
        if(session != null){
            String hql="FROM Hotels";
            Query query = session.createQuery(hql);
            list = new ArrayList();
            for(final Object o : query.list()) {
                    list.add((Hotels)o);
            }
            return list;
        }
        return null;
    }
    
    
}
